#tag IOSView
Begin iosView MessageView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Send a Message"
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Button1, 3, <Parent>, 3, False, +1.00, 1, 1, 176, , True
      Caption         =   "Send Message"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   176
      Visible         =   True
      Width           =   100.0
   End
End
#tag EndIOSView

#tag WindowCode
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


	#tag Property, Flags = &h0
		messageComposeView As Extensions.MFMessageComposeViewController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p As iOSImage
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  messageComposeView = new Extensions.MFMessageComposeViewController
		  messageComposeView.setRecipients(Array("+15550234"))
		  
		  if Extensions.MFMessageComposeViewController.canSendSubject then
		    messageComposeView.setSubject "This is a sample subject"
		  end if
		  
		  messageComposeView.setMessage "This is a sample message"
		  
		  
		  
		  messageComposeView.FinishCallback = WeakAddressOf SendResult
		  
		  if Extensions.MFMessageComposeViewController.canSendText then
		    messageComposeView.PresentInView(self)
		    
		  Else
		    
		    #if DebugBuild
		      MessageBox("Only works on a real device")
		    #endif
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
