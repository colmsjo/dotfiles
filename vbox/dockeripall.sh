#!/bin/bash
echo -e "haproxy:\t$(docker inspect haproxy | grep IPAddress)"
echo -e "beservices:\t$(docker inspect beservices | grep IPAddress)"
echo -e "odataserver:\t$(docker inspect odataserver | grep IPAddress)"

echo -e "cikab:\t\t$(docker inspect cikab | grep IPAddress)"
echo -e "cikabvtiger\t$(docker inspect cikabvtiger | grep IPAddress)"
echo -e "vtigercikab\t$(docker inspect vtigercikab | grep IPAddress)"

echo -e "clab:\t\t$(docker inspect clab | grep IPAddress)"
echo -e "clabvtiger:\t$(docker inspect clabvtiger | grep IPAddress)"
echo -e "vtigerclab:\t$(docker inspect vtigerclab | grep IPAddress)"

echo -e "vtiger:\t\t$(docker inspect vtiger | grep IPAddress)"
echo -e "p2:\t\t$(docker inspect p2 | grep IPAddress)"
