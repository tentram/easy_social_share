# Easy Social Share

Flutter social media sharing plugin for WhatsApp, Instagram, Facebook, Twitter, TikTok, and system's built-in sharing dialog.

A plugin that just works - reliable social media sharing for your Flutter apps.

## Screenshots

#### Android
<img src="https://github.com/appinioGmbH/flutter_packages/blob/main/assets/social_share/android.jpg?raw=true">

#### iOS
<img src="https://github.com/appinioGmbH/flutter_packages/blob/main/assets/social_share/ios.jpg?raw=true">

## Features

### Supported Platforms
- **WhatsApp**: Share text messages and files (single or multiple)
- **Telegram**: Share text messages and files (single or multiple)
- **Twitter**: Share text messages with optional file attachments
- **Instagram**:
  - Direct messages
  - Feed posts (single or multiple images)
  - Reels (videos)
  - Stories (with customizable backgrounds and stickers)
- **Facebook**:
  - Feed posts with hashtags and files
  - Stories (with customizable backgrounds and stickers)
- **TikTok**: Share content to TikTok status (Android) or posts (iOS)
- **Messenger**: Share text messages
- **SMS**: Share text messages and files (single or multiple)
- **System Share**: Use the native platform share dialog
- **Clipboard**: Copy text to clipboard

### Cross-Platform Features
- **Get Installed Apps**: Check which social media apps are installed on the device
- **Platform-specific APIs**: Optimized methods for Android and iOS with different capabilities

## Platform Support

| Platform | Supported | File Sharing | Multiple Files |
| -------- | --------- | ------------ | -------------- |
| Android  | ✅         | ✅            | ✅              |
| iOS      | ✅         | ⚠️ Limited    | ❌              |

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  easy_social_share: ^0.1.0
```

Then run:

```bash
flutter pub get
```

### Android Setup

Paste the following attribute in the manifest tag in the AndroidManifest.xml

```xml

<manifest xmlns:tools="http://schemas.android.com/tools">
</manifest>
```

For example:

```xml

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          xmlns:tools="http://schemas.android.com/tools"
          package="your package...">
</manifest>
```

Add these permissions and queries to your AndroidManifest.xml

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:tools="http://schemas.android.com/tools"
        package="your package...">
  
<queries>
    <!-- Explicit apps you know in advance about: -->
          
    <package android:name="com.instagram.android" />
    <package android:name="com.zhiliaoapp.musically" />
    <package android:name="com.facebook.katana" />
    <package android:name="com.facebook.orca" />
    <package android:name="org.telegram.messenger" />
    <package android:name="com.whatsapp" />
    <package android:name="com.twitter.android" />
  
    <provider android:authorities="com.facebook.katana.provider.PlatformProvider" /> <!-- allows app to access Facebook app features -->
    <provider android:authorities="com.facebook.orca.provider.PlatformProvider" /> <!-- allows sharing to Messenger app -->
</queries>

  <!-- Required only if your app needs to access images or photos
       that other apps created. -->
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />

  <!-- Required only if your app needs to access videos
       that other apps created. -->
<uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />

  <!-- Required only if your app needs to access audio files
       that other apps created. -->
<uses-permission android:name="android.permission.READ_MEDIA_AUDIO" />

<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"
          android:maxSdkVersion="29" />
<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.INTERNET" />

</manifest>
```

## NOTE: 

`MANAGE_EXTERNAL_STORAGE` requires additional permissions from google. So do not add it if you are not planning to access external storage.
Check this for more info. https://support.google.com/googleplay/android-developer/answer/10467955?hl=en


Create xml folder and add a provider path file to it (for example: provider_paths_app.xml) in android/app/src/main/res and 
add the lines below to the created xml file

```xml
<?xml version="1.0" encoding="utf-8"?>
<paths>
    <external-path
        name="external_files"
        path="." />
</paths>
```

After created your own file provider and define your own path paste them into this and add to your AndroidManifest.xml

