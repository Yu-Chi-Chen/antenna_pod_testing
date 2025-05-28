# antennaPodTesting

## 環境建置

建立 venv - for macOS
`python3 -m venv venv`
啟動 venv
`source venv/bin/activate`
安裝 requirements.txt 中的套件
`pip install -r requirements.txt`

在自己電腦全域環境安裝 Appium Server
`brew install node`
`npm install -g appium`
`appium driver install uiautomator2`
啟動 Appium Server
`appium --base-path /wd/hub`

實體手機做測試：
`brew install android-platform-tools`
手機開啟開發人員模式，並檢測電腦是否連接手機成功
`adb devices`

appium inspector setting:

# 實體機器

`{
  "platformName": "Android",
  "appium:automationName": "UiAutomator2",
  "appium:deviceName": "Android",
  "appium:appPackage": "de.danoeh.antennapod",
  "appium:appActivity": "de.danoeh.antennapod.activity.SplashActivity"
}`

# Android Studio 虛擬機

`{
  "platformName": "Android",
  "appium:automationName": "UiAutomator2",
  "appium:deviceName": "Android",
  "appium:appPackage": "de.danoeh.antennapod",
  "appium:appActivity": "de.danoeh.antennapod.activity.SplashActivity",
  "appium:fullReset": "true",
  "appium:app": "C:\Users\Yuki\Documents\git\antenna_pod_testing\antennapod.apk"
}`
