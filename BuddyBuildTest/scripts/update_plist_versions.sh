#!/usr/bin/env bash

WD=$(dirname $0)
COMMIT_COUNT=$(git rev-list --count HEAD)
COMMIT_HASH=$(git rev-parse HEAD)
LAST_TAG=$(git describe --tags --abbrev=0)
NEXT_TAG=$($WD/semver.sh bump patch $LAST_TAG)

BUILD_NUMBER=$COMMIT_COUNT
if [[ ! -n $(git tag --points-at HEAD) ]]
then
	VERSION_NUMBER=$LAST_TAG
else
	VERSION_NUMBER=$NEXT_TAG
fi

PlistBuddy=/usr/libexec/PlistBuddy
INFOPLIST_PATH="${PROJECT_DIR}/${INFOPLIST_FILE}"
$PlistBuddy -c "Set :CFBundleVersion $BUILD_NUMBER" "$INFOPLIST_PATH"
$PlistBuddy -c "Set :CFBundleShortVersionString $VERSION_NUMBER" "$INFOPLIST_PATH"
