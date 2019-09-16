#!/bin/bash +x
# Created by Riza Prananda Nansuri 15 Aug 19

# export TEST_SUITE=$1
# export UPDATE_DRIVER=$2
# export BROWSER_TYPE=$3
# export EXECUTION_PROFILE=$4
# export KATALON_VERSION=$5
# export KATALON_API_KEY=$6

export TEST_SUITE=`git log -1 --pretty=oneline | sed 's/^.*test_suite://g' | cut -f1 -d "|"`
export UPDATE_DRIVER=`git log -1 --pretty=oneline | sed 's/^.*update_driver://g' | cut -f1 -d "|"`
export BROWSER_TYPE=`git log -1 --pretty=oneline | sed 's/^.*browser_type://g' | cut -f1 -d "|"`
export EXECUTION_PROFILE=`git log -1 --pretty=oneline | sed 's/^.*execution_profile://g' | cut -f1 -d "|"`
export KATALON_VERSION=`git log -1 --pretty=oneline | sed 's/^.*katalon_version://g' | cut -f1 -d "|"`
# export FEATURE_TAG=`git log -1 --pretty=oneline | sed 's/^.*feature_tag://g' | cut -f1 -d "|"`
export PLATFORM=`git log -1 --pretty=oneline | sed 's/^.*platform://g' | cut -f1 -d "|"`
export KATALON_API_KEY=$1

#check whether the variable is null or not

if [[ ! "$UPDATE_DRIVER" =~ ^(true)$ ]]
then
    UPDATE_DRIVER="false"
fi

if [[ ! "$BROWSER_TYPE" =~ ^(1|3)$ ]]
then
    BROWSER_TYPE="2"
fi

if [[ ! "$EXECUTION_PROFILE" =~ ^(Staging|Production)$ ]]
then
    EXECUTION_PROFILE="default"
fi

if [[ ! "$KATALON_VERSION" =~ ^(old|stable)$ ]]
then
    KATALON_VERSION="new"
fi

if [[ ! "$PLATFORM" =~ ^(Web|Lite|API)$ ]]
then
    PLATFORM="Cucumber"
fi

# if [[ ! "$FEATURE_TAG" =~ ^(new)$ ]]
# then
#     FEATURE_TAG="Smoke"
# fi

# printf "This is debug message...\n"
# printf "$TEST_SUITE\n$UPDATE_DRIVER\n$EXECUTION_PROFILE\n$BROWSER_TYPE\n$KATALON_VERSION\n"
# echo "end"

# Start Executing docker

$(pwd)/gitlab-ci/docker_test.sh $TEST_SUITE $UPDATE_DRIVER $EXECUTION_PROFILE $BROWSER_TYPE $KATALON_API_KEY $KATALON_VERSION $PLATFORM