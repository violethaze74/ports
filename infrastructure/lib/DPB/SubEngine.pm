# ex:ts=8 sw=4:
# $OpenBSD: SubEngine.pm,v 1.36 2023/05/06 05:20:31 espie Exp $
#
# Copyright (c) 2010 Marc Espie <espie@openbsd.org>
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

package DPB::SubEngine;
sub new($class, $engine)
{
	bless { engine => $engine, queue => $class->new_queue($engine),
		doing => {}, later => {}}, $class;
}

# the 'detain' mechanism:
# when rescanning ports, we wipe out the old info.
# stuff that's already in the queues is thus incomplete (no pkgnames,
# no sha info). Instead of going thru the whole process of registering
# them again, we use detain/release, and the subengines skip over detained
# stuff.

sub detain($self, $v)
{
	$self->{detained}{$self->key_for_doing($v)} = 1;
}

sub release($self, $v)
{
	my $k = $self->key_for_doing($v);
	delete $self->{detained}{$k};
	for my $candidate (values %{$self->{later2}}) {
		if ($self->key_for_doing($candidate) eq $k) {
			delete $self->{later2}{$candidate};
			$self->log('x', $candidate);
			$self->add($candidate);
		}
	}
}

sub detained($self, $v)
{
	return $self->{detained}{$self->key_for_doing($v)};
}

sub count($self)
{
	return $self->{queue}->count;
}

sub add($self, $v)
{
	$self->{queue}->add($v);
}

sub remove($self, $v)
{
	$self->{queue}->remove($v);
}

sub dump_queue($self, @r)
{
	$self->{queue}->dump(@r);
}

sub is_done_quick($self, @r)
{
	return $self->is_done(@r);
}

sub is_done_or_enqueue($self, @r)
{
	return $self->is_done(@r);
}

sub sorted($self, $core)
{
	return $self->{queue}->sorted($core);
}

sub non_empty($self)
{
	return $self->{queue}->non_empty;
}

sub contains($self, $v)
{
	return $self->{queue}->contains($v);
}

sub log($self, @r)
{
	return $self->{engine}->log(@r);
}

sub key_for_doing($self, $v)
{
	return $v;
}

sub already_done($, $)
{
}

sub lock_and_start_build($self, $core, $v)
{
	$self->remove($v);

	if (my $lock = $self->{engine}{locker}->lock($v)) {
		$self->{doing}{$self->key_for_doing($v)} = 1;
		$self->start_build($v, $core, $lock);
		return 1;
	} else {
		push(@{$self->{engine}{locks}}, $v);
		$self->log('L', $v);
		return 0;
	}
}

sub use_core($self, $core, $rechecked)
{
	if ($self->preempt_core($core)) {
		return 1;
	}

	my $o = $self->sorted($core);

	# first pass, try to find something we can build
	while (my $v = $o->next) {
		next if $self->detained($v);
		# trim stuff that's done
		if ($self->is_done($v)) {
			$self->already_done($v);
			$self->done($v);
		} elsif ($self->can_really_start_build($v, $core)) {
			return 1;
		}
	}
	if (!$rechecked && $self->recheck_mismatches($core)) {
		return 1;
	}
	return 0;
}

sub can_really_start_build($self, $v, $core)
{
	# ... trim stuff that's related to other stuff building
	if ($self->{doing}{$self->key_for_doing($v)}) {
		$self->remove($v);
		$self->{later}{$v} = $v;
		$self->log('^', $v);
		return 0;
	# as well as stuff that's getting rescanned
	} elsif ($self->detained($v)) {
		$self->remove($v);
		$self->{later2}{$v} = $v;
		$self->log('X', $v);
		return 0;
	} else {
		return $self->can_start_build($v, $core);
	}
}

sub start($self)
{
	my $core = $self->get_core;

	if ($self->use_core($core, 0)) {
		return 1;
	} else {
		$core->mark_ready;
		return 0;
	}
}

sub preempt_core($, $)
{
	return 0;
}

sub can_start_build($self, $v, $core)
{
	return $self->lock_and_start_build($core, $v);
}

sub recheck_mismatches($, $)
{
	return 0;
}

sub done($self, $v)
{
	my $k = $self->key_for_doing($v);
	for my $candidate (values %{$self->{later}}) {
		if ($self->key_for_doing($candidate) eq $k) {
			delete $self->{later}{$candidate};
			$self->log('V', $candidate);
			$self->add($candidate);
		}
	}
	delete $self->{doing}{$self->key_for_doing($v)};
	$self->{engine}->recheck_errors;
}

