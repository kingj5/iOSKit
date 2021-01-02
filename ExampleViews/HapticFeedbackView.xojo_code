#tag IOSView
Begin iosView HapticFeedbackView
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Haptic Feedback"
   Top             =   0
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 7, , 0, False, +1.00, 4, 1, 100, , True
      AutoLayout      =   Label1, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Label1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 4, 1, 30, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Impact"
      TextAlignment   =   1
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton btImpactLight
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   btImpactLight, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   btImpactLight, 2, btImpactMedium, 1, False, +1.00, 4, 1, -20, , True
      AutoLayout      =   btImpactLight, 3, Label1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   btImpactLight, 7, , 0, False, +1.00, 4, 1, 80, , True
      Caption         =   "Light"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   111
      Visible         =   True
      Width           =   80.0
   End
   Begin iOSButton btImpactMedium
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   btImpactMedium, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   btImpactMedium, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   btImpactMedium, 3, Label1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   btImpactMedium, 7, , 0, False, +1.00, 4, 1, 80, , True
      Caption         =   "Medium"
      Enabled         =   True
      Height          =   30.0
      Left            =   120
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   111
      Visible         =   True
      Width           =   80.0
   End
   Begin iOSButton btImpactHeavy
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   btImpactHeavy, 10, btImpactLight, 10, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   btImpactHeavy, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   btImpactHeavy, 1, btImpactMedium, 2, False, +1.00, 4, 1, 20, , True
      AutoLayout      =   btImpactHeavy, 7, , 0, False, +1.00, 4, 1, 80, , True
      Caption         =   "Heavy"
      Enabled         =   True
      Height          =   30.0
      Left            =   220
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   111
      Visible         =   True
      Width           =   80.0
   End
   Begin iOSLabel Label2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label2, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   Label2, 1, Label1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Label2, 3, btImpactMedium, 4, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   Label2, 7, , 0, False, +1.00, 4, 1, 100, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Selection"
      TextAlignment   =   1
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   171
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton btSelectionChanged
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   btSelectionChanged, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   btSelectionChanged, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   btSelectionChanged, 3, Label2, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   btSelectionChanged, 7, , 0, False, +1.00, 4, 2, 120, , True
      Caption         =   "Selection Changed"
      Enabled         =   True
      Height          =   30.0
      Left            =   100
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   209
      Visible         =   True
      Width           =   120.0
   End
   Begin iOSLabel Label3
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label3, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   Label3, 1, Label2, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Label3, 3, btSelectionChanged, 4, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   Label3, 7, , 0, False, +1.00, 4, 1, 100, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Selection"
      TextAlignment   =   1
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   269
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton btNotifError
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   btNotifError, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   btNotifError, 1, btNotifWarning, 2, False, +1.00, 4, 1, 20, , True
      AutoLayout      =   btNotifError, 3, Label3, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   btNotifError, 7, , 0, False, +1.00, 4, 1, 80, , True
      Caption         =   "Error"
      Enabled         =   True
      Height          =   30.0
      Left            =   220
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   307
      Visible         =   True
      Width           =   80.0
   End
   Begin iOSButton btNotifSuccess
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   btNotifSuccess, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   btNotifSuccess, 2, btNotifWarning, 1, False, +1.00, 4, 1, -20, , True
      AutoLayout      =   btNotifSuccess, 3, Label3, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   btNotifSuccess, 7, , 0, False, +1.00, 4, 1, 80, , True
      Caption         =   "Success"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   307
      Visible         =   True
      Width           =   80.0
   End
   Begin iOSButton btNotifWarning
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   btNotifWarning, 1, btImpactMedium, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   btNotifWarning, 7, , 0, False, +1.00, 4, 1, 80, , True
      AutoLayout      =   btNotifWarning, 3, Label3, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   btNotifWarning, 8, , 0, False, +1.00, 4, 1, 30, , True
      Caption         =   "Warning"
      Enabled         =   True
      Height          =   30.0
      Left            =   120
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   307
      Visible         =   True
      Width           =   80.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Property, Flags = &h21
		Private HapImpactHeavy As UIImpactFeedbackGenerator
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HapImpactLight As UIImpactFeedbackGenerator
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HapImpactMedium As UIImpactFeedbackGenerator
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HapNotification As UINotificationFeedbackGenerator
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HapSelection As UISelectionFeedbackGenerator
	#tag EndProperty


#tag EndWindowCode

#tag Events btImpactLight
	#tag Event
		Sub Action()
		  
		  If HapImpactLight Is Nil Then
		    
		    HapImpactLight = New UIImpactFeedbackGenerator(UIImpactFeedbackGenerator.UIImpactFeedbackStyle.light)
		    
		  End If
		  
		  HapImpactLight.Prepare
		  
		  HapImpactLight.ImpactOccurred
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btImpactMedium
	#tag Event
		Sub Action()
		  
		  If HapImpactMedium Is Nil Then
		    
		    HapImpactMedium = New UIImpactFeedbackGenerator(UIImpactFeedbackGenerator.UIImpactFeedbackStyle.medium)
		    
		  End If
		  
		  HapImpactMedium.Prepare
		  
		  HapImpactMedium.ImpactOccurred
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btImpactHeavy
	#tag Event
		Sub Action()
		  
		  
		  If HapImpactHeavy Is Nil Then
		    
		    HapImpactHeavy = New UIImpactFeedbackGenerator(UIImpactFeedbackGenerator.UIImpactFeedbackStyle.heavy)
		    
		  End If
		  
		  HapImpactHeavy.Prepare
		  
		  HapImpactHeavy.ImpactOccurred
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btSelectionChanged
	#tag Event
		Sub Action()
		  
		  If HapSelection Is Nil Then
		    
		    HapSelection = New UISelectionFeedbackGenerator
		    
		  End If
		  
		  HapSelection.Prepare
		  
		  HapSelection.SelectionChanged
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btNotifError
	#tag Event
		Sub Action()
		  
		  If HapNotification Is Nil Then
		    
		    HapNotification = New UINotificationFeedbackGenerator
		    
		  End If
		  
		  HapNotification.Prepare
		  
		  HapNotification.NotificationOccurred(UINotificationFeedbackGenerator.UINotificationFeedbackType.error)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btNotifSuccess
	#tag Event
		Sub Action()
		  
		  If HapNotification Is Nil Then
		    
		    HapNotification = New UINotificationFeedbackGenerator
		    
		  End If
		  
		  HapNotification.Prepare
		  
		  HapNotification.NotificationOccurred(UINotificationFeedbackGenerator.UINotificationFeedbackType.success)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btNotifWarning
	#tag Event
		Sub Action()
		  
		  If HapNotification Is Nil Then
		    
		    HapNotification = New UINotificationFeedbackGenerator
		    
		  End If
		  
		  HapNotification.Prepare
		  
		  HapNotification.NotificationOccurred(UINotificationFeedbackGenerator.UINotificationFeedbackType.warning)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
#tag EndViewBehavior
