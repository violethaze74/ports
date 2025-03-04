# ex:ts=8 sw=4:
# $OpenBSD: Grabber.pm,v 1.48 2023/05/06 05:20:31 espie Exp $
#
# Copyright (c) 2010-2013 Marc Espie <espie@openbsd.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
use v5.36;


use DPB::Vars;
use DPB::Util;

# the "grabber" is mostly the glue around the "var" code:
# - DPB::Vars calls make dump-vars on the correct subdirlist, and 
# parses the pipe output
# - DPB::Grabber is responsible for figuring out the right options from state
# and iterating until it gets what it needs
# - DPB::Vars grabs some pipe output, one block at a time, and defers to 
# DPB::Grabber to know what to do.
# - periodically, DPB::Grabber lets the rest of dpb "run" (checking for
# finished jobs and starting new ones) through eventloopcode.
# Mostly, init as:
#     $grabber = DPB::Grabber->new($state, \&eventloopcode);
# prime with one or several calls to:
#     $grabber->grab_subdirs($core, $list, $skip, $ignoreerrors);
# finish figuring out what we missed as:
#     $grabber->complete_subdirs($core, $skip);
# (core is a "virtual cpu", local of otherwise, that accounts of what we
# do, which is passed to Vars to run a pipe job)

package DPB::Grabber;
sub new($class, $state, $eventloopcode)
{

	my $o = bless { 
		loglist => DPB::Util->make_hot($state->logger->append("vars")),
		engine => $state->engine,
		builder => $state->builder,
		state => $state,
		errors => 0,
		do_later => 1,
		later => [],
		eventloopcode => $eventloopcode
	    }, $class;
	if (defined $state->{subst}->value('FTP_ONLY')) {
		$o->{ftp_only} = 1;
	}
	my @values = ();
	if ($state->{want_fetchinfo} || $state->{roach}) {
		require DPB::Fetch;
		push(@values, 'fetch');
		$o->{fetch} = DPB::Fetch->new($state->distdir, $state->logger,
		    $state, $o->{ftp_only});
	} else {
		$o->{fetch} = DPB::FetchDummy->new;
	}
	if ($state->{roach}) {
		require DPB::Roach;
		push(@values, 'roach');
		$o->{roach} = DPB::Roach->new($state->engine, $state->logger,
		    $state);
	} else {
		$o->{roach} = DPB::RoachDummy->new;
	}
	if ($state->{test}) {
		push(@values, 'test');
	}
	$o->{dpb} = join(' ',  @values);
	return $o;
}

sub expire_old_distfiles($self, $core, $opt_e)
{
	# don't bother if dump-vars wasn't perfectly clean
	return 0 if $self->{errors};
	return $self->{fetch}->run_expire_old($core, $opt_e);
}

sub add_to_build($self, $v)
{
	if ($self->{do_later}) {
		if (defined $v->{info} && $v->{info}->has_property('later')) {
			push(@{$self->{later}}, $v);
			return;
		}
	}
	$self->{engine}->new_path($v);
}

sub later($self)
{
	$self->{do_later} = 0;
	return @{$self->{later}};
}

sub finish($self, $h)
{
	for my $v (values %$h) {
		if ($v->{broken}) {
			$self->{engine}->add_fatal($v, $v->{broken});
			delete $v->{broken};
		} else {
			if ($v->{wantbuild}) {
				delete $v->{wantbuild};
				delete $v->{wantfetch};
				$self->add_to_build($v);
			}
			if ($v->{wantfetch}) {
				delete $v->{wantfetch};
				$self->{engine}->new_fetch_path($v);
			}
			if ($v->{dontjunk}) {
				$self->{builder}->dontjunk($v);
			}
		}
	}
	$self->{engine}->flush_log;
	&{$self->{eventloopcode}}();
}

sub ports($self)
{
	return $self->{state}->ports;
}

sub make($self)
{
	return $self->{state}->make;
}

sub make_args($self)
{
	return $self->{state}->make_args;
}

sub logger($self)
{
	return $self->{state}->logger;
}

sub forget_cache($self)
{
	$self->{fetch}->forget_cache;
}

sub grab_subdirs($self, $core, $list, $skip, $ignore_errors = 0)
{
	$core->unsquiggle;
	DPB::Vars->grab_list($core, $self, $list, $skip, $ignore_errors,
	    $self->{loglist}, $self->{dpb},
	    sub($h) {
	    	# during the first step, we actually WANT to add new dirs
		# whereas 'complete" will only record what's found
		for my $v (values %$h) {
			$v->{wantbuild} = 1;
		}
		$self->finish($h);
	});
}

# Two extra things we can do besides running dump-vars, that use the
# exact same logic
sub grab_signature($self, $core, $pkgpath)
{
	return DPB::PortSignature->grab_signature($core, $self, $pkgpath);
}

sub clean_packages($self, $core, $pkgpath)
{
	return DPB::CleanPackages->clean($core, $self, $pkgpath);
}

sub find_new_dirs($self)
{
	my $subdirlist = {};
	for my $v (DPB::PkgPath->seen) {
		if (defined $v->{info}) {
			delete $v->{tried};
			delete $v->{wantinfo};
			if (defined $v->{wantbuild}) {
				delete $v->{wantbuild};
				delete $v->{wantfetch};
				$self->{engine}->new_path($v);
			}
			if (defined $v->{wantfetch}) {
				delete $v->{wantfetch};
				$self->{engine}->new_fetch_path($v);
			}
			if (defined $v->{dontjunk}) {
				$self->{builder}->dontjunk($v);
			}
			next;
		}
		next if defined $v->{category};
		if (defined $v->{tried}) {
			# log error the first time only!
			$self->{engine}->add_fatal($v, ["tried and didn't get it"]) 
			    if !defined $v->{errored};
			$v->{errored} = 1;
			$self->{errors}++;
		} elsif ($v->{wantinfo} || $v->{wantbuild}) {
			$v->add_to_subdirlist($subdirlist);
			$v->{tried} = 1;
		}
	}
	return $subdirlist;
}

sub complete_subdirs($self, $core, $skip = undef)
{
	while (1) {
		my $subdirlist = $self->find_new_dirs;
		$self->{engine}->flush_log;
		last if (keys %$subdirlist) == 0;

		DPB::Vars->grab_list($core, $self, $subdirlist, $skip, 0,
		    $self->{loglist}, $self->{dpb},
		    sub($h) {
			$self->finish($h);
		    });
	}
}

package DPB::FetchDummy;
sub new($class)
{
	return bless {}, $class;
}

sub build_distinfo($, $, $, $)
{
}

sub run_expire_old($, $, $)
{
	return 0;
}

sub forget_cache($self)
{
       $self->{cache} = {};
}

package DPB::RoachDummy;
sub new($class)
{
	return bless {}, $class;
}

sub build1info($, $)
{
}

1;
