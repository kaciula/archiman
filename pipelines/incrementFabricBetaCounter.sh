#!/usr/bin/env bash
COUNTER_FILE="pipelines/fabric_beta_counter.txt"
OLD_COUNTER=$(cat "$COUNTER_FILE")
NEW_COUNTER=$((OLD_COUNTER+1))
echo ${NEW_COUNTER} > ${COUNTER_FILE}