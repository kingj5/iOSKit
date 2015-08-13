#tag IOSView
Begin iosView UIAlertView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, 
      AutoLayout      =   Button1, 3, <Parent>, 3, False, +1.00, 1, 1, 144, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Press Me!"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   144
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 1, Button1, 1, False, +1.00, 1, 1, -90, 
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 262, 
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   262
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub CompHandler(sender as UIKit.UIAlertAction)
		  Label1.Text = "You selected: " + sender.title
		  
		  alertController.Dismiss
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private alertController As UIKit.UIAlertController
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  using UIKit
		  dim alert as UIAlertAction = UIAlertAction.ActionWithTitleStyleHandler("Option 1", UIAlertAction.UIAlertActionStyle.Default, AddressOf CompHandler)
		  
		  alertController = UIAlertController.AlertControllerWithTitleMessagePreferredStyle("Please select an option", "Your choice is very important", UIAlertController.UIAlertControllerStyle.ActionSheet)
		  alertController.AddAction alert
		  
		  alert = UIAlertAction.ActionWithTitleStyleHandler("Option 2", UIAlertAction.UIAlertActionStyle.Default, AddressOf CompHandler)
		  alertController.AddAction alert
		  
		  alert = UIAlertAction.ActionWithTitleStyleHandler("Destructive action", UIAlertAction.UIAlertActionStyle.Destructive, AddressOf CompHandler)
		  alertController.AddAction alert
		  
		  alert = UIAlertAction.ActionWithTitleStyleHandler("Cancel", UIAlertAction.UIAlertActionStyle.Cancel, AddressOf CompHandler)
		  alertController.AddAction alert
		  
		  alertController.PresentInView(self)
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
