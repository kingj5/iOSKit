#tag IOSView
Begin iosView XojoUnitTestDetailsView
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   "2"
   Left            =   0
   NavigationBarVisible=   False
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 35, , True
      AutoLayout      =   Label1, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Overview"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   35
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSRectangle Rectangle1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle1, 8, , 0, False, +1.00, 1, 1, 218, , True
      AutoLayout      =   Rectangle1, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Rectangle1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   Rectangle1, 1, Label1, 1, False, +1.00, 1, 1, 0, , True
      BorderColor     =   &c00000000
      BorderWidth     =   2.0
      CornerHeight    =   0.0
      CornerWidth     =   0.0
      FillColor       =   &cFFFFFF00
      Height          =   218.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Top             =   73
      Visible         =   True
      Width           =   280.0
      Begin iOSLabel Label2
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label2, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   Label2, 3, Rectangle1, 3, False, +1.00, 1, 1, *kStdGapCtlToViewV, , True
         AutoLayout      =   Label2, 7, , 0, False, +1.00, 1, 1, 100, , True
         AutoLayout      =   Label2, 1, Rectangle1, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Start:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   93
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel StartLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   StartLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   StartLabel, 1, Label2, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
         AutoLayout      =   StartLabel, 10, Label2, 10, False, +1.00, 2, 1, 0, , True
         AutoLayout      =   StartLabel, 7, , 0, False, +1.00, 2, 1, 200, 300, True
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "2015-01-01 12:00PM"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   93
         Visible         =   True
         Width           =   200.0
      End
      Begin iOSLabel Label4
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label4, 3, StartLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
         AutoLayout      =   Label4, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   Label4, 1, Label2, 1, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   Label4, 7, , 0, False, +1.00, 1, 1, 100, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Total:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   131
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel TestCountLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestCountLabel, 10, Label4, 10, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   TestCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   TestCountLabel, 7, , 0, False, +1.00, 1, 1, 828, , True
         AutoLayout      =   TestCountLabel, 1, Label4, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "100 tests in 10 groups"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   131
         Visible         =   True
         Width           =   828.0
      End
      Begin iOSLabel Label6
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label6, 1, Label4, 1, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   Label6, 7, , 0, False, +1.00, 1, 1, 100, , True
         AutoLayout      =   Label6, 3, TestCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
         AutoLayout      =   Label6, 8, , 0, False, +1.00, 1, 1, 30, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Passed:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   169
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel PassedCountLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   PassedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   PassedCountLabel, 10, Label6, 10, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   PassedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
         AutoLayout      =   PassedCountLabel, 1, Label6, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "0 (0%)"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   169
         Visible         =   True
         Width           =   187.0
      End
      Begin iOSLabel Label8
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label8, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   Label8, 3, PassedCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
         AutoLayout      =   Label8, 7, , 0, False, +1.00, 1, 1, 100, , True
         AutoLayout      =   Label8, 1, Label6, 1, False, +1.00, 1, 1, 0, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Failed:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   207
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel FailedCountLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   FailedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   FailedCountLabel, 10, Label8, 10, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   FailedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
         AutoLayout      =   FailedCountLabel, 1, Label8, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "0 (0%)"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   207
         Visible         =   True
         Width           =   187.0
      End
      Begin iOSLabel Label10
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label10, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   Label10, 3, FailedCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
         AutoLayout      =   Label10, 7, , 0, False, +1.00, 1, 1, 100, , True
         AutoLayout      =   Label10, 1, Label8, 1, False, +1.00, 1, 1, 0, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Skipped:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   245
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel SkippedCountLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   SkippedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   SkippedCountLabel, 10, Label10, 10, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   SkippedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
         AutoLayout      =   SkippedCountLabel, 1, Label10, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "0 (0%)"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   245
         Visible         =   True
         Width           =   187.0
      End
      Begin iOSLabel Label14
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label14, 7, , 0, False, +1.00, 1, 1, 100, , True
         AutoLayout      =   Label14, 10, Label2, 10, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   Label14, 1, Rectangle1, 1, False, +1.00, 1, 1, 347, , True
         AutoLayout      =   Label14, 8, , 0, False, +1.00, 1, 1, 30, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   367
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Duration:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   93
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel DurationLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   DurationLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
         AutoLayout      =   DurationLabel, 10, Label2, 10, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   DurationLabel, 1, Label14, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
         AutoLayout      =   DurationLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   475
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "0s"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   93
         Visible         =   True
         Width           =   187.0
      End
   End
   Begin iOSLabel Label11
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label11, 2, Label1, 2, False, +1.00, 1, 1, 194, , True
      AutoLayout      =   Label11, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label11, 1, Rectangle1, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label11, 10, <Parent>, 10, False, +1.00, 1, 1, -29, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Selected Test Results"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   196
      Visible         =   True
      Width           =   294.0
   End
   Begin iOSRectangle Rectangle2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle2, 2, Rectangle1, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Rectangle2, 3, Label11, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Rectangle2, 1, <Parent>, 1, False, +1.00, 1, 1, 20, , True
      AutoLayout      =   Rectangle2, 8, , 0, False, +1.00, 1, 1, 370, , True
      BorderColor     =   &c00000000
      BorderWidth     =   2.0
      CornerHeight    =   0.0
      CornerWidth     =   0.0
      FillColor       =   &cFFFFFF00
      Height          =   370.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Top             =   234
      Visible         =   True
      Width           =   280.0
      Begin iOSLabel TestNameLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestNameLabel, 7, , 0, False, +1.00, 1, 1, 190, , True
         AutoLayout      =   TestNameLabel, 3, Rectangle2, 3, False, +1.00, 1, 1, *kStdGapCtlToViewV, , True
         AutoLayout      =   TestNameLabel, 1, Rectangle2, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
         AutoLayout      =   TestNameLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "Test Name"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   254
         Visible         =   True
         Width           =   190.0
      End
      Begin iOSLabel TestResultLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestResultLabel, 7, , 0, False, +1.00, 1, 1, 100, , True
         AutoLayout      =   TestResultLabel, 10, TestNameLabel, 10, False, +1.00, 1, 1, , , True
         AutoLayout      =   TestResultLabel, 2, Rectangle2, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
         AutoLayout      =   TestResultLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   180
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "Passed"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   254
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel Label13
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label13, 7, , 0, False, +1.00, 1, 1, 75, , True
         AutoLayout      =   Label13, 3, TestResultLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
         AutoLayout      =   Label13, 1, TestNameLabel, 1, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   Label13, 8, , 0, False, +1.00, 1, 1, 30, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "Duration:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   292
         Visible         =   True
         Width           =   75.0
      End
      Begin iOSLabel TestDurationLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestDurationLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   TestDurationLabel, 1, Label13, 2, False, +1.00, 2, 1, *kStdControlGapH, , True
         AutoLayout      =   TestDurationLabel, 10, Label13, 10, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   TestDurationLabel, 2, Rectangle2, 2, False, +1.00, 1, 1, -*kStdControlGapH, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   123
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "0s"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   292
         Visible         =   True
         Width           =   169.0
      End
      Begin iOSLabel Label12
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label12, 7, , 0, False, +1.00, 1, 1, 100, , True
         AutoLayout      =   Label12, 3, TestDurationLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
         AutoLayout      =   Label12, 1, Label13, 1, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   Label12, 8, , 0, False, +1.00, 1, 1, 30, , True
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "Messages"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   330
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSTextArea TestResultsArea
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestResultsArea, 2, TestResultLabel, 2, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   TestResultsArea, 3, Label12, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
         AutoLayout      =   TestResultsArea, 1, Label12, 1, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   TestResultsArea, 8, , 0, False, +1.00, 1, 1, 200, , True
         Editable        =   True
         Height          =   200.0
         KeyboardType    =   "0"
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   ""
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   368
         Visible         =   True
         Width           =   240.0
      End
   End
End
#tag EndIOSView

#tag WindowCode
#tag EndWindowCode

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
		Name="TabIcon"
		Group="Behavior"
		Type="iOSImage"
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
