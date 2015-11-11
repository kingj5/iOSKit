#tag Class
Protected Class ImprovediOSApplication
Inherits iOSApplication
	#tag Event
		Sub Open()
		  
		  declare function object_getClass lib "/usr/lib/libobjc.A.dylib" (cls As Ptr) As Ptr
		  declare function NSSelectorFromString lib "Foundation" (aSelectorName as CFStringRef) as Ptr
		  declare function class_replaceMethod lib "/usr/lib/libobjc.A.dylib" (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		  declare function class_addMethod lib "/usr/lib/libobjc.A.dylib" (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		  
		  declare function sharedApplication lib "UIKit" selector "sharedApplication" (clsRef as ptr) as ptr
		  declare function NSClassFromString lib "Foundation" (clsName as CFStringRef) as ptr
		  declare function getDelegate lib "UIKit" selector "delegate" (obj_id as ptr) as ptr
		  
		  dim appDel as ptr = getDelegate(sharedApplication(NSClassFromString("UIApplication")))
		  dim appDelegateClass As Ptr = object_getClass(appDel)
		  
		  //the actual dirtywork of hooking up the delegate methods
		  if not class_replaceMethod(appDelegateClass, NSSelectorFromString("applicationWillResignActive:"), _
		  AddressOf impl_appWillResign, "v@:@") then break 
		  
		  if not class_replaceMethod(appDelegateClass, NSSelectorFromString("applicationDidBecomeActive:"), _
		  AddressOf impl_didBecomeActive, "v@:@") then break
		  
		  if not class_addMethod(appDelegateClass, NSSelectorFromString("application:didRegisterForRemoteNotificationsWithDeviceToken:"), _
		  AddressOf impl_DidRegisterForRemoteNotifications, "v@:@@") then break
		  
		  if not class_addMethod(appDelegateClass, NSSelectorFromString("application:didFailToRegisterForRemoteNotificationsWithError:"), _
		  AddressOf impl_DidFailToRegisterForRemote, "v@:@@") then break
		  
		  if not class_addMethod(appDelegateClass, NSSelectorFromString("application:didReceiveRemoteNotification:fetchCompletionHandler:"), _
		  AddressOf impl_didReceiveRemoteNotification, "v@:@@@") then break
		  
		  if not class_addMethod(appDelegateClass, NSSelectorFromString("application:didReceiveLocalNotification:"), _
		  AddressOf impl_didReceiveLocalNotification, "v@:@@") then break
		  
		  if not class_addMethod(appDelegateClass, NSSelectorFromString("application:didRegisterUserNotificationSettings:"), _
		  AddressOf impl_didRegisterUserNotificationSettings, "v@:@@") then break
		  
		  
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(appDel) = self
		  
		  RaiseEvent Open 
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub cancelAllLocalNotifications()
		  declare sub cancelAllLocalNotifications lib UIKitLib selector "cancelAllLocalNotifications" (obj_id as ptr)
		  cancelAllLocalNotifications(SharedApplication)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub cancelLocalNotification(notification as UILocalNotification)
		  declare sub cancelLocalNotification lib UIKitLib selector "cancelLocalNotification:" (obj_id as ptr, note as ptr)
		  cancelLocalNotification(SharedApplication, notification)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function currentUserNotificationSettings() As UIUserNotificationSettings
		  declare function currentUserNotificationSettings lib UIKitLib selector "currentUserNotificationSettings" (obj_id as ptr) as ptr
		  Return new UIUserNotificationSettings(currentUserNotificationSettings(SharedApplication))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleBecomeActive()
		  RaiseEvent DidBecomeActive
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFailToRegisterForRemoteNotification(err as Foundation.NSError)
		  RaiseEvent DidFailToRegisterForRemoteNotifications(err)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidReceiveLocalNotification(notification as UILocalNotification)
		  RaiseEvent DidReceiveLocalNotification(notification)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleDidReceiveRemoteNotification(notification as Foundation.NSDictionary) As BackgroundFetchResult
		  return DidReceiveRemoteNotification(notification)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidRegisterForRemoteNotifications(token as Foundation.NSData)
		  RaiseEvent DidRegisterForRemoteNotifications(token)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidRegisterUserNotificationSettings(settings as UIUserNotificationSettings)
		  RaiseEvent DidRegisterUserNotificationSettings(settings)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleResignActive()
		  RaiseEvent WillResignActive
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_appWillResign(pid as ptr, sel as ptr, appRef as ptr)
		  ImprovediOSApplication(dispatch.Value(pid)).HandleResignActive
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didBecomeActive(pid as ptr, sel as ptr, appRef as ptr)
		  ImprovediOSApplication(dispatch.Value(pid)).HandleBecomeActive
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_DidFailToRegisterForRemote(pid as ptr, sel as ptr, appRef as ptr, err as ptr)
		  ImprovediOSApplication(dispatch.Value(pid)).HandleDidFailToRegisterForRemoteNotification(new Foundation.NSError(err))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didReceiveLocalNotification(pid as ptr, sel as ptr, appRef as ptr, note as ptr)
		  ImprovediOSApplication(dispatch.Value(pid)).HandleDidReceiveLocalNotification(new UILocalNotification(note))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didReceiveRemoteNotification(pid as ptr, sel as ptr, appRef as ptr, note as ptr, block as ptr)
		  dim result as BackgroundFetchResult = ImprovediOSApplication(dispatch.Value(pid)).HandleDidReceiveRemoteNotification(new NSDictionary(note))
		  
		  dim blk as new RemoteNotificationDelegate(block.Block_Layout.invoke)
		  blk.Invoke(block, result)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_DidRegisterForRemoteNotifications(pid as ptr, sel as ptr, appref as ptr, token as ptr)
		  ImprovediOSApplication(dispatch.Value(pid)).HandleDidRegisterForRemoteNotifications(new Foundation.NSData(token))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didRegisterUserNotificationSettings(pid as ptr, sel as ptr, appref as ptr, settings as ptr)
		  ImprovediOSApplication(dispatch.Value(pid)).HandleDidRegisterUserNotificationSettings(new UIUserNotificationSettings(settings))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub presentLocalNotificationNow(notification as UILocalNotification)
		  declare sub presentLocalNotificationNow lib UIKitLib selector "presentLocalNotificationNow:" (obj_id as ptr, note as ptr) 
		  presentLocalNotificationNow(SharedApplication, notification)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub registerForRemoteNotifications()
		  declare sub registerForRemoteNotifications lib UIKitLib selector "registerForRemoteNotifications" (obj_id as ptr)
		  registerForRemoteNotifications(SharedApplication)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub registerUserNotificationSettings(settings as UIUserNotificationSettings)
		  declare sub registerUserNotificationSettings lib UIKitLib selector "registerUserNotificationSettings:" (obj_id as ptr, settings as ptr)
		  registerUserNotificationSettings(SharedApplication, settings)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub RemoteNotificationDelegate(obj as ptr, resultType as BackgroundFetchResult)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub scheduleLocalNotification(notification as UILocalNotification)
		  declare sub scheduleLocalNotification lib UIKitLib selector "scheduleLocalNotification:" (obj_id as ptr, note as ptr)
		  scheduleLocalNotification(SharedApplication, notification)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIconNumber(badgeNum As Integer)
		  Declare Function sharedApplication Lib UIKitLib Selector "sharedApplication" (obj As Ptr) As Ptr
		  Dim sharedApp As Ptr = sharedApplication(NSClassFromString("UIApplication"))
		  
		  Declare Sub applicationIconBadgeNumber Lib UIKitLib Selector "setApplicationIconBadgeNumber:" (id As Ptr, value As Integer)
		  
		  applicationIconBadgeNumber(sharedApp, badgeNum)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SharedApplication() As Ptr
		  declare function sharedApplication lib UIKitLib selector "sharedApplication" (clsRef as ptr) as ptr
		  Return sharedApplication(NSClassFromString("UIApplication"))
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidBecomeActive()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidFailToRegisterForRemoteNotifications(error as Foundation.NSError)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidReceiveLocalNotification(notification as UILocalNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidReceiveRemoteNotification(notification as Foundation.NSDictionary) As BackgroundFetchResult
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidRegisterForRemoteNotifications(deviceToken as Foundation.NSData)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidRegisterUserNotificationSettings(settings as UIUserNotificationSettings)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillResignActive()
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function scheduledLocalNotifications_ lib UIKitLib selector "scheduledLocalNotifications" (obj_id as ptr) as ptr
			  Return new Foundation.NSArray(scheduledLocalNotifications_(SharedApplication))
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setScheduledLocalNotifications lib UIKitLib selector "setScheduledLocalNotifications:" (obj_id as ptr, notes as ptr)
			  setScheduledLocalNotifications(SharedApplication, value)
			End Set
		#tag EndSetter
		scheduledLocalNotifications As Foundation.NSArray
	#tag EndComputedProperty


	#tag Enum, Name = BackgroundFetchResult, Type = Integer, Flags = &h0
		NewData
		  NoData
		Failed
	#tag EndEnum


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
