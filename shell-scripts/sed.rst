==============
GNU sed editor
==============

- A Stream EDitor is used to perform basic transformations on text read from a file or a pipe.
- The result is sent to standard output.
- The syntax for the sed command has no output file specification, but results can be saved
to a file using output redirection.
- The editor does not modify the original input.
- What distinguishes sed from other editors, such as vi and ed, is its ability to filter text that it gets from a
pipeline feed.
- You do not need to interact with the editor while it is running; that is why sed is sometimes
called a batch editor.
- This feature allows use of editing commands in scripts, greatly easing repetitive editing
tasks.
- When facing replacement of text in a large number of files, sed is a great help.

sed commands
------------

The sed program can perform text pattern substitutions and deletions using regular expressions, like the ones used with the grep command
The editing commands are similar to the ones used in the vi editor:

=======  ==============================================
command  Result
-------  ----------------------------------------------

a\       Append text below current line

c\       Change text in the current line with new text

d        Delete text

i\       Insert text above current line

p        Print text

r        Read a file

s        Search and replace text

w        Write to a file

=======  ===============================================

sed options
-----------

Apart from editing commands, you can give options to sed. An overview is in the table below:


   
-e SCRIPT       Add the commands in SCRIPT to the set of commands to be run while processing the input

-f              Add the commands specfied in the script file following -f to the set of commands to be run while processing the input



$ cat example

This is the first line of an example text
It is a text with erors
Lots of erors
So much erors, all these erors are macking me sick
This is a line not containing any errors
This is the last line



to find all the lines containing our search pattern, in this case "erors". We use the p to obtain the
result:

$ sed '/erors/p' example

This is the first line of an example text
It is a text with erors
It is a text with erors
Lots of erors
Lots of erors
So much erors, all these erors are macking me sick
So much erors, all these erors are macking me sick
This is a line not containing any errors
This is the last line

In order to only print those lines matching our pattern, use the -n option:


$ sed -n '/erors/p' example

It is a text with erors
Lots of erors
So much erors, all these erors are macking me sick

To see the lines not containing the search string

$ sed '/erors/d' example
This is the first line of an example text
This is a line not containing any errors
This is the last line

Matching lines starting with a given pattern and ending in a second pattern are showed like this:

$ sed -n '/^This.*errors$/p' example

This is a line not containing any errors

Range of lines
--------------

sed '2,4d' example

sed '3,$d' example

sed -n '/a text/,/This/p' example

sed s/erors/errors/ example

Here only the first occurance in each line is replaced
To replace all occurances in the line , use /g

sed s/erors/errors/g example

To replace the start of each line with a string eg >

sed 's/^/> /' example

$ sed 's/^/ > /' example
 > This is the first line of text
 > I is a text with erors.
 > Lots of erors.
 > So much erors, all these are making me sick.
 > This is a line not containing errors.
 > This is the last line

To replace the end of each line with string EOL.
 
$ sed 's/$/EOL /' example
This is the first line of textEOL 
I is a text with erors.EOL 
Lots of erors.EOL 
So much erors, all these are making me sick.EOL 
This is a line not containing errors.EOL 
This is the last lineEOL 

Multiple find and replace commands are separtead by -e

$ sed -e 's/erors/errors/' -e 's/line/LINE/g' example

This is the first LINE of text
I is a text with errors.
Lots of errors.
So much errors, all these are making me sick.
This is a LINE not containing errors.
This is the last LINE

Non-interating editor
---------------------

Multiple sed commands can be put in a file and executed using the -f option. When creating such a file,
make sure that:
• No trailing white spaces exist at the end of lines.
• No quotes are used.
• When entering text to add or replace, all except the last line end in a backslash.

$ ls -l| sed -n '/.*sh$/p'
-rwxr-xr-x 1 tanzeem tanzeem   338 Apr 23 21:55 01-mysystem.sh
-rw-r--r-- 1 tanzeem tanzeem   288 Apr 23 21:55 02-positional.sh
-rw-r--r-- 1 tanzeem tanzeem   354 Apr 24 21:58 03-checkuserinshell.sh
-rwxr-xr-x 1 tanzeem tanzeem   385 Apr 25 20:40 text2html.sh

$ ls /usr/bin | sed -n '/^.a.*/p' >temp

$ sed  '1,3d' temp

$ sed -n '/^.*an.*$/p' temp

$ df -h | awk '/dev\/sd/ {print $6 "\t: " $5 }'

