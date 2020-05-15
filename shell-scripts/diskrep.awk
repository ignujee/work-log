BEGIN {print " *** WARNING WARNING WARNING *** "}
/\<[8|9][0-9]%/ {print "partition " $6 " is \t: " $5 " full"}
END { print " *** Free the space in disk urgently. *** " } 
