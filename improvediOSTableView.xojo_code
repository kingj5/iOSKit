#tag IOSView
Begin iosView improvediOSTableView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Improved iOSTable"
   Top             =   0
   Begin ImprovediOSTable ImprovediOSTable1
      AutoLayout      =   ImprovediOSTable1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   ImprovediOSTable1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   ImprovediOSTable1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   ImprovediOSTable1, 4, <Parent>, 4, False, +1.00, 2, 1, -*kStdGapCtlToViewV, 
      Format          =   "0"
      Height          =   387.0
      Left            =   20.0
      LockedInPosition=   False
      Scope           =   2
      SectionCount    =   0
      Top             =   73.0
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
#tag EndWindowCode

#tag Events ImprovediOSTable1
	#tag Event
		Sub Open()
		  me.AddSection("Test")
		  
		  dim data as iOSTableCellData
		  for i as Integer = 0 to 15
		    data = new iOSTableCellData("Test "+i.totext)
		    me.AddRow(0,data)
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub ScrollToBottom()
		  me.RemoveAll
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
