BEGIN {FS=":"; print " printing names.... " }  
{ print $1 "\t " $5 }
END {print " finished printing"}

