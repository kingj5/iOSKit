# IOSKit
A declares implementation of many different classes for Xojo.  This currently contains a large portion of my completed classes and will continue to grow as I create more classes.  I have tried to create a demo of many of the classes, however still more do not yet have a demo.

## Warning about Xojo Version
Please use this version of iOSKit if you need to build with Xojo versions later than 2020r2 (when API2.0 was introduced for iOS).
If you are using an earlier version of Xojo which does not support API2.0, please use the `API1-compatible` branch.

Compiler errors should now be resolved, deprecation warnings will be fixed in the future  


## Currently implemented classes 
By module they are contained in:

### Foundation
* NSArray
* NSAttributedString
* NSCharacterSet
* NSData
* NSDate
* NSDictionary
* NSError
* NSIndexPath
* NSMutableArray
* NSMutableAttributedString
* NSMutableDictionary
* NSMutableSet
* NSNumber
* NSObject
* NSPoint
* NSRect
* NSSet
* NSSize
* NSString
* NSURL
* NSUserDefaults

### UIKit
* UIActivity
* UIActivityViewController
* UIColor
* UIGestureRecognizer
* UIImagePickerController
* UILongPressGestureRecognizer
* UINavigationController
* UIResponder
* UIRotationGestureRecognizer
* UISearchBar
* UISearchController
* UISwipeGestureRecognizer
* UITapGestureRecognizer
* UITouch
* UIView
* UIViewController

### Extensions
* Camera
* EditableIOSImage
* MFMailComposeViewController
* MFMessageComposeViewController
* PickerView
* PickerViewMultiline
* Reachability
* ScrollView 
* SwipeView
* UIColorPickerViewController
* UIPickerViewDataSource
* UIPickerViewDataSourceMultiline
* UIStepper

### CoreMotion
* CMAccelerometerData
* CMDeviceMotion
* CMGyroData
* CMLogItem
* CMMotionManager

### AVFoundation
* AVAudioPlayer
* AVAudioRecorder
* AVAudioSession
* AVAudioSessionDataSourceDescription
* AVAudioSessionPortDescription
* AVAudioSessionRouteDescription
* AVCaptureConnection
* AVCaptureDevice
* AVCaptureDeviceFormat
* AVCaptureDeviceInput
* AVCaptureInput
* AVCaptureInputPort
* AVCaptureMetadataOutput
* AVCaptureOutput
* AVCaptureSession
* AVCaptureStillImageOutput
* AVCaptureVideoPreviewLayer
* AVMetadataFaceObject
* AVMetadataMachineReadableCodeObject
* AVMetadataObject
* AVSpeechSynthesisVoice
* AVSpeechSynthesizer
* AVSpeechUtterance

### StoreKit
* InAppPurchaseHelper
* PaymentTransactionObserver
* SKDownload
* SKMutablePayment
* SKPayment
* SKPaymentQueue
* SKPaymentTransaction
* SKProduct
* SKProductsRequest
* SKProductsResponse
* SKReceiptRefreshRequest
* SKStoreProductViewController

### JKRegex
* RegEx
* RegExMatch
* RegExOptions

### GameKit (Beta - Not all classes have been extensively tested, please let me know if you find any classes which do not work as expected)
* GKAchievement
* GKAchievementChallenge
* GKAchievementDescription
* GKChallenge
* GKFriendRequestComposeViewController (and observer)
* GKGameCenterViewController (and observer)
* GKInvite
* GKLeaderboard
* GKLeaderboardSet
* GKLocalPlayer
* GKLocalPlayerListener
* GKMatch
* GKMatchmaker
* GKMatchmakerViewController
* GKMatchRequest
* GKNotificationBanner
* GKPlayer
* GKSavedGame
* GKScore
* GKScoreChallenge
* GKTurnBasedExchange
* GKTurnBasedExchangeReply
* GKTurnBasedMatch
* GKTurnBasedMatchmakerViewController
* GKTurnBasedParticipant
* GKVoiceChat 

...and more coming


## Additional Useful Stuff
QRCode (module) - for reading and generating QRCodes

KeychainServices (module) - for reading and writing to the iOS Keychain using the same API as is present in Xojo Desktop

TargetClassMethodHelper (in UIKit) - For creating delegate or target objects using the ObjC Runtime library in conjunction with the BuildTargetClass method of UIKit

SmartMemoryBlock and SmartMutableMemoryBlock (in Foundation) - Useful for using UIntegers with memory blocks, pragmas are used so they work as expected on 32/64 bit

Extensions Methods (in Extensions) - Many methods which could be useful depending on your needs

Notification_Center module - allows for in app notifications to be easily posted and handled

### Helpers for GameKit
AuthenticationHelper - Handles all necessary authentication and creates a notification when anything needs to happen

StandardMatchHelper (and observer) - Helps setup and run a standard match.  Although you can do all of the stuff it does manually, why would you?

TurnBasedMatchHelper - Unfinished, I haven’t been able to test this one as much because making a turn based match to test with is impossible without many devices to test with.  If someone figures this out and has a working example for it, please submit a pull request/PM me

AchievementAndScoreHelper - Unfinished 

Notes about GameKit - before anything can be done, you MUST authenticate the player using the AuthenticationHelper class (or your own version of it).  Also be sure to add GameKit to your app’s capabilities by clicking on Build Settings -> iOS -> Advanced Gear and enabling Game Center.


If there is anything in particular that you would like to see added to iOSKit, or you find any issues or incompatibilities, please PM me on the Xojo Forum and I will see what I can do!
