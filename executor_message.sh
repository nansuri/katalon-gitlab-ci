#!/bin/bash +x
# Created by Riza Prananda Nansuri 09 Aug 19

printf "\nStarting engine v1.2.3...\n"
date
printf "\n"

export TEST_SUITE=`git log -1 --pretty=oneline | sed 's/^.*test_suite://g' | cut -f1 -d "|"`
export UPDATE_DRIVER=`git log -1 --pretty=oneline | sed 's/^.*update_driver://g' | cut -f1 -d "|"`
export BROWSER_TYPE=`git log -1 --pretty=oneline | sed 's/^.*browser_type://g' | cut -f1 -d "|"`
export EXECUTION_PROFILE=`git log -1 --pretty=oneline | sed 's/^.*execution_profile://g' | cut -f1 -d "|"`
export PLATFORM=`git log -1 --pretty=oneline | sed 's/^.*platform://g' | cut -f1 -d "|"`


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

if [[ ! "$PLATFORM" =~ ^(Web|Lite|API)$ ]]
then
    KATALON_VERSION="Cucumber"
fi

# if [[ ! "$KATALON_VERSION" =~ ^(new)$ ]]
# then
#     KATALON_VERSION="old"
# fi

echo ""
echo ""
cat << "EOF" 
============================================================================================
                                         
                                         Welcome to

               '||''''|                 ||                 '||        |''||''| '||''''|
                ||  .    ''             ||                  ||           ||     ||   . 
                ||''|    ||  `||''|,  ''||''  .|''|, .|'',  ||''|,       ||     ||'''| 
                ||       ||   ||  ||    ||    ||..|| ||     ||  ||       ||     ||     
               .||.     .||. .||  ||.   `|..' `|...  `|..' .||  ||      .||.   .||....|

                               Katalon Executor Engine V1.2

============================================================================================
EOF

echo "Executing Katalon Automation using Parameter :"
echo "Platform : $PLATFORM"
echo "Test Suite : $TEST_SUITE"
echo "Browser Type : $BROWSER_TYPE"
echo "Update Driver : $UPDATE_DRIVER"
echo "Execution Profile : $EXECUTION_PROFILE"
echo "============================================================================================"
echo ""
echo ""