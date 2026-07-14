#!/bin/bash

# Sets up variables  - NOT a finished project yet - merely an idea
echo " [*] If city uses more than one name please use - for spaces: " 
read -r -p "Enter the city: " city
read -r -p "Enter the two letter state: " state
read -r -p "Enter the company associated with Flock (exp: PD or college) " Company

#Phase2 Brute Force - had some discrepancies with the domain (flocksafety.com or flock.com) so I added both. Please verify accordingly  

# Define an array of website URLs
URLS=(
    "https://${city}.flocksfatey.com"
    "https://${city}.flock.com"
    "https://${city}-pd.flocksafety.com"
    "https://${city}.pd.flocksafety.com"
    "https://${city}-pd.flock.com"
    "https://${city}.pd.flock.com"
    "https://${city}-${state}.flocksafety.com"
    "https://${city}-${state}.flock.com"
    "https://${city}.aerodome.com"
    "https://${city}-${state}.aerodome.com"
    "https://${Company}.flocksafety.com"
    "https://${Company}.flocksafety.com"
)

# Loop through each URL in the array
for URL in "${URLS[@]}"; do
    echo "Checking $URL..."
    
    # Fetch only the HTTP status code (follows redirects automatically)
    RESPONSE_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL")

    # Check if response code starts with 2 or 3
    if [[ $RESPONSE_CODE =~ ^[23] ]]; then
        echo " [*] The site is active. Status: $RESPONSE_CODE"
    else
        echo " [*] The site is down. Status: $RESPONSE_CODE"
    fi
    echo " [*] Note: Aerodome is for Flock Drones"
done


# Phase3 Check for ssl certificates (experimental)
# Want to eventually pass all 200 and 300 http codes to this phase

echo | openssl s_client -connect $city.flocksafety.com.com:443 -servername $city.flocksafety.com 2>/dev/null | openssl x509 -noout -checkend 0


echo " [*] Look to see if web portal is vulnerable to CVE-2025-59407 "
echo " [*] flockhibiki17 is possible password for secrets keystore"

echo " [*] shodan search for flock admin portal Title "flock admin" port: 8900"
echo " [*] check Censys for certificates as well" 
echo " [*] Thanks to everyone who keeps doing research on this topic. Anyone who wants to assist specifically on this topic can reach out to me.

