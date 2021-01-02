#tag IOSView
Begin iosView FlashlightView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Flashlight"
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 10, <Parent>, 10, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 148, , True
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      Caption         =   "Toggle Flashlight"
      Enabled         =   True
      Height          =   30.0
      Left            =   86
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   269
      Visible         =   True
      Width           =   148.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Property, Flags = &h0
		isOn As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  
		  dim device as AVFoundation.AVCaptureDevice = AVFoundation.AVCaptureDevice.DefaultDeviceWithMediaType(AVFoundation.AVStringConstant("AVMediaTypeVideo"))
		  
		  //this is important, it crashes without it
		  dim err as Foundation.NSError
		  call device.LockForConfiguration(err)
		  
		  if not isOn then
		    device.torchMode = AVFoundation.AVCaptureDevice.AVCaptureTorchMode.On
		    isOn = True
		  else
		    device.torchMode = AVFoundation.AVCaptureDevice.AVCaptureTorchMode.Off
		    isOn = False
		  end if
		  
		  //need to balance locks and unlocks
		  device.UnlockForConfiguration
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="isOn"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
