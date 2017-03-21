#!/bin/sh
for IP in `cat /Users/nharinath/test/ips.txt`
do
        printf "$IP\t"

        LOOKUP_RES=`nslookup $IP`

        FAIL_COUNT=`echo $LOOKUP_RES | grep "** server can't find " | wc -l`;

        if [ $FAIL_COUNT -eq 1 ]
        then
             NAME='Bad FQDN\n'; echo $NAME
        else

             nslookup $IP | awk -F"= " '/name/{print $2"\n"}';
        fi

      #  echo $NAME

done
