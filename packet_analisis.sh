#!/bin/bash


#ping 1.1.1.1 
counter=0
while [ $counter -le 4 ];
do
  sleep 1
  counter=$(expr $counter + 1 )
done
echo KONIEC
