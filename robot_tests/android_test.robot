*** Settings ***
Library    AppiumLibrary
Resource    allLocalKeywords.txt
Resource    Variables.txt

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
    ...                 AND    Click Back Button In Podcast Information Page
    Filter Paused Podcast
    Verify Filter Is Applied    ${episodeTitleList}[0]
    [Teardown]    Clear Filter And Close Application

Fast Forward Podcast To Specific Time
    [Tags]    TC-MC-06
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Information Page
    ...                 AND    Go To Home Page
    # There is a problem
    Log    123

Skip To Next Podcast In Queue With No Next Podcast
    [Tags]    TC-MC-07
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Information Page
    ...                 AND    Go To Home Page
    Play Podcast In Queue With No Next Podcast
    Verify Skip To Next Podcast With Only One Podcast In Queue Will Back To Home Page
    [Teardown]    Close Application

Skip To Next Podcast In Queue With Has Next Podcast
    [Tags]    TC-MC-07
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Add Podcasts To Queue    ${toPlayList}
    ...                 AND    Go To Queue Page
    Play Podcast In Queue With Has Next Podcast
    Verify Skip To Next Podcast With Has Next Podcast Will Is Expected
    [Teardown]    Run Keywords    Click Back Button And Go To Home Page
    ...                    AND    Close Application

Adjust Podcast Speed
    [Tags]    TC-MC-08
    [Setup]    Run Keywords    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    fullReset=${FULL_RESET}    app=${APP}
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Information Page
    ...                 AND    Go To Home Page
    Set Podcast To Specific Speed
    Verify Speed Is Adjusted
    [Teardown]    Run Keywords    Click Back Button In Podcast Page
    ...                    AND    Close Application