```xml

<provider android:name="androidx.core.content.FileProvider" 
        android:authorities="${applicationId}.provider"
    android:exported="false" android:grantUriPermissions="true">
    <meta-data android:name="android.support.FILE_PROVIDER_PATHS" android:resource="@xml/[your_custom_fileProvider_file_name]" />
</provider>
```

#### Facebook app register

+ In `/android/app/src/main/values` folder create a `strings.xml` file and add your facebook app id and facebook client token.
+ To get the facebook client token: Open your app on Meta for developer ([link](https://developers.facebook.com)) > Settings > Advanced > Security >
  Application code
+ To get the facebook app id follow the Meta link above and go to your app Settings > Basic information > App ID

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="facebook_app_id">[facebook_app_id]</string>
    <string name="facebook_client_token">[facebook_client_token]</string>
</resources>
```

+ Add this inside the application tag in android manifest.

```xml
  <provider android:name="com.facebook.FacebookContentProvider" android:authorities="com.facebook.app.FacebookContentProvider[facebook_app_id]"
         android:exported="true" />
     <meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id" />
     <meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token" />
     <meta-data android:name="com.facebook.sdk.ApplicationName" android:value="${applicationName}"/>
     <activity android:name="com.facebook.FacebookActivity" android:configChanges="keyboard|keyboardHidden|screenLayout|screenSize|orientation" android:label="${applicationName}" />
```


+ After complete the step above add these xml tags to your AndroidManifest.xml

### iOS

***Open Xcode and change your deployment target to iOS 11***

Add these lines to your Info.plist file

```xml
<dict>
  <key>CFBundleURLTypes</key>
  <array>
  <dict>
      <key>CFBundleURLSchemes</key>
      <array>
          <string>fb[your_facebook_app_id]</string>
      </array>
  </dict>
  </array>
  
  <key>LSApplicationQueriesSchemes</key>
  <array>
  <string>instagram</string>
  <string>fb</string>
  <string>fbauth2</string>
  <string>fbshareextension</string>
  <string>fbapi</string>
  <string>facebook-reels</string>
  <string>facebook-stories</string>
  <string>fb-messenger-share-api</string>
  <string>fb-messenger</string>
  <string>tg</string>
  <string>whatsapp</string>
  <string>twitter</string>
  </array>
  
  <key>NSPhotoLibraryUsageDescription</key>
  <string>$(PRODUCT_NAME) needs permission to access photos and videos on your device</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>$(PRODUCT_NAME) does not require access to the microphone.</string>
  <key>NSCameraUsageDescription</key>
  <string>$(PRODUCT_NAME) requires access to the camera.</string>
  <key>NSAppleMusicUsageDescription</key>
  <string>$(PRODUCT_NAME) requires access to play music</string>
  
  <key>FacebookAppID</key>
  <string>[your_facebook_app_id]</string>
  <key>FacebookClientToken</key>
  <string>[your_facebook_client_token]</string>
  <key>FacebookDisplayName</key>
  <string>[your_facebook_app_display_name]</string>
  
  <key>NSBonjourServices</key>
  <array>
  <string>_dartobservatory._tcp</string>
  </array>
</dict>
```

***The facebook app id and facebook client token you can get by complete the steps mentioned on Android config***

Add these lines to the AppDelegate.swift file

```
import FBSDKCoreKit

// Put these lines in the application function
FBSDKCoreKit.ApplicationDelegate.shared.application(
        application,
        didFinishLaunchingWithOptions: launchOptions
)
```

<br />

***If you want to share files to tiktok (iOS), you can follow the steps below. For sharing to android you don't need these steps.***

Step 1 - Install Tiktok Sdk

```
Add the library to your XCode project as a Swift Package:

1- In XCode, click File -> Add Packages...
2- Paste the repository URL: https://github.com/tiktok/tiktok-opensdk-ios
3- Select Dependency Rule -> Up to Next Major Version and input the major version you want (i.e. 2.2.0 You can find the latest release here.)
4- Select Add to Project -> Your project
5- Click Copy Dependency and select the TikTokOpenShareSDK, TiktokOpenCoreSdk libraries.

```

Step 2 - Configure your project

-Configure your Xcode project
-Open your Info.plist file and add or update the following key-value pairs:
-Add the following values to LSApplicationQueriesSchemes:
1. tiktokopensdk for Login Kit.
2. tiktoksharesdk for Share Kit.
3. snssdk1233 and snssdk1180 to check if TikTok is installed on your device.
4. Add TikTokClientKey key with your app's client key, obtained from the TikTok for Developers website, as the value.
5. Add your app's client key to CFBundleURLSchemes.
```plist
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>tiktokopensdk</string>
    <string>tiktoksharesdk</string>
    <string>snssdk1180</string>
    <string>snssdk1233</string>
</array>
<key>TikTokClientKey</key>
<string>$TikTokClientKey</string>
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>$TikTokClientKey</string>
    </array>
  </dict>
</array>

```

Step 3 - Add the following code to your app's AppDelegate:

```swift

import UIKit
import Flutter
import TikTokOpenSDKCore
import TikTokOpenShareSDK
import Foundation
import Photos

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let cntrl : FlutterViewController = self.window?.rootViewController as! FlutterViewController
      let tiktok_channel = FlutterMethodChannel(name: "appinio_social_share_tiktok", binaryMessenger: cntrl.binaryMessenger)
          
      tiktok_channel.setMethodCallHandler(
        {
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          if call.method == "tiktok_post" {
              let args = call.arguments as? [String: Any?]
              self.shareVideoToTiktok(args: args!, result: result)
          }else{
               result("Not implemented!")
          }
        })
      

    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }



    
    override func application(_ app: UIApplication,open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if (TikTokURLHandler.handleOpenURL(url)) {
            return true
        }
        return false
    }
    
    override func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if (TikTokURLHandler.handleOpenURL(userActivity.webpageURL)) {
            return true
        }
        return false
    }
    
    
    func shareVideoToTiktok(args : [String: Any?],result: @escaping FlutterResult) {
        let videoFile = args["videoFile"] as? String
        let redirectUrl = args["redirectUrl"] as? String
        let fileType = args["fileType"] as? String
        let videoData = try? Data(contentsOf:  URL(fileURLWithPath: videoFile!)) as NSData
        

        PHPhotoLibrary.shared().performChanges({

            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
            let filePath = "\(documentsPath)/\(Date().description)" + (fileType == "image" ? ".jpeg" : ".mp4")

            videoData!.write(toFile: filePath, atomically: true)
            if fileType == "image" {
                PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: URL(fileURLWithPath: filePath))

            }else {
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filePath))

            }
        },
        completionHandler: { success, error in

            if success {

                let fetchOptions = PHFetchOptions()

                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

                let fetchResult = PHAsset.fetchAssets(with: fileType == "image" ? .image : .video, options: fetchOptions)

                if let lastAsset = fetchResult.firstObject {
                    let localIdentifier = lastAsset.localIdentifier
                    let shareRequest = TikTokShareRequest(localIdentifiers: [localIdentifier], mediaType: fileType == "image" ? .image : .video, redirectURI: redirectUrl!)
                    shareRequest.shareFormat = .normal
                    DispatchQueue.main.async {
                        shareRequest.send()
                        result("success")
                    }
                }
            }
            else if let error = error {

                print(error.localizedDescription)
            }
            else {

                result("Error getting the files!")
            }
        })
    }

}

