#!/bin/bash
#
# Translate a MAC address fetched from VirtualBox into a IP address
#

if [  $# -lt 1 ]; then 
  echo -e "\nUsage:\n$0 [virtual machine] \n" 
  exit 1
fi

# Get a string of the form macaddress1=xxxxxxxxxxx
var1=$(VBoxManage showvminfo $1 --machinereadable |grep macaddress1)

# Asdign macaddress1 the MAC address as a value
eval $var1

# assign m the MAC address in lower case
m=$(echo ${macaddress1}|tr '[A-Z]' '[a-z]')

# This is the MAC address formatted with : and 0n translated into n
mymac=$(echo `expr ${m:0:2}`:`expr ${m:2:2}`:`expr ${m:4:2}`:`expr ${m:6:2}`:`expr ${m:8:2}`:`expr ${m:10:2}`)
echo "The MAC address of the virtual machine $1 is $mymac"

echo "Need to ping everyone in order to fetch the MAC address into the ARP table (in case it's not there)"
ping -c 2 255.255.255.255

# Get known IP and MAC addresses
foundip=false

IFS=$'\n'; for line in $(arp -a); do 

  IFS=' ' read -a array <<< $line
  ip=$(echo "${array[1]}"|tr -d "("|tr -d ")")

  if [ "$mymac" = "${array[3]}" ]; then
    foundip=true
    echo "and the IP address is $ip"
    echo "ssh into root@$ip"
    ssh root@$ip
  fi

done

if [ "$foundip" = false ]; then
  echo "Did not find the the ip for $mymac. Try again, building the ARP table sometimes takes a little time!"
fi
