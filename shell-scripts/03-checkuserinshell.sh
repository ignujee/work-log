#! /bin/bash

# Find if the specified user exists in /usr/passwd

echo "checking if user tanzeem exists in /etc/passwd"
echo "if output is 0, user exists"

grep ^tanzeem:.*/bin/bash$ /etc/passwd

echo $?
echo

echo "checking if user cdit exists in /etc/passwd"
echo "if output is 1, user doesnt exists"

grep ^cdit:.*/bin/bash$ /etc/passwd

echo $?
echo
