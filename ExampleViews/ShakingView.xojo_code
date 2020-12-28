#tag IOSView
Begin iosView ShakingView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Shake the phone to start!"
   Top             =   0
   Begin Extensions.SwipeView SwipeView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   SwipeView1, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   SwipeView1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   SwipeView1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   SwipeView1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      Height          =   503.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   1
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
   Begin xojo.Core.Timer Timer1
      Left            =   0
      LockedInPosition=   False
      Mode            =   2
      PanelIndex      =   -1
      Parent          =   ""
      Period          =   10
      Scope           =   0
      Tolerance       =   0
      Top             =   0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  declare sub becomeFirstResponder lib UIKitLib selector "becomeFirstResponder" (obj_id as ptr)
		  becomeFirstResponder(SwipeView1.Handle)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub EndShake()
		  shaking = False
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private shaking As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events SwipeView1
	#tag Event
		Sub ShakeBegan()
		  shaking = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub ShakeEnded()
		  Timer.CallLater(100, AddressOf endShake)
		End Sub
	#tag EndEvent
	#tag Event
		Function UsesGestures() As Boolean
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g as iOSGraphics)
		  if not shaking then
		    g.FillColor = Color.Green
		  else
		    g.FillColor = color.Red
		  end if
		  g.FillRect 0,0,g.Width,g.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  SwipeView1.Invalidate
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
