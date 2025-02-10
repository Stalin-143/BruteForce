#!/bin/bash

# Function to simulate typing effect
type_text() {
    text="$1"
    delay=0.03
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

# Banner
type_text "=============================="
type_text "  Brute Force Attack Laws  "
type_text "=============================="
echo ""

declare -A laws

# United States
laws["United States"]="The Computer Fraud and Abuse Act (CFAA) prohibits unauthorized access to protected computers. Penalties include fines and imprisonment."

# India
laws["India"]="The Information Technology Act, Section 66, criminalizes hacking offenses. Violators can face imprisonment up to three years and fines."

# Netherlands
laws["Netherlands"]="Article 138ab of the Dutch Penal Code criminalizes unauthorized access to computer systems, with penalties including up to one year in prison."

# Australia
laws["Australia"]="The Cybercrime Act 2001 allows authorities to demand decryption keys and access. Failure to comply can result in imprisonment."

# Belgium
laws["Belgium"]="The Law on Computer Crime (2000) permits judges to order access to encrypted data. Non-compliance can lead to imprisonment and fines."

# Canada
laws["Canada"]="PIPEDA regulates unauthorized access to personal information, imposing fines and other sanctions for violations."

# Brazil
laws["Brazil"]="Decreto-Lei No 2.848 criminalizes unauthorized computer access, with penalties including fines and imprisonment."

# Italy
laws["Italy"]="The Codice dell’amministrazione digitale (2017) includes regulations against unauthorized access, with associated penalties."

# Display Laws
for country in "${!laws[@]}"; do
    type_text "[+] $country:"
    type_text "    ${laws[$country]}"
    echo ""
    sleep 1
done

type_text "Remember: Unauthorized access is illegal. Always obtain proper authorization before conducting security tests."
echo ""
