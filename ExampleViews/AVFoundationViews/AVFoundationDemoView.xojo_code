#tag IOSView
Begin iosView AVFoundationDemoView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "AVFoundation Demos"
   Top             =   0
   Begin iOSTable Table1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Table1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Table1, 2, <Parent>, 2, False, +1.00, 1, 1, -0, 
      AutoLayout      =   Table1, 3, <Parent>, 3, False, +1.00, 1, 1, 80, 
      AutoLayout      =   Table1, 8, , 0, False, +1.00, 1, 1, 320, 
      Format          =   "0"
      Height          =   320.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   80
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
#tag EndWindowCode

#tag Events Table1
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  #Pragma Unused section
		  //rows
		  // 0 = Barcode Scanner
		  // 1 = Speech Synthesis
		  // 2 = Audio Recording/Play
		  // 3 = Still image capture
		  // 4 = Flashlight
		  // 5 = (still in progress) Video capture
		  
		  dim newView as iOSView
		  
		  select case row
		  case 0
		    newView = new BarcodeScannerView
		  case 1
		    newView = new SpeechSynthesisView
		  case 2
		    newView = new RecordPlayAudioView
		  case 3
		    newView = new StillImageView
		  case 4
		    newView = new FlashlightView
		  end select
		  
		  self.PushTo(newView)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.AddSection("Select a view")
		  
		  dim d as new iOSTableCellData("Barcode Scanner")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Speech Synthesis")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Record and Play Audio")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Still Image Capture")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Flashlight")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
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
