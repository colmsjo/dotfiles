#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 Encryption_key_id file_to_encrypt"
  echo "Check the Keychain for your Encryption_key_id if you don't have it at hand"
  exit
fi

echo "Source file will be deleted, press enter to continue..."
read

gpg -e -a -u $1 -r $1 -o $2-me.asc $2
rm $2
chmod og-r $2-me.asc
