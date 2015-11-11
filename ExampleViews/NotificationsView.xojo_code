#tag IOSView
Begin iosView NotificationsView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Notifications"
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button1, 3, Button4, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 146, 
      Caption         =   "Send Notification Now"
      Enabled         =   True
      Height          =   30.0
      Left            =   87
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   149
      Visible         =   True
      Width           =   146.0
   End
   Begin iOSButton Button2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button2, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button2, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button2, 3, TopLayoutGuide, 4, False, +1.00, 2, 1, *kStdControlGapV, 
      AutoLayout      =   Button2, 7, , 0, False, +1.00, 1, 1, 165, 
      Caption         =   "Register for Notifications"
      Enabled         =   True
      Height          =   30.0
      Left            =   77
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   165.0
   End
   Begin iOSButton Button3
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button3, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button3, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button3, 3, Button1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Button3, 7, , 0, False, +1.00, 1, 1, 202, 
      Caption         =   "Send Notification in 1 minute"
      Enabled         =   True
      Height          =   30.0
      Left            =   59
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   187
      Visible         =   True
      Width           =   202.0
   End
   Begin iOSButton Button4
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button4, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button4, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button4, 3, Button2, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Button4, 7, , 0, False, +1.00, 1, 1, 243, 
      Caption         =   "Register for remote Notifications"
      Enabled         =   True
      Height          =   30.0
      Left            =   38
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   111
      Visible         =   True
      Width           =   243.0
   End
End
#tag EndIOSView

#tag WindowCode
#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  dim note as new UILocalNotification
		  note.alertAction = "Do something awesome!"
		  note.alertBody ="Message body"
		  note.applicationIconBadgeNumber = 1
		  app.presentLocalNotificationNow(note)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button2
	#tag Event
		Sub Action()
		  dim settings as UIUserNotificationSettings = UIUserNotificationSettings.SettingsForTypesCategories( _ 
		  UIUserNotificationSettings.NotificationTypeAlert or UIUserNotificationSettings.NotificationTypeSound or _
		  UIUserNotificationSettings.NotificationTypeBadge,nil) //action settings should be left nil 
		  app.registerUserNotificationSettings(settings)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button3
	#tag Event
		Sub Action()
		  dim note as new UILocalNotification
		  note.alertAction = "Do something awesome!" //what is displayed when it says "Slide to ____"
		  note.alertBody ="Message body" //main body of the message
		  note.applicationIconBadgeNumber = 1 //the number to display on the app icon
		  dim d as xojo.Core.Date = Xojo.Core.Date.Now
		  dim interval as new xojo.Core.DateInterval(0,0,0,0,1)
		  note.fireDate = (d+interval)
		  app.scheduleLocalNotification(note)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button4
	#tag Event
		Sub Action()
		  dim settings as UIUserNotificationSettings = UIUserNotificationSettings.SettingsForTypesCategories(_
		  UIUserNotificationSettings.NotificationTypeAlert or UIUserNotificationSettings.NotificationTypeBadge, nil)
		  app.registerUserNotificationSettings(settings)
		  app.registerForRemoteNotifications
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
