#IOSKit
A declares implementation of many different classes for Xojo.  This currently contains a large portion of my completed classes and will continue to grow as I create more classes.  I have tried to create a demo of many of the classes, however still more do not yet have a demo.

##Currently implemented classes 
By module they are contained in:

###Foundation
* NSArray
* NSData
* NSDate
* NSDictionary
* NSError
* NSMutableArray
* NSMutableDictionary
* NSMutableSet
* NSObject
* NSPoint
* NSRect
* NSSet
* NSSize
* NSString
* NSURL
* NSUserDefaults

###UIKit
* UIActivity
* UIActivityViewController
* UIColor
* UIGestureRecognizer
* UIImagePickerController
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

###Extensions
* Camera
* EditableIOSImage
* MFMailComposeViewController
* PickerView
* PickerViewMultiline
* Reachability
* ScrollView 
* SwipeView
* UIPickerViewDataSource
* UIPickerViewDataSourceMultiline
* UIStepper

###CoreMotion
* CMAccelerometerData
* CMDeviceMotion
* CMGyroData
* CMLogItem
* CMMotionManager

###AVFoundation
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

###StoreKit
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

###JKRegex
* RegEx
* RegExMatch
* RegExOptions

...and more coming


##Additional Useful Stuff
QRCode (module) - for reading and generating QRCodes

KeychainServices (module) - for reading and writing to the iOS Keychain using the same API as is present in Xojo Desktop

TargetClassMethodHelper (in UIKit) - For creating delegate or target objects using the ObjC Runtime library in conjunction with the BuildTargetClass method of UIKit

SmartMemoryBlock and SmartMutableMemoryBlock (in Foundation) - Useful for using UIntegers with memory blocks, pragmas are used so they work as expected on 32/64 bit

Extensions Methods (in Extensions) - Many methods which could be useful depending on your needs

Notification_Center module - allows for in app notifications to be easily posted and handled


If there is anything in particular that you would like to see added to iOSKit, or you find any issues or incompatibilities, please PM me on the Xojo Forum and I will see what I can do!