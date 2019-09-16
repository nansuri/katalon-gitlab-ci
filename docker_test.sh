#!/bin/bash
# Created by Riza Prananda Nansuri 09 Aug 19

printf "\nContainer executor v1.3 ..\n"

case $4 in

  1)
    browser_type="Chrome (headless)"
    echo "will use $browser_type"
    ;;
  2)
    browser_type="Chrome"
    echo "will use $browser_type"
    ;;
  3)
    browser_type="Firefox"
    echo "will use $browser_type"
    ;;
  *)
    echo -n "invalid option"
    exit
    ;;
esac

case $6 in

  new)
    katalon_container="katalonstudio/katalon:latest"
    echo "will use $katalon_container"
    ;;
  stable)
    katalon_container="katalonstudio/katalon:6.2.2"
    echo "will use $katalon_container"
    ;;
  old)
    katalon_container="katalonstudio/katalon:6.1.2"
    echo "will use $katalon_container"
    ;;
  *)
    echo "katalon version is not valid.."
    # katalon_container="katalonstudio/katalon:$6"
    # printf "will use $katalon_container\n"
    # sudo docker pull $katalon_container
    ;;
esac

# Send the parameter and execute the docker
sudo docker run -t --rm -v "$(pwd)":/katalon/katalon/source -v /dev/shm:/dev/shm $katalon_container katalon-execute.sh -retry=0 -testSuitePath="Test Suites/$7/$1" -executionProfile="$3" -browserType="$browser_type" -apiKey="$5" --config -webui.autoUpdateDrivers="$2"