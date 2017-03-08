#!/usr/bin/env bash

TOKEN_FILE="bot.token"

if (( $# > 0)); then
    TOKEN_FILE=$1
fi

# For checking if script is being sourced or not
([[ -n $ZSH_EVAL_CONTEXT && $ZSH_EVAL_CONTEXT =~ :file$ ]] ||
 [[ -n $KSH_VERSION && $(cd "$(dirname -- "$0")" &&
    printf '%s' "${PWD%/}/")$(basename -- "$0") != "${.sh.file}" ]] ||
 [[ -n $BASH_VERSION && $0 != "$BASH_SOURCE" ]]) && sourced=1 || sourced=0

if (( $sourced == 0 )); then
    echo "Script is not being sourced, exiting"
    exit 1
fi 

if [ -e ./bot.token ]; then
    export SLACK_API_TOKEN="$(cat $TOKEN_FILE)"
    echo "SLACK_API_TOKEN succesfully set to $SLACK_API_TOKEN"
else
    echo "Could not find token file: $TOKEN_FILE"
fi
