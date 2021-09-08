#tag IOSView
Begin iosView ColorPickerView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Native Color Picker (iOS14)"
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Button1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 176, , True
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, , True
      Caption         =   "Pick a color"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   241
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 4, 2, 70, , True
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   Label1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      Enabled         =   True
      Height          =   70.0
      Left            =   20.0
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Note: UIColorPickerView only works in iOS14.\nUse .IsAvailable method to check if the PickerView can be displayed."
      TextAlignment   =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   73.0
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSImageView ImageViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageViewer1, 8, , 0, False, +1.00, 4, 1, 40, , True
      AutoLayout      =   ImageViewer1, 1, , 0, False, +1.00, 4, 1, 85, , True
      AutoLayout      =   ImageViewer1, 3, Button1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   ImageViewer1, 7, , 0, False, +1.00, 4, 1, 40, , True
      ContentMode     =   4
      Height          =   40.0
      Image           =   0
      Image           =   0
      Left            =   85.0
      LockedInPosition=   False
      Scope           =   2
      Top             =   279.0
      Visible         =   False
      Width           =   40.0
   End
   Begin iOSLabel LabelColor
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   LabelColor, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   LabelColor, 1, ImageViewer1, 2, False, +1.00, 4, 1, *kStdControlGapH, , True
      AutoLayout      =   LabelColor, 10, ImageViewer1, 10, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   LabelColor, 7, , 0, False, +1.00, 4, 1, 100, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   133.0
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   2
      Text            =   "#000000"
      TextAlignment   =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   284.0
      Visible         =   False
      Width           =   100.0
   End
   Begin iOSSwitch Switch1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Switch1, 4, Button1, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
      AutoLayout      =   Switch1, 8, , 0, True, +1.00, 4, 1, 31, , True
      AutoLayout      =   Switch1, 2, LabelColor, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Switch1, 7, , 0, True, +1.00, 4, 1, 51, , True
      Enabled         =   True
      Height          =   31.0
      Left            =   182.0
      LockedInPosition=   False
      Scope           =   2
      Top             =   202.0
      Value           =   True
      Visible         =   True
      Width           =   51.0
   End
   Begin iOSLabel LabelAlpha
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   LabelAlpha, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   LabelAlpha, 2, Switch1, 1, False, +1.00, 4, 1, -*kStdControlGapH, , True
      AutoLayout      =   LabelAlpha, 3, Switch1, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   LabelAlpha, 7, , 0, False, +1.00, 4, 1, 120, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   54
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   2
      Text            =   "Supports Alpha"
      TextAlignment   =   2
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   202
      Visible         =   True
      Width           =   120.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub ColorSelected(picker As Extensions.UIColorPickerViewController, value As Color)
		  
		  Dim p As new iOSBitmap(40, 40, 2)
		  Dim g As iOSGraphics = p.Graphics
		  
		  g.Scale(p.Scale, p.Scale)
		  g.FillColor = value
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  ImageViewer1.Image = p.Image
		  
		  ImageViewer1.Visible = True
		  
		  self.currentColor = value
		  
		  Dim strColor As Text
		  
		  if value = &c0 then
		    strColor = "#000000"
		    
		  else
		    
		    Dim red, green, blue, alpha As Integer
		    red = value.Red
		    green = value.Green
		    blue = value.Blue
		    alpha = value.Alpha
		    
		    strColor = "#" + red.ToHex(2) + green.ToHex(2) + blue.ToHex(2) + if(alpha > 0, alpha.ToHex(2), "")
		    
		  end if
		  
		  LabelColor.Text = strColor
		  LabelColor.Visible = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SendResult(result As Extensions.MFMessageComposeViewController.MessageComposeResult)
		  
		  
		  Select case result
		  case Extensions.MFMessageComposeViewController.MessageComposeResult.sent
		    
		    MessageBox("Sent")
		    
		  Case Extensions.MFMessageComposeViewController.MessageComposeResult.cancelled
		    
		    MessageBox("Cancelled")
		    
		    
		    
		  Case Extensions.MFMessageComposeViewController.MessageComposeResult.failed
		    MessageBox("Failed")
		    
		  End Select
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private colorPicker14 As Extensions.UIColorPickerViewController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private currentColor As Color
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  if Extensions.UIColorPickerViewController.IsAvailable then
		    if colorPicker14 is nil then
		      colorPicker14 = new Extensions.UIColorPickerViewController
		      AddHandler colorPicker14.DidSelectColor, AddressOf ColorSelected
		    end if
		    
		    colorpicker14.supportsAlpha = Switch1.Value
		    colorPicker14.selectedColor = new uicolor(currentColor)
		    colorPicker14.PresentInView(self, nil)
		    
		    
		    
		    
		  Else
		    
		    MessageBox("UIColorPickerView requires iOS version 14 or newer releases.")
		    
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
