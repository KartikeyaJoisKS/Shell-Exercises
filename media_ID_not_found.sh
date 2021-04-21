#!/bin/bash

#this script will print the Media ID of media files that are not found in a given system from the given log file

#check if file has been given a command line arguement
if [[ ${#} -eq 0 ]]
then
        echo  "Please supply location to log file as an arguement"
        exit 1
fi

#store the input file 
FILE_L=${1}

#display the sorted media IDs: 
echo "The media files that were not found are :"
grep "RuntimeError: Media" ${FILE_L}| awk '{print $6,$7}' | sort -k2n -u 





