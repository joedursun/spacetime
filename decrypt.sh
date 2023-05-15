#!/usr/bin/env sh

# Check for correct number of arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <secret key file> <encrypted file>"
  exit 1
fi

# Assign variables from arguments
SECRET_KEY_FILE=$1
ENCRYPTED_FILE=$2

# Check if both files exist
if [ ! -f $SECRET_KEY_FILE ]; then
    echo "Secret key file $SECRET_KEY_FILE does not exist"
    exit 1
fi

if [ ! -f $ENCRYPTED_FILE ]; then
    echo "Encrypted file $ENCRYPTED_FILE does not exist"
    exit 1
fi

# Decrypt the encrypted file
openssl aes-256-cbc -d -in $ENCRYPTED_FILE -out ${ENCRYPTED_FILE%.aes-256-cbc.enc} -pass file:$SECRET_KEY_FILE
