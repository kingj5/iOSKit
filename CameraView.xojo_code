#tag IOSView
Begin iosView CameraView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Camera/Photolibrary Access"
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, 
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Take Picture"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 8, , 0, False, +1.00, 1, 1, 349, 
      AutoLayout      =   Canvas1, 3, Button1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      Height          =   349.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Top             =   111
      Visible         =   True
      Width           =   280.0
   End
   Begin Extensions.Camera Camera1
      Left            =   60
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   1
      SourceType      =   "1"
      Top             =   60
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Property, Flags = &h21
		Private p As iOSImage
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  Camera1.Show(self)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As iOSGraphics)
		  if p<>nil then
		    g.DrawImage p,0,0
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Camera1
	#tag Event
		Sub PictureTaken()
		  p = me.originalImage
		  Canvas1.Invalidate
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
