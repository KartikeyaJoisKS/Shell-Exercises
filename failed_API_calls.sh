#!/bin/bash

#This script will parse through given log files and store the return status of the failed API calls as well as the URLS of non successful API calls

#check and see if a command line arguement has been given
if [[ ${#} -eq 0 ]]
then
	echo  "Please supply location to log file as an arguement"
	exit 1
fi

#store the file location from the command line

FILE_L=${1}

#obtain the error codes
grep status_code ${FILE_L} | awk '{print $NF}' > failed_status.txt

echo "HELLO WORLD!!"

#obtain the URL 
grep ERROR ${FILE_L} | grep http | awk -F- '{print $4}'|awk '{print $1}'|tee failed_api_calls.txt | awk -F? '{print $2}'>failed_parameters.txt
	

exit 0
