#!/bin/bash

if [ -z "$1" -o ! -f "$1" ]; then
  echo "usage: $0 blog.rc"
  echo
  echo "This script updates blog entries files created with blog"
  echo "versions 1.2 and earlier."
  exit 1
fi

. $1

tempfile=$tempdir/blog-temp-`date +%s`
gzip -cd $localpath/entries.*.gz | csplit -b %04d -qz -f \
  $tempdir/blog-entry- - "/##BEGIN_HEAD.*##$/" {*}

dummyid=$(ls $tempdir/blog-entry-* | wc -l )
count=0
entryfiles=0

for file in $tempdir/blog-entry-*; do
  csplit -zq -f $file-sect- $file "/##BEGIN_HEAD.*##$/" \
    "/##BEGIN_ENTRY.*##$/+1" "/##END_ENTRY.*##$/"
  . $file-sect-00
  entryid=$(printf %04d $dummyid)

  echo "##BEGIN_HEAD $entrydate $entrytitle##" >> $localpath/entries.$entryfiles
  echo "entryid=\"$entryid\"" >> $localpath/entries.$entryfiles
  echo "entrydate=\"$entrydate\"" >> $localpath/entries.$entryfiles
  echo "entrytitle=\"$entrytitle\"" >> $localpath/entries.$entryfiles
  echo "##BEGIN_ENTRY $entrydate $entrytitle##" >> $localpath/entries.$entryfiles
  cat $file-sect-01 >> $localpath/entries.$entryfiles
  echo "##END_ENTRY $entrydate $entrytitle##" >> $localpath/entries.$entryfiles

  let "dummyid = dummyid - 1"
  let "count = count + 1"
  if [ $totalentries -gt 0 -a $count -ge $totalentries ]; then
    count=0
    let "entryfiles = entryfiles + 1"
  fi
  rm -f $tempdir/$file*
done

for file in $localpath/entries.*; do
  gzip -f $file
done

rm -f $tempdir/blog-entry-*
