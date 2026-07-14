#!/bin/bash

# Sets up variables  - NOT a finished project yet - merely an idea
echo " [*] If city uses more than one name please use - for spaces: " 
read -r -p "Enter the city: " City
read -r -p "Enter the two letter state: " State
read -r -p "Enter the company associated with Flock (exp: PD or college " Company

#Phase2 Brute Force - had some discrepancies with the domain (flocksafety.com or flock.com) so I added both. Please verify accordingly  
curl -sL -w "%{http_code}" http://$City.flocksfatey.com
curl -sL -w "%{http_code}" http://$City.flock.com

curl -sL -w "%{http_code}" http://$City-pd.flocksafety.com
curl -sL -w "%{http_code}" http://$City.pd.flocksafety.com
curl -sL -w "%{http_code}" http://$City-pd.flock.com
curl -sL -w "%{http_code}" http://$City.pd.flock.com

curl -sL -w "%{http_code}" http://$Company.flocksfatey.com
curl -sL -w "%{http_code}" http://$Company.flock.com


curl -sL -w "%{http_code}" http://$city-$State.flocksfatey.com


#checks for Flock drones
curl -sL -w "%{http_code}" http://$City.aerodome.com

curl -sL -w "%{http_code}" http://$City-$State.aerodome.com

# Phase3 Check for ssl certificates (experimental)
# Want to eventually pass all 200 and 300 http codes to this phase

echo | openssl s_client -connect $city.flocksafety.com.com:443 -servername $city.flocksafety.com 2>/dev/null | openssl x509 -noout -checkend 0


echo " [*] Look to see if web portal is vulnerable to CVE-2025-59407 "
echo " [*] flockhibiki17 is possible password for secrets keystore"

echo " [*] shodan search for flock admin portal Title "flock admin" port: 8900"
echo " [*] check Censys for certificates as well" 
echo " [*] Thanks to everyone who keeps doing research on this topic. Anyone who wants to assist specifically on this topic can reach out to me.

