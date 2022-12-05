#! /bin/sh
echo "Write domain name ex: example.com?"
read DOM
mkdir $DOM
cd $DOM
#######################################
#Use the following command to extract the certificate private key from the PFX file.
#If your certificate is secured with a password, enter it when prompted.i
#The command generates a PEM-encoded private key file named privatekey.pem. Enter a passphrase to protect the private key file when prompted to Enter a PEM pass phrase.
#######################################
#STEP1
openssl pkcs12 -in /certificate/pfx/example.com.pfx -nocerts -out privatekey.pem

#The previous step generates a password-protected private key. To remove the password, run the following command. When prompted, provide the passphrase created in step 1. If successful, you will see writing RSA key.
#STEP2
openssl rsa -in privatekey.pem -out Certificate_private_key_withoutpw-privatekey.pem

#Use the following command to transfer the certificate from the PFX file to a PEM file. This creates the PEM-encoded certificate file named cert-file.pem. If successful, you will see MAC verified OK.
#STEP3
openssl pkcs12 -in /certificate/pfx/example.com.pfx -clcerts -nokeys -out Certificate_body_cert-file.pem

#Finally, use the following command to extract the CA chain from the PFX file. This creates the CA chain file named ca-chain.pem. If successful, you will see MAC verified OK.
#STEP4
openssl pkcs12 -in /certificate/pfx/example.com.pfx -cacerts -nokeys -chain -out Certificate_chain_ca-chain.pem
