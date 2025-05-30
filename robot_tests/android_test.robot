*** Settings ***
Library    AppiumLibrary
Resource    allLocalKeywords.txt

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}  Android
${PLATFORM_VERSION}  13
${DEVICE_NAME}    emulator-5554
${APP_PACKAGE}    de.danoeh.antennapod
${APP_ACTIVITY}   de.danoeh.antennapod.activity.SplashActivity
${AUTOMATION_NAME}    UiAutomator2
${FULL_RESET}    true
${APP}    C:/Users/Yuki/Documents/git/antenna_pod_testing/antennapod.apk

*** Test Cases ***
Open App
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    Sleep    5s
    Close Application

Filter Paused Podcasts
    [Tags]    TC-FP-01    subscription
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1    isNeedTitle=True
    ...                 AND    Click Back Button In Podcast Page
    Filter Paused Podcast
    Verify Filter Is Applied    ${episodeTitle}
    [Teardown]    Clear Filter And Close Application

Fast Forward Podcast To Specific Time
    [Tags]    TC-MC-06
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Page
    ...                 AND    Go To Home Page
    # There is a problem
    Log    123

Skip To Next Podcast In Queue With No Next Podcast
    [Tags]    TC-MC-07
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Page
    ...                 AND    Go To Home Page
    Click Audio Player
    Click To Skip Podcast
    Verify Skip To Next Podcast With Only One Podcast In Queue Will Back To Home Page
    [Teardown]    Close Application

Skip To Next Podcast In Queue With Has Next Podcast
    [Tags]    TC-MC-07
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Page
    ...                 AND    Go To Home Page
    Log    123

Adjust Podcast Speed
    [Tags]    TC-MC-08
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Page
    ...                 AND    Go To Home Page
    Log    123