# flutter_web_sdk
LocNaviWebSDK 对应的fultter plugin，目前提供iOS、Android平台代码支持。

## 版本對照

本套件維護兩條版本線，`flutter pub get` 會依據專案的 Dart SDK 自動選擇適用版本。

| 套件版本 | Flutter | Dart | Null Safety | 分支 |
| --- | --- | --- | --- | --- |
| `1.x` | >= 2.5.0 | >= 2.19.0 | 支援 | `main` |
| `0.1.x` | >= 1.20.0 | >= 2.7.0 | 不支援 | `legacy-1.22` |

### 安裝

```bash
flutter pub add locnavi_web_sdk
```

或直接於 `pubspec.yaml` 指定：

```yaml
dependencies:
  locnavi_web_sdk: ^1.0.0   # Flutter 2.5 以上
  # locnavi_web_sdk: ^0.1.0 # Flutter 1.20 ~ 2.0
```

> `0.1.x` 相容線僅修正缺陷，不再新增功能，版號固定維持在 `0.x`。
> 兩條線的公開 API 完全相同，差別僅在型別是否標記為 nullable。

## SDK 文檔

[iOS文檔](https://github.com/locnavi/locnavi-websdk-ios/blob/master/README.md)

[Android文檔](https://github.com/locnavi/IndoorNavigationAndroidWebSDK/blob/main/README.md)

## 獲取AppKey
appKey、mapId、targetName、targetId等信息請向 richard.chin@locnavi.com 申請

## iOS
在iOS工程的info.plist中添加授权申明

```bash
    <key>NSBluetoothAlwaysUsageDescription</key>
	<string>室内定位需要使用蓝牙功能</string>
	<key>NSCameraUsageDescription</key>
	<string>AR需要使用摄像头功能</string>
	<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
	<string>请求在App使用期间使用定位功能</string>
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>请求在App使用期间使用定位功能</string>
	<key>NSMicrophoneUsageDescription</key>
	<string>语音识别需要用到麦克风功能</string>
	<key>NSSpeechRecognitionUsageDescription</key>
	<string>请求在App使用期间使用语音识别功能</string>
  ```

## iOS
在Android工程的AndroidMainfest.xxml中添加

```bash
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
    <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
    <uses-permission android:name="android.permission.BLUETOOTH" />
    <!-- 调用定位权限 -->
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <!-- 调用摄像头的权限 -->
    <uses-permission android:name="android.permission.CAMERA"/>
    <!-- 调用麦克风的权限 -->
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
```

## flutter

### 初始化
```dart
  _locnaviWebSdkPlugin.init('appkey');
  //或选择性 设置服务url、ibeacon的扫描uuid、定时上传定位数据及上传间隔
  await _locnaviWebSdkPlugin.init('nqB6HPIU2C', serverUrl: 'https://xxx.com', uuids: ['uuid1', 'uuid2'], uploadApi: 'https://xxx.com', uploadInterval: 1000, userId:'testUser');
```

### 显示室内地图
```dart
  _locnaviWebSdkPlugin.openMap('mapId');
```

### 导航至具体的poi位置
```dart
  //poi数据需要在导航系统中录入过，
  _locnaviWebSdkPlugin.openMap('mapId', 'poiId');
```
    
