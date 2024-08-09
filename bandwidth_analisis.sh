#!/bin/bash

IPADDRESS=$1

CHECKIP=$( ip route get $IPADDRESS &>/dev/null ; echo $? )
if [ $CHECKIP != 0 ]; then
  exit
fi

check_bandwidth(){
  DATE=$( date +"%D %T" )
  checking_bandwidth_iperf=$( iperf3 -c $IPADDRESS -Z -u 2>/dev/null )
  if [ $? -eq 0 ]; then 
    OUTPUT=$( echo "$checking_bandwidth_iperf" | tail -3 | head -1 | awk '{print $7}' )
    echo "$OUTPUT, $DATE" >> $IPADDRESS-bandwidth_data.txt
    return 0 
  else
    echo "000,$DATE" >> $IPADDRESS-bandwidth_data.txt
    return 1
  fi
}
while true;
do
check_bandwidth
done