sub end($self, $core, $v, $fail)
{
	my $e = $core->mark_ready;
	if ($fail) {
		$core->failure;
		if (!$e || $core->{status} == 65280) {
			$self->add($v);
			$self->{engine}{locker}->unlock($v);
			$self->log('N', $v);
		} else {
			# XXX in case some packages got built
			$self->is_done($v);
			unshift(@{$self->{engine}{errors}}, $v);
			$v->{host} = $core->host;
			$self->log('E', $v);
			if ($core->prop->{always_clean}) {
				$self->end_build($v);
			}
		}
	} else {
		if ($self->is_done_or_enqueue($v)) {
			$v->log_as_built($self->{engine});
			$self->{engine}{locker}->unlock($v);
		} else {
			push(@{$self->{engine}{nfslist}}, $v);
		}
		$self->end_build($v);
		$core->success;
	}
	$self->done($v);
	$self->{engine}->flush_log;
}

sub dump($self, $k, $fh)
{
#	$self->{queue}->dump($k, $fh);
}

sub remove_stub($, $)
{
}

sub is_dummy($)
{
	return 0;
}

package DPB::SubEngine::BuildBase;
our @ISA = qw(DPB::SubEngine);

sub new_queue($class, $engine)
{
	return $engine->{heuristics}->new_queue;
}

sub new($class, $engine, $builder = undef)
{
	my $o = $class->SUPER::new($engine);
	$o->{builder} = $builder;
	return $o;
}

sub get_core($self)
{
	return $self->{builder}->get;
}

sub preempt_core($self, $core)
{
	if (@{$self->{engine}{requeued}} > 0) {
		# XXX note this borrows the core temporarily
		$self->{engine}->rebuild_info($core);
	}
	return 0;
}

sub smart_dump($self, $fh)
{
	my $h = {};
	my $engine = $self->{engine};

	for my $v (values %{$engine->{tobuild}}) {
		$v->{info}{problem} = 'not built';
		$v->{info}{missing} = $v->{info}{DEPENDS};
		$h->{$v} = $v;
	}

	for my $v (values %{$engine->{built}}) {
		$v->{info}{problem} = 'not installable';
		$v->{info}{missing} = $v->{info}{RDEPENDS};
		$h->{$v} = $v;
	}
	for my $v (@{$engine->{errors}}) {
		$v->{info}{problem} = "errored";
		$h->{$v} = $v;
	}
	for my $v (@{$engine->{locks}}) {
		$v->{info}{problem} = "locked";
		$h->{$v} = $v;
	}
	my $cache = {};
	for my $v (sort {$a->fullpkgpath cmp $b->fullpkgpath}
	    values %$h) {
		if (defined $cache->{$v->{info}}) {
			print $fh $v->fullpkgpath, " same as ",
			    $cache->{$v->{info}}, "\n";
			next;
		}
		print $fh $v->fullpkgpath, " ", $v->{info}{problem};
		if (defined $v->{info}{missing}) {
			$self->follow_thru($v, $fh, $v->{info}{missing});
			#print $fh " ", $v->{info}{missing}->string;
		}
		print $fh "\n";
		$cache->{$v->{info}} = $v->fullpkgpath;
	}
	print $fh '-'x70, "\n";
}

sub follow_thru($self, $v, $fh, $list)
{
	my @d = ();
	my $known = {$v => $v};
	while (1) {
		my $w = (values %$list)[0];
		push(@d, $w);
		if (defined $known->{$w}) {
			last;
		}
		$known->{$w} = $w;
		if (defined $w->{info}{missing}) {
			$list = $w->{info}{missing};
		} else {
			last;
		}
	}
	print $fh " ", join(' -> ', map {$_->logname} @d);
}

# for parts of dpb that won't run
package DPB::SubEngine::Dummy;
our @ISA = qw(DPB::SubEngine::BuildBase);
sub non_empty($)
{
	return 0;
}

sub is_done($, $)
{
	return 0;
}

sub start_build($, $, $, $)
{
	return 0;
}

sub start_wipe($, $, $)
{
	return 0;
}

sub is_dummy($)
{
	return 1;
}

sub smart_dump($, $)
{
	# don't bother
}
1;
