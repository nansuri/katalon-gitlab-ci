# Fintech Gitlab CI
For first time user, what you have to do is :

 1. Clone the **Fintech's Gitlab-Ci** repository here. Clone the repo to root of your Automation Project *( ../fintecha-utomation/ )* become *( ../fintech-automation/gitlab-ci/ ).* then checkout the **Master** branch.
	> git clone http://172.31.12.66/fintech-te-group/gitlab-ci.git
	> git checkout v1.1

 2. Move **.gitmodules** and **.gitlab-ci.yml** files on gitlab-ci folder to your root of fintech-automation folder.

    *.gitmodules* file content
    >     [submodule "gitlab-ci"]
    >     path = gitlab-ci
    >     url = http://172.31.12.66/fintech-te-group/gitlab-ci.git
    
3. How to trigger the CI
    - To trigger/run a CI Pipeline, you must include "**execute_ci**" string anywhere on your commit message body. Any commit message which doesn't contain the parameter, wont trigger the CI at all. No need to use *[CI SKIP]*.
    - There are some parameters you can use for executing your Test Cases, which are :
    > *  **test_suite:**
    > *  **update_driver:**
    > *  **browser_type:**
    > *  **execution_profile:**
    > *  **katalon_version:**
    > *  **platform:**

    - You can add more than 1 parameter on the Commit Message, the parameters are separated by **" | "** block, for example the commit message will be like :
    > execute_ci test_suite:Login|update_driver:true|browser_type:1|execution_profile:default|katalon_version:old

    ##### Parameters Options
    There are some parameter options for each of the params, they are :
    -  **test_suite:**
    > * Just write the Test Suite name located on /Test Suite/Web/< test suite name >
    - **update_driver:**
    > * **true** : when the *katalon_version* set as new, selenium driver will be updated every time you execute your test.
    > * **false** : when the *katalon_version* set as new, selenium driver wont be updated every time you execute your test.
    - **browser_type:**
    > * **1** : Chrome (headless)
    > * **2** : Chrome
    > * **3** : Firefox
    - **execution_profile:**
    > * There are 3 execution profiles, which are **Production**, **Staging** and **default**
    - **katalon_version:**
    Katalon version parameter will decide which docker image will you use, use **old** if the internet is slow.
    > * **old** : using docker container which contain Katalon v6.1.2 (faster because doesn't need to download report plugin)
    > * **new** : using docker container which contain Katalon v6.2.1 (slower because need to fetch the plugin first, but have some feature updates) 
    - **platform:**
    > * There are 3 platform supported, which are **Web**, **Lite**, **API** and **Cucumber** 

4. Enjoy !

# Version Change Logs

### Version 1.0
- Execute Test Suite via Commit message.

### Version 1.1 Update
- There are some parameters you can use for executing your Test Cases, which are :
> *  **test_suite:**
> *  **update_driver:**
> *  **browser_type:**
> *  **execution_profile:**
> *  **katalon_version:**

### Version 1.2 Update

Change logs :
* A Lot changes on report engine, now using allure cucumber report.

### Version 1.2.1 Update

Change logs :
* Change Katalon version on "new" container

### Version 1.2.3 Update

Change logs :
* ~~Support for upgrade katalon container on the go by passing **katalon_version:<insert katalon version here>**~~

### Version 1.3 Update

Change logs :
* Support for Test Suite Platform selector by passing **platform:**. Platform available are **Web, Lite, API and Cucumber**
* Change default container to **new**