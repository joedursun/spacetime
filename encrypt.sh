#!/usr/bin/env sh

# Check for correct number of arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <secret key file> <plaintext file>"
  exit 1
fi

# Assign variables from arguments
SECRET_KEY_FILE=$1
PLAINTEXT_FILE=$2

# Check if both files exist
if [ ! -f $SECRET_KEY_FILE ]; then
    echo "Secret key file $SECRET_KEY_FILE does not exist"
    exit 1
fi

if [ ! -f $PLAINTEXT_FILE ]; then
    echo "Plaintext file $PLAINTEXT_FILE does not exist"
    exit 1
fi

# Encrypt the plaintext file
openssl aes-256-cbc -in $PLAINTEXT_FILE -out ${PLAINTEXT_FILE}.aes-256-cbc.enc -pass file:$SECRET_KEY_FILE
