*** Settings ***
Library    AppiumLibrary
Resource    keywords.txt

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}  Android
${PLATFORM_VERSION}  15
${DEVICE_NAME}    R5CX10MH49M
${APP_PACKAGE}    de.danoeh.antennapod
${APP_ACTIVITY}   de.danoeh.antennapod.activity.SplashActivity
${AUTOMATION_NAME}    UiAutomator2

*** Test Cases ***
Open App
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}
    Sleep    5s
    Close Application

Filter Downloaded Podcasts
    [Tags]    UC-FP-01    subscription
    [Setup]    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}
    Add Podcast Channel
    ${episodeName}=    Download Podcasts    1
    Log To Console    Episode Name: ${episodeName}
    Sleep    10s
    # [Teardown]    Close Application