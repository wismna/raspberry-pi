#!/bin/bash
 
ad_list_url="http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro=0&mimetype=plaintext"
pixelserv_ip="192.168.12.1"
ad_file="/etc/dnsmasq.d/dnsmasq.adlist.conf"
temp_ad_file="/etc/dnsmasq.d/dnsmasq.adlist.conf.tmp"
 
curl $ad_list_url | sed "s/127\.0\.0\.1/$pixelserv_ip/" > $temp_ad_file
 
if [ -f "$temp_ad_file" ]
then
	#sed -i -e '/www\.favoritesite\.com/d' $temp_ad_file
	mv $temp_ad_file $ad_file
else
	echo "Error building the ad list, please try again."
	exit
fi
 
service dnsmasq restart
