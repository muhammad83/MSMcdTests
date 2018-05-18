#!/usr/bin/env bash

DEFAULT_VALUE="???"
PlistBuddy=/usr/libexec/PlistBuddy
INFOPLIST_PATH="${PROJECT_DIR}/${INFOPLIST_FILE}"
$PlistBuddy -c "Set :CFBundleVersion $DEFAULT_VALUE" "$INFOPLIST_PATH"
$PlistBuddy -c "Set :CFBundleShortVersionString $DEFAULT_VALUE" "$INFOPLIST_PATH"