private func registerPlugins(registry: FlutterPluginRegistry) {
}

```

Step 3 - Create a tiktok app on tiktok [developer portal](https://developers.tiktok.com/apps/) and get a client key and add it in info.plist acc to step 2.

Obtain the [client_key](https://developers.tiktok.com/apps/) located in the Appdetails section of your app on the TikTok for Developers website. Then add Share Kit to your app by navigating to the Manage apps page, and clicking + Add products.

<img width="862" alt="Screenshot 2023-12-06 at 09 55 38" src="https://github.com/appinioGmbH/flutter_packages/assets/58891556/9b1f4d00-96ca-4496-91e8-6aa2b5b6c992">

Your app must have access to the user's photo library to successfully share videos to TikTok.

Done ✅  - Now shareToTiktokPost will start working for IOS as well.

## Quick Start

```dart
import 'package:easy_social_share/easy_social_share.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  EasySocialShare easySocialShare = EasySocialShare();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Share to WhatsApp"),
            onPressed: () async {
              // Check if WhatsApp is installed
              Map<String, bool> apps = await easySocialShare.getInstalledApps();

              if (apps['whatsapp'] == true) {
                // Share to WhatsApp (Android)
                await easySocialShare.android.shareToWhatsapp(
                  "Hello from Easy Social Share!",
                  "/path/to/image.jpg"
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
```

## Usage

### Basic Setup

```dart
import 'package:easy_social_share/easy_social_share.dart';

EasySocialShare easySocialShare = EasySocialShare();
```

### Check Installed Apps

```dart
Map<String, bool> apps = await easySocialShare.getInstalledApps();
print('WhatsApp installed: ${apps['whatsapp']}');
print('Instagram installed: ${apps['instagram']}');
```

### Platform-Specific Usage

The plugin provides platform-specific APIs to handle differences between Android and iOS:

#### Android Usage
Access methods via `easySocialShare.android.methodName()`

```dart
// Share to WhatsApp with image
await easySocialShare.android.shareToWhatsapp(
  "Check out this image!",
  "/path/to/image.jpg"
);

// Share multiple files to WhatsApp
await easySocialShare.android.shareFilesToWhatsapp([
  "/path/to/image1.jpg",
  "/path/to/image2.jpg",
]);

// Share to Instagram Story with custom background
await easySocialShare.android.shareToInstagramStory(
  'your_app_id',
  backgroundImage: '/path/to/background.jpg',
  stickerImage: '/path/to/sticker.png',
  backgroundTopColor: '#FF0000',
  backgroundBottomColor: '#00FF00',
);
```

#### iOS Usage
Access methods via `easySocialShare.iOS.methodName()`

```dart
// Share text to WhatsApp
await easySocialShare.iOS.shareToWhatsapp("Hello!");

// Share image to WhatsApp (separate method for iOS)
await easySocialShare.iOS.shareImageToWhatsApp("/path/to/image.jpg");

// Share to system dialog with multiple files
await easySocialShare.iOS.shareToSystem(
  "Check out these files!",
  filePaths: ["/path/to/file1.jpg", "/path/to/file2.pdf"]
);
```

## API Reference

### Basic Usage

```dart
import 'package:easy_social_share/easy_social_share.dart';

EasySocialShare easySocialShare = EasySocialShare();

// Check installed apps
Map<String, bool> apps = await easySocialShare.getInstalledApps();

// Share to WhatsApp (Android)
await easySocialShare.android.shareToWhatsapp("Hello!", "/path/to/image.jpg");

// Share to system (iOS)
await easySocialShare.iOS.shareToSystem("Hello!", filePaths: ["/path/to/image.jpg"]);
```

### Available Methods

#### Platform Usage

**Android**: Access methods via `easySocialShare.android.methodName()`
- Supports file sharing for most platforms
- Supports multiple file sharing for WhatsApp, Telegram, Instagram Feed, SMS, and System Share
- Includes TikTok Status sharing (Android-only feature)

**iOS**: Access methods via `easySocialShare.iOS.methodName()`
- Limited file sharing capabilities compared to Android
- WhatsApp requires separate methods for text (`shareToWhatsapp`) and images (`shareImageToWhatsApp`)
- Includes TikTok Post sharing (requires additional setup)
- No multiple file sharing support

#### Unified Methods Table

| Platform             | Method                     | Android Parameters        | iOS Parameters                   | Multiple Files Support                 |
| -------------------- | -------------------------- | ------------------------- | -------------------------------- | -------------------------------------- |
| **Cross-Platform**   | `getInstalledApps()`       | -                         | -                                | Returns `Map<String, bool>`            |
| **WhatsApp**         | `shareToWhatsapp()`        | message, filePath?        | message (text only)              | Android: `shareFilesToWhatsapp()`      |
|                      | `shareImageToWhatsApp()`   | ❌                         | filePath                         | ❌                                      |
| **Telegram**         | `shareToTelegram()`        | message, filePath?        | message (text only)              | Android: `shareFilesToTelegram()`      |
| **Twitter**          | `shareToTwitter()`         | message, filePath?        | message, filePath?               | ❌                                      |
| **Instagram Direct** | `shareToInstagramDirect()` | message                   | message                          | ❌                                      |
| **Instagram Feed**   | `shareToInstagramFeed()`   | message, filePath?        | imagePath                        | Android: `shareFilesToInstagramFeed()` |
| **Instagram Reels**  | `shareToInstagramReels()`  | videoPaths (List)         | videoPath (String)               | ❌                                      |
| **Instagram Story**  | `shareToInstagramStory()`  | appId + story options*    | appId + story options*           | ❌                                      |
| **Facebook**         | `shareToFacebook()`        | hashtag, filePaths        | hashtag, filePaths               | ❌                                      |
| **Facebook Story**   | `shareToFacebookStory()`   | appId + story options*    | appId + story options*           | ❌                                      |
| **TikTok**           | `shareToTiktokStatus()`    | filePaths                 | ❌ (Android only)                 | ❌                                      |
|                      | `shareToTiktokPost()`      | ❌ (iOS only)              | videoFile, redirectUrl, fileType | ❌                                      |
| **Messenger**        | `shareToMessenger()`       | message                   | message                          | ❌                                      |
| **SMS**              | `shareToSMS()`             | message, filePath?        | message (text only)              | Android: `shareFilesToSMS()`           |
| **System Share**     | `shareToSystem()`          | title, message, filePath? | message, filePaths?              | Android: `shareFilesToSystem()`        |
| **Clipboard**        | `copyToClipBoard()`        | message                   | message                          | ❌                                      |

*Story options: `stickerImage`, `backgroundImage`, `backgroundVideo`, `backgroundTopColor`, `backgroundBottomColor`, `attributionURL`

### Platform Differences

| Feature        | Android     | iOS                |
| -------------- | ----------- | ------------------ |
| File sharing   | ✅ Most apps | ⚠️ Limited          |
| Multiple files | ✅           | ❌                  |
| TikTok Status  | ✅           | ❌                  |
| TikTok Post    | ❌           | ✅ (requires setup) |

### Quick Examples

```dart
// Check if WhatsApp is installed
Map<String, bool> apps = await easySocialShare.getInstalledApps();
if (apps['whatsapp'] == true) {
  // Share to WhatsApp
}

// Share image to Instagram Story
await easySocialShare.android.shareToInstagramStory(
  'your_app_id',
  backgroundImage: '/path/to/image.jpg',
);

// Share multiple images (Android only)
await easySocialShare.android.shareFilesToWhatsapp([
  '/path/to/image1.jpg',
  '/path/to/image2.jpg',
]);
```

## Advanced Examples

### Instagram Story Sharing

```dart
// Share to Instagram Story with custom styling
await easySocialShare.android.shareToInstagramStory(
  'your_instagram_app_id', // Get this from Facebook Developer Console
  stickerImage: '/path/to/sticker.png',
  backgroundImage: '/path/to/background.jpg',
  backgroundTopColor: '#FF6B6B',
  backgroundBottomColor: '#4ECDC4',
  attributionURL: 'https://your-app.com',
);
```

### Multiple File Sharing (Android Only)

```dart
// Share multiple images to WhatsApp
await easySocialShare.android.shareFilesToWhatsapp([
  '/path/to/image1.jpg',
  '/path/to/image2.jpg',
  '/path/to/image3.jpg',
]);

// Share multiple files via system dialog
await easySocialShare.android.shareFilesToSystem(
  'Check out these files!',
  [
    '/path/to/document.pdf',
    '/path/to/image.jpg',
    '/path/to/video.mp4',
  ],
);
```

### Platform-Specific Conditional Sharing

```dart
import 'dart:io';

Future<void> shareContent(String message, String filePath) async {
  if (Platform.isAndroid) {
    // Android supports file sharing for most platforms
    await easySocialShare.android.shareToWhatsapp(message, filePath);
  } else if (Platform.isIOS) {
    // iOS requires separate methods for text and images
    await easySocialShare.iOS.shareToWhatsapp(message);
    if (filePath.isNotEmpty) {
      await easySocialShare.iOS.shareImageToWhatsApp(filePath);
    }
  }
}
```

## Platform Differences

### Android vs iOS Capabilities

| Feature         | Android                   | iOS                      | Notes                     |
| --------------- | ------------------------- | ------------------------ | ------------------------- |
| File sharing    | ✅ Most apps support files | ⚠️ Limited support        | iOS has more restrictions |
| Multiple files  | ✅ Supported               | ❌ Not supported          | Android only feature      |
| TikTok Status   | ✅ Supported               | ❌ Not available          | Android exclusive         |
| TikTok Post     | ❌ Not available           | ✅ Supported              | iOS exclusive             |
| WhatsApp images | Combined method           | Separate method required | Different API approaches  |

### File Type Support

- **Images**: JPG, PNG, GIF (most platforms)
- **Videos**: MP4, MOV (Instagram Reels, TikTok, Stories)
- **Documents**: PDF, DOC, TXT (System Share, some messaging apps)
- **Multiple formats**: Supported on Android for compatible apps

## Requirements

- **Flutter**: >=3.32.4
- **Dart**: >=3.0.0 <4.0.0
- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 11.0+

## Setup

### Android Setup

Add the following to your `android/app/src/main/AndroidManifest.xml`:

```xml
<queries>
    <package android:name="com.whatsapp" />
    <package android:name="com.instagram.android" />
    <package android:name="com.facebook.katana" />
    <package android:name="com.twitter.android" />
    <package android:name="org.telegram.messenger" />
    <package android:name="com.zhiliaoapp.musically" />
    <package android:name="com.facebook.orca" />
</queries>
```

### iOS Setup

For TikTok sharing on iOS, add to your `ios/Runner/Info.plist`:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>whatsapp</string>
    <string>instagram</string>
    <string>instagram-stories</string>
    <string>fb</string>
    <string>fb-messenger</string>
    <string>twitter</string>
    <string>tg</string>
    <string>tiktokopensdk</string>
</array>
```

## Error Handling

```dart
try {
  String result = await easySocialShare.android.shareToWhatsapp(
    "Hello World!",
    "/path/to/image.jpg"
  );
  print('Share result: $result');
} catch (e) {
  print('Error sharing: $e');
  // Handle error appropriately
}
```

## Support

Not many people have time, so thanks for your support!

- You can like this package in [pub.dev](https://pub.dev/packages/easy_social_share) or start this GitHub repository.
- You might want to also help answering reported [issues](https://github.com/tentram/easy_social_share/issues)
- Or you might want to submit some [pull requests](https://github.com/tentram/easy_social_share/pulls).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits
Thanks to [Appinio](https://github.com/appinioGmbH) ([website](https://appinio.app/en)) for the [`appinio_social_share`](https://github.com/appinioGmbH/flutter_packages/tree/main/packages/appinio_social_share) package.

My package was a "copy and modify" version of it. You can also visit their [pub.dev/packages/appinio_social_share](https://pub.dev/packages/appinio_social_share) page.
