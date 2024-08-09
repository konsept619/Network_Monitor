#!/bin/bash

if [ -e ./netparams.conf ]; then
  . ./netparams.conf
else 
  echo "Configuration file doesn't exist or its name was changed! Make sure proper file is placed in working directory and has a proper name."
  exit 
fi


IPADDRESS=$1 #if I pass $1 as argument in further functions, script will crash

CHECKIP=$( ip route get $IPADDRESS &>/dev/null ; echo $? )
if [ $CHECKIP != 0 ]; then
  echo "Incorrect IP address!"
  exit
fi

ping_and_record(){
  DATE=$( date +"%D %T" )
  pinging_output=$(ping -c 3 $IPADDRESS 2>/dev/null)
  if [ $? -eq 0 ]; then 
    OUTPUT=$( echo "$pinging_output" | tail -1 | cut -d ' ' -f 4 | tr \['/'] \[','] ) 
    LOST_PACKETS=$( echo "$pinging_output" | tail -2 | head -1 | awk '{print $1-$4}' ) 
    echo "$OUTPUT,$LOST_PACKETS,$DATE" >> $IPADDRESS-network_data.txt #every file has unique name containing IP of a target to make it more clear
    #mosquitto_pub -h 192.168.10.88 -t test/dupa -m "$OUTPUT"
  return 0
else
  #here we can add some output indicating unavailability of host in text file
  echo "0,0,0,0,$DATE" >> $IPADDRESS-network_data.txt
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
