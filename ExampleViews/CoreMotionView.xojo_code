#tag IOSView
Begin iosView CoreMotionView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "CoreMotion"
   Top             =   0
   Begin CoreMotion.CMMotionManager CMMotionManager1
      accelerometerUpdateInterval=   0.0
      deviceMotionUpdateInterval=   0.0
      gyroUpdateInterval=   0.0
      Left            =   80
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   0
      Top             =   80
   End
   Begin xojo.Core.Timer Timer1
      Left            =   100
      LockedInPosition=   False
      Mode            =   "2"
      PanelIndex      =   -1
      Parent          =   ""
      Period          =   10
      Scope           =   0
      Tolerance       =   0
      Top             =   100
   End
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 2, <Parent>, 2, False, +1.00, 1, 1, -38, 
      AutoLayout      =   Button1, 10, Button2, 10, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Stop updating"
      Enabled         =   True
      Height          =   30.0
      Left            =   182
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   88
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton Button2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button2, 7, , 0, False, +1.00, 1, 1, 100, 
      AutoLayout      =   Button2, 3, <Parent>, 3, False, +1.00, 1, 1, 88, 
      AutoLayout      =   Button2, 1, <Parent>, 1, False, +1.00, 1, 1, 40, 
      AutoLayout      =   Button2, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Start Updating"
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   88
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 2, Button2, 2, False, +1.00, 1, 1, 61, 
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 137, 
      AutoLayout      =   Label1, 1, Button2, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      Text            =   "User Acceleration:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   137
      Visible         =   True
      Width           =   161.0
   End
   Begin iOSLabel XLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   XLabel, 2, Button2, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   XLabel, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   XLabel, 1, Label1, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   XLabel, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   175
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel YLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   YLabel, 2, XLabel, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   YLabel, 3, XLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   YLabel, 1, XLabel, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   YLabel, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   213
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel ZLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ZLabel, 2, YLabel, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   ZLabel, 3, YLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   ZLabel, 1, YLabel, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   ZLabel, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   251
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel Label2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label2, 1, <Parent>, 1, False, +1.00, 1, 1, 40, 
      AutoLayout      =   Label2, 3, ZLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Label2, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label2, 7, , 0, False, +1.00, 1, 1, 161, 
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Gyro Data:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   289
      Visible         =   True
      Width           =   161.0
   End
   Begin iOSLabel XGyroLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   XGyroLabel, 1, ZLabel, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   XGyroLabel, 3, Label2, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   XGyroLabel, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   XGyroLabel, 7, , 0, False, +1.00, 1, 1, 100, 
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   327
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel YGyroLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   YGyroLabel, 1, ZLabel, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   YGyroLabel, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   YGyroLabel, 3, XGyroLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   YGyroLabel, 7, , 0, False, +1.00, 1, 1, 100, 
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   365
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel ZGyroLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ZGyroLabel, 1, ZLabel, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   ZGyroLabel, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   ZGyroLabel, 3, YGyroLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   ZGyroLabel, 7, , 0, False, +1.00, 1, 1, 100, 
      Enabled         =   True
      Height          =   30.0
      Left            =   40
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   403
      Visible         =   True
      Width           =   100.0
   End
End
#tag EndIOSView

#tag WindowCode
#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  dim accel as CoreMotion.CMAcceleration
		  accel = CMMotionManager1.deviceMotion.userAcceleration
		  XLabel.Text = accel.x.ToText
		  YLabel.Text = accel.y.ToText
		  ZLabel.Text = accel.z.ToText
		  
		  dim gyro as CoreMotion.CMRotationRate
		  gyro = CMMotionManager1.gyroData.rotationRate
		  XGyroLabel.Text = gyro.x.ToText
		  YGyroLabel.Text = gyro.y.ToText
		  ZGyroLabel.Text = gyro.z.ToText
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Action()
		  Timer1.Mode = Timer.Modes.Off
		  
		  CMMotionManager1.stopDeviceMotionUpdates
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button2
	#tag Event
		Sub Action()
		  Timer1.Mode = Timer.Modes.Multiple
		  CMMotionManager1.deviceMotionUpdateInterval = 0.1
		  CMMotionManager1.gyroUpdateInterval = 0.1
		  if CMMotionManager1.deviceMotionAvailable then
		    CMMotionManager1.startDeviceMotionUpdates
		  else
		    MsgBox "Oh no!","Device motion updates are unavailable!"
		  end if
		  
		  if CMMotionManager1.gyroAvailable then
		    CMMotionManager1.startGyroUpdates
		  else
		    MsgBox "Oh no!","Gyro updates are unavailable!"
		  end if
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
