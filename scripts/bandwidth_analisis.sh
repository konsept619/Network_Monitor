#!/bin/bash

if [ -e ./netparams.conf ]; then
  . ./netparams.conf
else 
  echo "Configuration file doesn't exist or its name was changed! Make sure a proper file is placed in working directory and has a proper name."
  exit 1
fi

CHECKIP=$( ip route get $IPADDRESS &>/dev/null ; echo $? )
if [ $CHECKIP != 0 ]; then
  echo "Incorrect IP address!"
  exit 1
fi

check_bandwidth(){
  DATE=$( date +"%D %T" )
  checking_bandwidth_iperf=$( iperf3 -c $IPADDRESS -Z -u 2>/dev/null )
  if [ $? -eq 0 ]; then 
    OUTPUT=$( echo "$checking_bandwidth_iperf" | tail -3 | head -1 | awk '{print $7}' )
    echo "$OUTPUT, $DATE" >> "./logs/$IPADDRESS-bandwidth_data.txt"
    mosquitto_pub -h $IP_BROKER -t $TOPIC_IPERF -m "$OUTPUT,$DATE"
    return 0 
  else
    echo "000,$DATE" >>  "./logs/$IPADDRESS-bandwidth_data.txt"
    mosquitto_pub -h $IP_BROKER -t $TOPIC_IPERF -m "000,$DATE"
    return 1
  fi
}
while true;
do
check_bandwidth
done
