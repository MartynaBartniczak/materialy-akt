#!/bin/bash

if [ $# -ne 7 ]; then 
echo -e "Sposob uzycia: digest.sh <username> <realm> <password> <method> <digestURI> <nonce> <cnonce>"
echo -e "Przyklad# ./digest.sh infoshare infoshare.pl digest GET / 4bf3cb8175cd272a3ce9502b60f5cc88e84f9991 54adce2b1154f21096f0eb98388729e4"

else
username=$1
realm=$2
password=$3
method=$4
digestURI=$5
nonce=$6
cnonce=$7

nonceCount=00000001
qop=auth

HA1=`echo -n "$username:$realm:$password"|md5sum`
HA2=`echo -n "$method:$digestURI"|md5sum`
response=`echo -n "${HA1:0:32}:$nonce:$nonceCount:$cnonce:$qop:${HA2:0:32}"|md5sum`

echo -e "Response: \t${response:0:32}"

fi
