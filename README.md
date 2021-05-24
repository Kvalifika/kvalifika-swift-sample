# Kvalifika SDK Swift Sample

Use Kvalifika SDK to easily integrate into your Android app

Table of content:

- [Installation](#installation)
- [UI Customizations](#ui-customizations)
  - [Appearance](#appearance)
  - [Language](#language)
- [Initialize the SDK](#initialize-the-sdk)
- [Start Verification](#start-verification)
- [Handling Verifications](#handling-verifications)
  - [Callback Methods](#callback-methods)
  - [Error Codes](#error-codes)

&nbsp;

## Installation

Add following to project's main `Podfile` file

```groovy
pod 'Kvalifika', '~> 0.0.1'
```

&nbsp;

## UI Customizations

### Appearance

You can customize logo and icons.
Provide resources.

```Swift
Kvalifika.initializeSDK(
        AppLogoImageName: "AppLogo",
        DocLogoImageName: "DocLogo",
        CancelImageName: "cancel"
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

```swift
sdk = Kvalifika.initializeSDK(LanguageLocale:  Kvalifika.LanguageLocaleTypeEnum.GE.rawValue)
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

        // Initialize SDK
        Kvalifika.initializeSDK(
            AppID: "26d3f2ee-4f37-4376-8357-c4114b9d2c63",
            AppLogoImageName: "AppLogo",
            DocLogoImageName: "DocLogo",
            CancelImageName: "cancel",
            LanguageLocale:  Kvalifika.LanguageLocaleTypeEnum.GE.rawValue,
            onInitialize: onInitialize,
            onStart: onStart,
            onFinish: onFinish,
            onError: onError)

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

    func onError(error: Kvalifika.KvalifikaSDKErrorEnum) {
        print(error)
    }
}
```

&nbsp;

## Start Verification

Call `Kvalifika.startPhotoIDScan()` on button click event

```Swift
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize SDK
        Kvalifika.initializeSDK(
            AppID: "26d3f2ee-4f37-4376-8357-c4114b9d2c63",
            AppLogoImageName: "AppLogo",
            DocLogoImageName: "DocLogo",
            CancelImageName: "cancel",
            LanguageLocale:  Kvalifika.LanguageLocaleTypeEnum.GE.rawValue,
            onInitialize: onInitialize,
            onStart: onStart,
            onFinish: onFinish,
            onError: onError)

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

    func onError(error: Kvalifika.KvalifikaSDKErrorEnum) {
        print(error)
    }

    @IBAction func onStart(_ sender: Any) {
        let _ = Kvalifika.startPhotoIDScan(onViewController: self)
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

    func onError(error: Kvalifika.KvalifikaSDKErrorEnum) {
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
| SESSION_UNSUCCESSFUL          | The Session was not performed successfully                                               |
| ID_UNSUCCESSFUL               | The ID Scan was not performed successfully and identity document data was not generated. |
| CAMERA_PERMISSION_DENIED      | Camera is required but access prevented by user settings.                                |
| LANDSCAPE_MODE_NOT_ALLOWED    | Verification cancelled because device is in landscape mode.                              |
| REVERSE_PORTRAIT_NOT_ALLOWED  | Verification cancelled because device is in reverse portrait mode.                       |
| FACE_IMAGES_UPLOAD_FAILED     | Could not upload face images. Internal request failed.                                   |
| DOCUMENT_IMAGES_UPLOAD_FAILED | Could not upload ID card or passport images. Internal request failed.                    |
| COMPARE_IMAGES_FAILED         | Could not compare images. Internal request failed.                                       |
| UNKNOWN_INTERNAL_ERROR        | Session failed because of an unhandled internal error.                                   |

&nbsp;
