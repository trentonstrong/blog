AC_INIT(blog, 2.2, rsdio@metastatic.org)
AM_INIT_AUTOMAKE(blog, 2.2)
AC_CHECK_PROG(BASH, bash, `which bash`)
if test -z "$BASH";
then
	AC_MSG_ERROR([the Bourne-again shell is required, but was not found.])
fi
AC_CHECK_PROG(PERL, perl, `which perl`)
if test -z "$PERL";
then
	AC_MSG_ERROR([a Perl interpreter is required, but was not found.])
fi
AC_CHECK_PROG(RSYNC, rsync, `which rsync`)
if test -z "$RSYNC";
then
	AC_MSG_WARN([rsync not found. Uploading will be disabled.])
fi
AC_CHECK_PROG(ISPELL, ispell, `which ispell`)
if test -z "$ISPELL";
then
	AC_MSG_WARN([ispell not found. No spellchecking will be done])
fi
AC_CHECK_PROG(TIDY, tidy, `which tidy`)
if test -z "$TIDY";
then
	AC_MSG_WARN([HTML Tidy not found. I won't validate HTML])
fi
AC_OUTPUT([Makefile])
