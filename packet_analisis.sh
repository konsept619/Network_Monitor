#!/bin/bash

ping_and_record(){
  pinging_output=$(ping -c 3 -q 192.1.1.1 &>/dev/null)
  if [ $? -eq 0 ]; then 
  echo "$pinging_output" | tail -1 | cut -d ' ' -f 4 | tr \['/'] \[','] >> network_data.txt
  return 0
else
  #here we can add some output indicating unavailability of host in text file
  echo "0,0,0,0" >> network_data.txt
  return 1
  fi
}

isUP=0 #flag for indicating if post is up right now 

while [ 1 -gt 0 ];
do
  ping_and_record
  if [ $? -eq 0 ]; 
  then
    echo "Host is up"
    let isUP=1
  else
    echo "Host is down/unreachable"
    let isUP=0
  fi

done
