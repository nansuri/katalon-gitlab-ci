#!/bin/bash +x
# Created by Riza Prananda Nansuri 09 Aug 19
# $CI_COMMIT_REF_NAME = $1

# Updated V1.2

export TEST_SUITE=`git log -1 --pretty=oneline | sed 's/^.*test_suite://g' | cut -f1 -d "|"`
export UPDATE_DRIVER=`git log -1 --pretty=oneline | sed 's/^.*update_driver://g' | cut -f1 -d "|"`
export BROWSER_TYPE=`git log -1 --pretty=oneline | sed 's/^.*browser_type://g' | cut -f1 -d "|"`
export EXECUTION_PROFILE=`git log -1 --pretty=oneline | sed 's/^.*execution_profile://g' | cut -f1 -d "|"`
# export DATE=`date`

exposed_report_loc="/home/nakama/ftp/automation_report/gitlab/$1"
cucumber_report="report/"
cuke_json_loc="all-report-json/"
exposed_report_link="http://172.31.12.66:7070/automation_report/gitlab"

echo ""
echo "====================== Report Engine v1.2.1 ========================="
if [ -d "$exposed_report_loc" ]
then
	echo "Directory is exist. Will remove existing report.."
	sudo rm -r $exposed_report_loc
else
    echo "Error: Directory for Report does not exists."
    echo "Will create the folder now.."
    mkdir $exposed_report_loc
fi

# Cucumber HTML Reporter Generator
printf "\n-+-+-+-+\n"
printf "\nStart cucumber pretty report generator engine..\n"
# cuke_json_loc=`find report/cucumber_report/ -name "cucumber.json" -printf '%h\n'`
# node gitlab-ci/cuke_report_gen.js $cuke_json_loc $cucumber_report
printf "creating all-report-json storage now..\n"
sudo mkdir all-report-json
printf "finding jsons..\n"
find report/cucumber_report/ -name "cucumber.json" | while IFS= read -r NAME; do sudo cp -v "$NAME" "all-report-json/${NAME//\//_}"; done

count_jsons=`ls -1 all-report-json/*.json 2>/dev/null | wc -l`
# Debug message
# echo $count_jsons
if [ $count_jsons -ne 0 ]; then
    printf "execute engine..\n"
    node gitlab-ci/allure_cuke_reporter.js $cuke_json_loc $cucumber_report $TEST_SUITE $BROWSER_TYPE $DATE
    printf "deleting jsons storage folder.."
    sudo rm -r all-report-json
else
    printf "no jsons file is found, please check your project..\n"
    printf "deleting jsons storage folder.."
    sudo rm -r all-report-json
fi

printf "\nFinished..\n"
printf "\n-+-+-+-+\n"

# Debug message
# pwd
# echo "Debug me \n"
# ls -la


if [ -f "report/report.html" ]
then
    echo "Copying report(s) now.."
    cp -R report/ $exposed_report_loc

    if [ -d "$exposed_report_loc" ]
    then
        cd $exposed_report_loc
        echo "Report copied succesfully.."
        echo "You can manually check from :"
        echo " "
        if [ -f report.html ]; then
            echo "Report location : "
            echo "$exposed_report_loc/"
            echo "or"
            echo "${exposed_report_link}/$1/report.html"
            if [ -f index.html ]; then
                echo "you can also check the cucumber report here :"
                echo "${exposed_report_link}/$1/index.html" 
            fi
        else
            echo "Report location :"
            echo "$exposed_report_loc/"
            echo "or"
            echo "${exposed_report_link}/$1/report/report.html"
            if [ -f index.html ]; then
                echo "you can also check the cucumber report here :"
                echo "${exposed_report_link}/$1/report/index.html" 
            fi

        fi
    else
        printf "\nError: Copy failed"
    fi
else
    printf "Report folder cannot be found, please check your project..\n"
fi
echo " "
echo "Thank you !!"
echo "========================================================================"
echo ""
