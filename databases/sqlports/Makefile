CATEGORIES =		databases
V =			7.38
DISTNAME =		sqlports-$V
DISTFILES =
COMMENT-main =		sqlite database of ports
COMMENT-list =		full list of pkgpaths in ports
MAINTAINER =		Marc Espie <espie@openbsd.org>
PKGNAME-list =		portslist-$V

PERMIT_PACKAGE =	Yes
MULTI_PACKAGES =	-main -list

DBNAME =		sqlports
SQLCACHE =		${DBNAME}_cache.sql
SQLVIEWS =		${DBNAME}_views.sql
DBS =			${DBNAME}.list ${DBNAME} ports-INDEX ${SQLCACHE}
BUILD_DEPENDS =		databases/p5-DBD-SQLite \
			databases/sqlite3
RUN_DEPENDS-main =	databases/sqlite3
FLAVORS =	nonstrict
FLAVOR =

.if ${FLAVOR:Mnonstrict}
STRICT =
.else
STRICT =-s
.endif

# for debugging the ports tree purposes, start at this dir
#STARTDIR = -S games/stepmania
SCRIPTS = print-ports-index show-reverse-deps rebuild-sqlports-cache
MANS = show-reverse-deps.1 sqlports.5

do-build:
	@PORTSDIR=${PORTSDIR} ${MAKE_ENV} perl ${FILESDIR}/mksqlitedb -v -V $V -p ${WRKBUILD}/ouch ${STRICT} -C ${WRKBUILD}/${SQLCACHE} -w ${WRKBUILD}/${SQLVIEWS} ${STARTDIR} ${WRKBUILD}/${DBNAME}
	@if test -s ${WRKBUILD}/ouch; then \
		cat ${WRKBUILD}/ouch; \
		exit 1; \
	fi
	cd ${WRKBUILD} && sqlite3 <${SQLCACHE} ${DBNAME}

alter-tables:
	@${MAKE_ENV} ${SUDO} -u ${BUILD_USER} perl ${FILESDIR}/rebuild_schema -v -V $V ${WRKBUILD/${DBNAME}
	@${SUDO} -u ${BUILD_USER} ${MAKE} post-build

post-build:
	@cd ${WRKBUILD} && ${LOCALBASE}/bin/sqlite3 ${DBNAME} 'select min(_paths.fullpkgpath) from _paths join _ports on _paths.id=_ports.fullpkgpath where _ports.static_plist=1 group by fullpkgname order by _paths.fullpkgpath' >${DBNAME}.list
	@cd ${WRKBUILD} && sh ${FILESDIR}/scripts/print-ports-index ${DBNAME} >ports-INDEX

do-install:
	if [[ `wc -l < ${WRKBUILD}/ports-INDEX` -le 666 ]]; then echo "Unexpectedly short file."; exit 1; fi
	${INSTALL_PROGRAM_DIR} ${PREFIX}/bin
.for s in ${SCRIPTS}
	@${SUBST_PROGRAM} ${FILESDIR}/scripts/$s ${PREFIX}/bin/$s
.endfor
.for s in ${MANS}
	@${SUBST_MAN} ${FILESDIR}/man/$s ${PREFIX}/man/man${s:E}/$s
.endfor
	@for i in ${DBS}; do \
		${INSTALL_DATA} ${WRKBUILD}/$$i ${PREFIX}/share; \
	done

NO_TEST =		Yes
NO_CHECKSUM =		Yes

.include <bsd.port.mk>
