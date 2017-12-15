#!/usr/bin/env bash
# Script for granting git access to the CI of the current repository on Bitbucket
# This script expect the enviroment variables $OAUTH_KEY and $OAUTH_SECRET, to be pressent in the bitbucket

if [ -z $OAUTH_KEY ]; then
    echo "ERROR: No key"
    exit 1
fi

if [ -z $OAUTH_SECRET ]; then
    echo "ERROR: No secret"
    exit 1
fi

KEY=$OAUTH_KEY
SECRET=$OAUTH_SECRET

set -e

wget -q -O jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
chmod 755 jq
TOKEN=`curl -s -S -f -X POST -u "${KEY}:${SECRET}" https://bitbucket.org/site/oauth2/access_token -d grant_type=client_credentials | ./jq .access_token -r`

git remote set-url origin https://x-token-auth:${TOKEN}@bitbucket.org/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}.git
# git is now pushable