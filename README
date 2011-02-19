BLOG is a simple, command-line based website maintainence tool.

It is a Bourne-again shell script, which makes use of a number of other
programs in order to perform its functions. In the very least, you need
the following programs to install and run blog:

	bash cat cd csplit date echo egrep getopt gzip install
	ls make mv perl printf rm

This list is exhaustive. You also need a visual editor, such as Vim or
Emacs, and a pager, like more or less. To upload files you need rsync,
available at <http://rsync.samba.org/>, and a remote shell program such
as rsh or (I recommend) ssh. Optionally, you can spell-check entries with
ispell, and check generated HTML syntax with HTML Tidy, available at
<http://tidy.sourceforge.net/>.

UPGRADING
=========

If you were using blog 1.2 or earlier, you must run the `update-2.0.sh'
script to convert the entries files to the new format.

RUNNING
=======

Blog makes use of a number of options, contained in an "rc" file,
usually called .blogrc in your home directory. If you are running blog
for the first time, you will be prompted for the values of each of these
options. Also see the file "blog.rc" in this directory for a sample rc
file, and the man page for a description of each option.

See the man page for an explanation of how to run blog, or do

	blog --help

for a brief overview.

TEMPLATES
=========

This program uses four template files. One formats single entries, and
interpolates three entities:

	<-blogentrytitle-> -- This will be replaced by this entry's
	                      title, prompted for when adding entries.
	
	 <-blogentrydate-> -- This will be replaced by the formatted
	                      date that this entry was added on.

	 <-blogentrybody-> -- This is replaced by the entry itself,
	                      which you create using your editor.

	   <-blogentryid-> -- This is replaced with an identifier unique
	                      to this entry.

See "entry.template" for an example.

The main index and archive template have an identical format, and
interpolates a single entity:

	<-blogentries-> -- This is replaced by a number of entries (this
	                   number is governed by the "maxentries" option
	                   in the rc file), all formatted using the
	                   entry template described above.

See also "main.template" for an example.

The template for individual entries has the exact same semantics as the
single entry template. This template is only used if you decide to turn
indivdual page generation on (it is off by default). See
"indiv.template" for an example.

All of these template files should exist in the directory where you want
to keep local copies of everything -- the "localpath" option in the rc
file.

PERMA-LINKS
===========

Blog 2.0 and later supports "perma-links" (links to entries that are
always at the same URL) through the generation of individual pages and
the "entry ID" variable, and the "<-blogentryid->" entity.

To implement perma-links, say we have the following in our blog.rc file:

	individual=yes
	indivDir=entries
	indivTemplate=indiv.template
	indivSuffix=.html

Then, in our entries template, we create a link that looks like this:

	<a href="entries/<-blogentryid->.html">Perma-link</a>

