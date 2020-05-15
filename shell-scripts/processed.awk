BEGIN {OFS=";" ;ORS="\n-->done\n"}
{print "Record number " NR ":" $1, $2}
END { print "Number of records processed: " NR } 
