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

---

實體手機做測試：

`brew install android-platform-tools`

手機開啟開發人員模式，並檢測電腦是否連接手機成功

`adb devices`

## appium inspector setting:

### 實體機器

`{
  "platformName": "Android",
  "appium:automationName": "UiAutomator2",
  "appium:deviceName": "Android",
  "appium:appPackage": "de.danoeh.antennapod",
  "appium:appActivity": "de.danoeh.antennapod.activity.SplashActivity"
}`

### Android Studio 虛擬機

`{
  "platformName": "Android",
  "appium:automationName": "UiAutomator2",
  "appium:deviceName": "Android",
  "appium:appPackage": "de.danoeh.antennapod",
  "appium:appActivity": "de.danoeh.antennapod.activity.SplashActivity",
  "appium:fullReset": "true",
  "appium:app": "C:/Users/Yuki/Documents/git/antenna_pod_testing/antennapod.apk"
}`

## Notes and Discussion

TC-MC-06 的撥放條本身好像不可拆分? 這樣 'Drag And Drop' 這個 keyword 不能用

[Question] TC-MC-07-1 執行最後跳入 Home 頁面太快，有沒有需要停幾秒? 有需要 Teardown 嗎?原本就會直接回到 Home Page

TC-MC-08 有過測試撥放兩秒，原本是 00:00:04，暫停後是 00:00:08。不確定是不是當下後面 keywords 錯所以影響?後續實測確實都是三秒，但不確定如果真的只有寫 3 會不會造成測試不穩定?
