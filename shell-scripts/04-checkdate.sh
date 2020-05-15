#!/bin/bash
# Calculate the week number using the date command:

WEEKOFFSET=$[ $(date  "+%V") % 2 ]

# Test if we have a remainder.
# Else, do nothing.
# If not, this is an even week so send a message.
if [ $WEEKOFFSET -eq "0" ]; then
echo "Sunday evening, put out the garbage cans." | mail -s "Garbage cans out" your@your_domain.
fi
