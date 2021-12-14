# Kvalifika SDK Swift Sample

Use Kvalifika SDK to easily integrate into your iOS app

Table of content:

- [Installation](#installation)
- [Initialize the SDK](#initialize-the-sdk)
- [App Permissions](#app-permissions)
- [Start Verification](#start-verification)
- [Handling Verifications](#handling-verifications)
  - [Callback Methods](#callback-methods)
  - [Error Codes](#error-codes)
- [UI Customizations](#ui-customizations)
  - [Appearance](#appearance)
  - [Language](#language)
- [Development Mode](#development-mode)
- [Note](#note)
    &nbsp;

## Installation

Add following to project's main `Podfile` file

```podspec
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Kvalifika/kvalifika-cocoapods-specs.git'
source 'https://github.com/Kvalifika/zoom-cocoapods-specs.git'

platform :ios, '11.0'

# Your Target
target 'kvalifika-swift-sample' do
  use_frameworks!

  pod 'Kvalifika'
end
```

If you want to update pod run in terminal
```bash
pod update Kvalifika
```

&nbsp;

## Initialize the SDK

```Swift
import Kvalifika
```

After that you need to initialize SDK with **your appId**.

```Swift
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize SDK and provide names of images
        KvalifikaSDK.initialize(
            AppID: "YOUR APP ID",
            Locale:  KvalifikaSDKLocale.GE.rawValue,
            Logo: "AppLogo",
            DocumentIcon: "DocLogo",
            CancelIcon: "cancel",
            ActiveFlashIcon: "",
            InactiveFlashIcon: "",
            onInitialize: onInitialize,
            onStart: onStart,
            onFinish: onFinish,
            onError: onError
        )
    }

    func onInitialize() {
        print("onInitialize")
	
	// Start session right after initialization
	let _ = KvalifikaSDK.startSession(onViewController: self)
    }

    func onStart(sessionId: String) {
        print("onStart")
    }

    func onFinish(sessionId: String) {
        print("onFinish")
    }

    func onError(error: KvalifikaSDKError) {
        print(error)
    }
}
```

&nbsp;

## App Permissions

Please add the following permissions to your app's `Info.plist`,
so that the Kvalifika iOS SDK can access a user's camera to run a verification.
You can do this in the property list view or by code.
Right-click on `Info.plist` and select Open As -> Source Code.
Add the lines below somewhere inside the `<dict> </dict>`

```plist
<!-- permission strings to be include in info.plist -->
<key>NSCameraUsageDescription</key>
<string>Please give us access to your camera, to complete the verification.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Please give us access to your photo library to verify you.</string>
```

&nbsp;

## Start Verification

Call `Kvalifika.startSession()` on button click event

```Swift
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize SDK
        KvalifikaSDK.initialize(
            AppID: "YOUR APP ID",
            Locale:  KvalifikaSDKLocale.GE.rawValue,
            Logo: "AppLogo",
            DocumentIcon: "DocLogo",
            CancelIcon: "cancel",
            ActiveFlashIcon: "",
            InactiveFlashIcon: "",
            onInitialize: onInitialize,
            onStart: onStart,
            onFinish: onFinish,
            onError: onError
        )
    }

    func onInitialize() {
        print("onInitialize")
    }

    func onStart(sessionId: String) {
        print("onStart")
    }

    func onFinish(sessionId: String) {
        print("onFinish")
    }

    func onError(error: KvalifikaSDKError) {
        print(error)
    }

    @IBAction func onStart(_ sender: Any) {
        let _ = KvalifikaSDK.startSession(onViewController: self)
    }
}
```

&nbsp;

## Handling Verifications

It's useful to know if a user has completed the verification flow or canceled it. For this, you can implement the callback methods.

&nbsp;

### Callback Methods

| Method       | Description                                                                                |
| ------------ | ------------------------------------------------------------------------------------------ |
| onInitialize | This callback method is triggered when SDK initializes.                                    |
| onStart      | This callback method is triggered when user starts verification.                           |
| onFinish     | This callback method is triggered when user completes verification. Get session data here. |
| onError      | This callback method is triggered on error. [Error Codes](#error-codes).                   |

```swift
    func onInitialize() {
        print("onInitialize")
    }

    func onStart(sessionId: String) {
        print("onStart")
    }

    func onFinish(sessionId: String) {
        // Fetch session data here from your server
        print("onFinish")
    }

    func onError(error: KvalifikaSDKError) {
        print(error)
    }
```

&nbsp;

### Error Codes

| Error Code                    | Description                                                                              |
| ----------------------------- | ---------------------------------------------------------------------------------------- |
| INVALID_APP_ID                | Kvalifika App Id is incorrect                                                            |
| USER_CANCELLED                | User cancelled before completing verification.                                           |
| TIMEOUT                       | Cancelled due to inactivity.                                                             |
| CAMERA_PERMISSION_DENIED      | Camera is required but access prevented by user settings.                                |
| LANDSCAPE_MODE_NOT_ALLOWED    | Verification cancelled because device is in landscape mode.                              |
| REVERSE_PORTRAIT_NOT_ALLOWED  | Verification cancelled because device is in reverse portrait mode.                       |
| FACE_IMAGES_UPLOAD_FAILED     | Could not upload face images. Internal request failed.                                   |
| NO_MORE_ATTEMPTS | User has reached maximum limit of attempts                    |
| UNKNOWN_INTERNAL_ERROR        | Session failed because of an unhandled internal error.                                   |

&nbsp;

## UI Customizations

### Appearance

You can customize logo and icons.
Provide resource names.

```Swift
KvalifikaSDK.initialize(
    Logo: "AppLogo",
    DocumentIcon: "DocLogo",
    CancelIcon: "cancel",
    ActiveFlashIcon: "",
    InactiveFlashIcon: "",
)
```

&nbsp;

### Language

You can set locale when initializing SDK
Supported locales are:

| Code | Language |
| ---- | -------- |
| EN   | English  |
| GE   | Georgian |
| RU   | Russian |
| SP   | Spanish |

```swift
sdk = KvalifikaSDK.initialize(
    Locale: KvalifikaSDKLocale.EN.rawValue
)
```

&nbsp;

### Development Mode
Without specifying mode SDK uses [https://api.kvalifika.com](https://api.kvalifika.com)

With development mode ON SDK uses [https://apistaging.kvalifika.com](https://apistaging.kvalifika.com)

```swift
KvalifikaSDK.initialize(
   AppID: "YOUR APP ID"
   Development: true
)
```

### Note
Application works on ios version 11.0 and higher
