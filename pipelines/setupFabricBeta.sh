#!/usr/bin/env bash
COUNTER_FILE="pipelines/fabric_beta_counter.txt"
OLD_COUNTER=$(cat "$COUNTER_FILE")
NEW_COUNTER=$((OLD_COUNTER+1))
echo ${NEW_COUNTER} > ${COUNTER_FILE}
git tag "fabric-beta-counter-$NEW_COUNTER"

RELEASE_NOTES_FILE="pipelines/fabric_beta_release_notes.txt"
git log --pretty="- %s" "fabric-beta-counter-$OLD_COUNTER"..."fabric-beta-counter-$NEW_COUNTER" > ${RELEASE_NOTES_FILE}
