#tag IOSView
Begin iosView CreateQRView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Create a QRCode"
   Top             =   0
   Begin iOSTextField TextField1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TextField1, 8, , 0, True, +1.00, 1, 1, 31, 
      AutoLayout      =   TextField1, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   TextField1, 7, , 0, False, +1.00, 1, 1, 220, 
      AutoLayout      =   TextField1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   "0"
      Left            =   20
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   ""
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
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
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 84, 
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Enter text to be converted to a QRCode:"
      TextAlignment   =   "0"
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
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button1, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 60, 
      AutoLayout      =   Button1, 1, TextField1, 2, False, +1.00, 1, 1, *kStdControlGapH, 
      Caption         =   "Create"
      Enabled         =   True
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
      AutoLayout      =   Canvas1, 8, , 0, False, +1.00, 1, 1, 200, 
      AutoLayout      =   Canvas1, 3, <Parent>, 3, False, +1.00, 1, 1, 168, 
      AutoLayout      =   Canvas1, 7, , 0, False, +1.00, 1, 1, 200, 
      AutoLayout      =   Canvas1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
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
		  if button.Type = iOSToolButton.Type.SystemAction then
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

#tag Events Button1
	#tag Event
		Sub Action()
		  p = QRCode.Create(TextField1.Text)
		  Canvas1.Invalidate
		  
		  static added as Boolean
		  if not added then
		    Toolbar.Add(iOSToolButton.NewSystemItem(iOSToolButton.Type.SystemAction))
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
