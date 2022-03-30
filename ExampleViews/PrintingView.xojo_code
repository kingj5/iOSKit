#tag IOSView
Begin iOSView PrintingView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Device = 1
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   Orientation = 0
   TabIcon         =   0
   TabTitle        =   ""
   Title           =   "Print"
   Top             =   0
   Begin MobileHTMLViewer HTMLViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   HTMLViewer1, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   HTMLViewer1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   HTMLViewer1, 2, <Parent>, 2, False, +1.00, 4, 1, -0, , True
      AutoLayout      =   HTMLViewer1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   503
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   65
      Visible         =   True
      Width           =   320
      Begin MobileProgressWheel ProgressWheel1
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   ProgressWheel1, 9, HTMLViewer1, 9, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   ProgressWheel1, 7, , 0, False, +1.00, 4, 1, 24, , True
         AutoLayout      =   ProgressWheel1, 3, HTMLViewer1, 3, False, +1.00, 4, 1, 196, , True
         AutoLayout      =   ProgressWheel1, 8, , 0, False, +1.00, 4, 1, 24, , True
         ControlCount    =   0
         Enabled         =   True
         Height          =   24
         Left            =   148
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "HTMLViewer1"
         Scope           =   2
         Shade           =   0
         TintColor       =   &c000000
         Top             =   261
         Visible         =   True
         Width           =   24
      End
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Close()
		  timer.CancelCallLater(WeakAddressOf HideProgress)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim tb As iOSToolButton
		  
		  Dim pic As iosimage = iOSImage.SystemImage("printer", 0)
		  if pic <> nil then
		    
		    tb = iOSToolButton.NewPlain(pic)
		  Else
		    tb = iOSToolButton.NewPlain("Print")
		  end if
		  tb.Tag = "print"
		  Self.RightNavigationToolbar.Add tb
		  
		  
		  timer.CallLater(2000, WeakAddressOf HideProgress)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  
		  Select case button.Tag
		    
		  Case "print"
		    
		    If Printing.printingAvailable = False then
		      
		      MessageBox("Printing is not available")
		      Return
		    End If
		    
		    if Printing.PrintWebView("Print job name", HTMLViewer1) then
		      
		      //Ok
		    else
		      Break
		      MessageBox("Something went wrong")
		    end if
		    
		    
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub HideProgress()
		  
		  ProgressWheel1.Visible = False
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events HTMLViewer1
	#tag Event
		Sub Opening()
		  me.LoadURL("https://forum.xojo.com")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="TabTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
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
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
