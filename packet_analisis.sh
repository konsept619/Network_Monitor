#!/bin/bash

while [ 1 -gt 0 ];
do

  ping -c 5 -q 1.1.1.1 | tail -1 | cut -d ' ' -f 4 | tr \['/'] \[','] >> network_data.txt

done
