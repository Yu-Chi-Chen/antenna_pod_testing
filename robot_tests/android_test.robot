*** Settings ***
Library    AppiumLibrary
Resource    keywords.txt

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}  Android
${PLATFORM_VERSION}  13
${DEVICE_NAME}    emulator-5554
${APP_PACKAGE}    de.danoeh.antennapod
${APP_ACTIVITY}   de.danoeh.antennapod.activity.SplashActivity
${AUTOMATION_NAME}    UiAutomator2
${FULL_RESET}    true
${APP}    ./Documents/git/antenna_pod_testing/antennapod.apk

*** Test Cases ***
Open App
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    Sleep    5s
    Close Application

Filter Downloaded Podcasts
    [Tags]    UC-FP-01    subscription
    [Setup]    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}
    Add Podcast Channel
    ${episodeName}=    Download Podcasts    1
    
    Log To Console    \n Episode Name: ${episodeName}
    #Sleep    10s
    # [Teardown]    Close Application