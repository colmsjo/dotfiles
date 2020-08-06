#!/bin/bash
echo "The file will be encrypted with your own key on this computer. Only you will be able to decypt the file on this computer (unless you manually install the key on other computers)."
echo "Use encrypt-me.sh to use your private key that typically can be installed on several computers"
echo "Or Use encrypt-multi.sh if all personell should be able to decrypt the file."
echo "Source file will be deleted, press enter to continue..."
read
gpg --symmetric --cipher-algo aes256 $1
rm $1
chmod og-r $1.gpg
