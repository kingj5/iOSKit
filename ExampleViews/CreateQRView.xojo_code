#tag IOSView
Begin iosView CreateQRView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Create a QRCode"
   Top             =   0
   Begin iOSTextField TextField1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TextField1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   TextField1, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   TextField1, 8, , 0, True, +1.00, 1, 1, 31, , True
      AutoLayout      =   TextField1, 7, , 0, False, +1.00, 1, 1, 220, , True
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   0
      Left            =   20
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   ""
      Scope           =   0
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   122
      Visible         =   True
      Width           =   220.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, 20, , True
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 84, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Enter text to be converted to a QRCode:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   84
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 1, TextField1, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
      AutoLayout      =   Button1, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 60, , True
      Caption         =   "Create"
      Enabled         =   False
      Height          =   30.0
      Left            =   248
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   122
      Visible         =   True
      Width           =   60.0
   End
   Begin iOSCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 3, <Parent>, 3, False, +1.00, 1, 1, 168, , True
      AutoLayout      =   Canvas1, 8, , 0, False, +1.00, 1, 1, 200, , True
      AutoLayout      =   Canvas1, 7, , 0, False, +1.00, 1, 1, 200, , True
      Height          =   200.0
      Left            =   60
      LockedInPosition=   False
      Scope           =   0
      Top             =   168
      Visible         =   True
      Width           =   200.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  #if XojoVersion < 2015.03
		    if button.Type = iOSToolButton.Type.SystemAction then
		  #Else
		    if button.Type = iOSToolButton.Types.SystemAction then
		  #Endif
		  using Extensions
		  using Foundation
		  dim controller as UIActivityViewController
		  controller = new UIActivityViewController(NSArray.CreateWithObject(new NSObject(p.Handle)),nil)
		  
		  self.PresentViewController(controller, True, nil)
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private p As iOSImage
	#tag EndProperty


#tag EndWindowCode

#tag Events TextField1
	#tag Event
		Sub TextChange()
		  Button1.Enabled = (me.Text<>"")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Action()
		  p = QRCode.Create(TextField1.Text)
		  Canvas1.Invalidate
		  
		  static added as Boolean
		  if not added then
		    #if XojoVersion < 2015.03
		      Toolbar.Add(iOSToolButton.NewSystemItem(iOSToolButton.Type.SystemAction))
		    #Else
		      Toolbar.Add(iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemAction))
		    #Endif
		    added = True
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As iOSGraphics)
		  if p <> nil then
		    g.DrawImage p,0,0
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
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
