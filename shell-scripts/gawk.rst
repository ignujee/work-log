=======
GNU Awk
=======

Gawk is the GNU version of the commonly available UNIX awk program, another popular stream editor.
Since the awk program is often just a link to gawk, we will refer to it as awk.
The basic function of awk is to search files for lines or other text units containing one or more patterns. When
a line matches one of the patterns, special actions are performed on that line.
Programs in awk are different from programs in most other languages, because awk programs are
"data-driven": you describe the data you want to work with and then what to do when you find it. Most other
languages are "procedural." You have to describe, in great detail, every step the program is to take. When
working with procedural languages, it is usually much harder to clearly describe the data your program will
process. For this reason, awk programs are often refreshingly easy to read and write.

The print command in awk outputs selected data from the input file.
When awk reads a line of a file, it divides the line in fields based on the specified input field separator, FS,
which is an awk variable
This variable is predefined to be one or more spaces or tabs.

The variables $1, $2, $3, ..., $N hold the values of the first, second, third until the last field of an input line.
The variable $0 (zero) holds the value of the entire line.

$ ls -l | awk '{print $5,$9}'

$ls -ldh * | grep -v total|  awk '{print "Size is " $5 " for " $9}'

$ df -h | awk '/dev\/sd/ {print $6 "\t: " $5 }'

$ ls -ld /etc/*| awk '/\<(a|x).*\.conf$/'

$ df -h | sort -rnk 5 | head -3 | \
awk '{ print "Partition " $6 "\t: " $5 " full!" }'

In order to precede output with comments, use the BEGIN statement:

ls -l | \
awk 'BEGIN { print "Files found:\n" } /\<[a|x].*\.conf$/ { print $9 }'

$ ls -l | awk 'BEGIN { print "reStructuredText starting with s or g in the current folder are: " } /[s|g].*\.rst$/ {print $9}'

reStructuredText starting with s or g in the current folder are: 
gawk.rst
sed.rst
shell-commands.rst

The END statement can be added for inserting text after the entire input is processed:

$ ls -l | awk '/[s|g].*\.rst$/ {print $9} END {print "These are the rst files starting wiht s or g in this folder"}'
gawk.rst
sed.rst
shell-commands.rst
These are the rst files starting wiht s or g in this folder

$ cat diskrep.awk 
BEGIN {print " *** WARNING WARNING WARNING *** "}
/\<[8|9][0-9]%/ {print "partition " $6 " is \t: " $5 " full"}
END { print " Free the space in disk urgently." }

$ df -h|awk -f diskrep.awk
 *** WARNING WARNING WARNING *** 
partition / is 	: 90% full
 *** Free the space in disk urgently. ***

awk 'BEGIN { FS=":" } { print $1 "\t" $5 }' /etc/passwd

tanzeem@debian-sonnet:~/shell-scripts$ cat printnames.awk 
BEGIN {FS=":"}  
{ print $1 "\t " $5 }
END {print " finished printing"}

tanzeem@debian-sonnet:~/shell-scripts$ awk -f printnames.awk /etc/passwd
root	 root
daemon	 daemon
bin	 bin
sys	 sys
sync	 sync
games	 games
man	 man
lp	 lp
mail	 mail
news	 news
uucp	 uucp
proxy	 proxy
www-data	 www-data
.
.
.
tanzeem	 Tanzeem MB,11,1111111,1111111,1111111
mysql	 MySQL Server,,,
mongodb	 
postgres	 PostgreSQL administrator,,,
gnukhata	 gnukhata system user,,,
redis	 
matrix-synapse	 
 finished printing

OFS- Output Field Separator and ORS- Output Record Separator
------------------------------------------------------------
 
$ awk 'BEGIN {OFS=";"; ORS="\n-->\n"}\ 
{ print $1,$2}' test
record1;data1
-->
record2;data2
-->


NR- Number of processed Records
-------------------------------

The built-in NR holds the number of records that are processed. It is incremented after reading a new input
line. You can use it at the end to count the total number of records, or in each output record:

$ cat processed.awk 
BEGIN {OFS=";" ;ORS="\n-->done\n"}
{print "Record number " NR ":" $1, $2}
END { print "Number of records processed: " NR } 



$ awk -f processed.awk test
Record number 1:record1;data1
-->done
Record number 2:record2;data2
-->done
Number of records processed: 2
-->done

