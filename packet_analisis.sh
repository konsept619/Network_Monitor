#!/bin/bash

IPADDRESS=$1 #if I pass $1 as argument in further functions, script will crash

CHECKIP=$( ip route get $IPADDRESS &>/dev/null ; echo $? )
if [ $CHECKIP != 0 ]; then
  exit
fi

ping_and_record(){
  DATE=$( date +"%D %T" )
  pinging_output=$(ping -c 3 $IPADDRESS 2>/dev/null)
  if [ $? -eq 0 ]; then 
    OUTPUT=$( echo "$pinging_output" | tail -1 | cut -d ' ' -f 4 | tr \['/'] \[','] ) 
    echo "$OUTPUT,$DATE" >> $IPADDRESS-network_data.txt #every file has unique name containing IP of a target to make it more clear
  return 0
else
  #here we can add some output indicating unavailability of host in text file
  echo "0,0,0,0" >> $IPADDRESS-network_data.txt
  return 1
  fi
}

isUP=0 #flag for indicating if post is up right now 

while true;
do
  ping_and_record
  if [ $? -eq 0 ]; 
  then
    echo "Host is up"
    (( isUP=1 ))
  else
    echo "Host is down/unreachable"
    (( isUP=0 ))
  fi

done
