#tag Class
Protected Class App
Inherits ImprovediOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Event
		Sub DidFailToRegisterForRemoteNotifications(error as Foundation.NSError)
		  MsgBox "Failed to register for remote notifications, error message:", error.localizedDescription
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidReceiveLocalNotification(notification as UILocalNotification)
		  MsgBox "Received notification: ", notification.alertBody
		End Sub
	#tag EndEvent

	#tag Event
		Function DidReceiveRemoteNotification(notification as Foundation.NSDictionary) As BackgroundFetchResult
		  MsgBox "Received remote notification"
		  Return BackgroundFetchResult.NoData
		End Function
	#tag EndEvent

	#tag Event
		Sub DidRegisterForRemoteNotifications(deviceToken as Foundation.NSData)
		  NSUserDefaults.StandardUserDefaults.SetObjectForKey(deviceToken, "PUSH_NOTIFCATION_DEVICE_TOKEN")
		  NSUserDefaults.StandardUserDefaults.SetTextForKey(deviceToken.description, "PUSH_NOTIFCATION_DEVICE_TOKEN_HUMAN_READABLE")
		  
		  call NSUserDefaults.StandardUserDefaults.Synchronize
		  MsgBox "Succeeded registering for remote notifications", deviceToken.description
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidRegisterUserNotificationSettings(settings as UIUserNotificationSettings)
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'using Extensions
		  'UIVisualEffectView.DefaultEffect = UIVibrancyEffect.EffectForBlurEffect(UIBlurEffect.EffectWithStyle(UIBlurEffect.BlurEffectStyle.Dark))
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(exc As RuntimeException) As Boolean
		  MsgBox "Exception", exc.Reason
		  Return True
		End Function
	#tag EndEvent


	#tag Constant, Name = TestBlue, Type = Color, Dynamic = False, Default = \"&c6DFFF6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TestWhite, Type = Color, Dynamic = False, Default = \"&cF6F6F6", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
