#!bin/bash
if [ $1 ]; then
	ip_segment=$1;
	ttl="2";
	for i in $(seq 1 254); do
		#ttl=bash -c "ping -c 1 $ip_segment.$i > grep -oP 'ttl=\d{1,4}' > awk '{print $2}' FS='='";
		timeout 2 bash -c "ping -c 2 $ip_segment.$i > /dev/null 2>&1" && echo "Host Discovered at: $ip_segment.$i - Status: Active - TTL: $ttl" &
	done; wait 
	exit 2;
else
	echo "Developed by SrPik3ls";
	echo "\n [*] Use: ./hostDiscovery.sh <ip-segment>\n";
	echo "For example: ./hostDiscovey.sh 192.168.1 \n";
	exit 1;
fi;
