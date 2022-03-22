#tag IOSView
Begin iosView MainView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Device = 1
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   Orientation = 0
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSTable Table1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AutoLayout      =   Table1, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Table1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Table1, 2, <Parent>, 2, False, +1.00, 1, 1, -0, , True
      AutoLayout      =   Table1, 3, TopLayoutGuide, 3, False, +1.00, 1, 1, 0, , True
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   503.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Activate()
		  if ParentSplitView.Available then
		    ParentSplitView.Detail = new EmptyView
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.Title = "Version: " + getAppVersion
		  
		  call Foundation.LoadFramework("MessageUI")
		  call Foundation.LoadFramework("CoreImage")
		  call Foundation.LoadFramework("CoreMotion")
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Table1
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  #Pragma Unused section
		  //rows
		  // 0 = UIActivity
		  // 1 = Camera
		  // 2 = Missing UIControls
		  // 3 = Create QRCode
		  // 4 = Read QRCode (real device only)
		  // 5 = Sounds
		  // 6 = Email
		  // 7 = Reachability
		  // 8 = CoreMotion
		  // 9 = Keychain Services
		  // 10 = AVFoundation Demo views
		  // 11 = Record and Play video
		  // 12 = UIActionController
		  // 13 = Unit Tests
		  // 14 = GameKit
		  
		  Dim newMasterView As iOSView
		  Dim newDetailView As iOSView
		  
		  Select Case row
		  Case 0
		    newDetailView = New ActivityView
		  Case 1
		    newDetailView = New CameraView
		  Case 2
		    newDetailView = New MissingControlsView
		  Case 3
		    newDetailView = New CreateQRView
		  Case 4
		    newDetailView = New ReadQRView
		  Case 5
		    newDetailView = New SoundsView
		  Case 6
		    newDetailView = New EmailView
		  Case 7
		    newDetailView = New ReachabilityView
		  Case 8
		    newDetailView = New CoreMotionView
		  Case 9
		    newDetailView = New KeychainView
		  Case 10
		    newDetailView = New AVFoundationDemoView
		  Case 11
		    newDetailView = New RecordPlayVideo
		  Case 12
		    newDetailView = New UIAlertView
		  Case 13
		    newDetailView = New ShakingView
		  Case 14
		    newDetailView = New GameKitDemoView
		  Case 15
		    'newDetailView = new UIDocumentPickerView //for a future version when entitlements actually work
		  Case 16
		    newDetailView = New improvediOSTableView
		  Case 17
		    newDetailView = New HapticFeedbackView
		    
		    
		  Case 18
		    newDetailView = new HTMLView
		    
		  Case 19
		    newDetailView = new MessageView
		    
		  Case 20
		    newDetailView = new ColorPickerView
		    
		  case 21
		    newDetailView = new UIMenuView
		    
		  Case 22
		    
		    newDetailView = new PrintingView
		    
		  Case 23
		    newMasterView = New XojoUnitTestGroupView
		    newDetailView = New XojoUnitTestDetailsView
		    
		    
		    
		    
		  Else
		    //shouldn't get here
		    Return
		  End Select
		  'declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewControllerToPresent as ptr, flag as Boolean, completion as ptr)
		  'PresentViewController_(self.ViewControllerHandle, newDetailView.ViewControllerHandle, True, nil)
		  
		  If newMasterView IsA iOSView Then
		    Self.PushTo newMasterView
		  End If
		  
		  If newDetailView IsA iOSView Then
		    If ParentSplitView.Available Then
		      Self.ParentSplitView.Detail = newDetailView
		    Else
		      Self.PushTo newDetailView
		    End If
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AddSection("Select a view")
		  Dim d As iOSTableCellData
		  #If XojoVersion < 2016.03
		    d = New iOSTableCellData("UIActivityView")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Camera")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Missing UIControls")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Create QRCode")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Read QRCode")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("System Sounds")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Email")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    
		    d = New iOSTableCellData("Reachability")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Core Motion")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Keychain Services")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("AVFoundation Demos")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Record and Play video")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("UIActionController")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Shaking")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("GameKit Demos (In progress)")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("UIDocumentPicker")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    d = New iOSTableCellData("Improved iOSTable")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    Me.AddRow(0,d)
		    
		    If Self.ParentSplitView.Available Then
		      d = New iOSTableCellData("Unit Tests")
		      d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		      Me.AddRow(0,d)
		    End If
		  #Else
		    d = Me.CreateCell("UIActivityView","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("square.and.arrow.up", 0)
		    Me.AddRow(0,d)
		    
		    
		    d = Me.CreateCell("Camera","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("camera", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Missing UIControls","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("square.and.pencil", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Create QRCode","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("qrcode", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Read QRCode","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("qrcode.viewfinder", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("System Sounds","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("speaker.circle", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Email","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("paperplane", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Reachability","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("network", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Core Motion","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("cursorarrow.motionlines", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Keychain Services","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("key.icloud", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("AVFoundation Demos","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("play.circle", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Record and Play video","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("film", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("UIActionController","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("exclamationmark.triangle", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Shaking","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("waveform", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("GameKit Demos (In progress)","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("gamecontroller", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("UIDocumentPicker","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("doc.text", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Improved iOSTable","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("tablecells", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Haptic Feedback","iPhone only",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("bolt", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("HTMLViewer Delegate","2018r2+",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("puzzlepiece", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Message","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("message", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Color Picker","iOS14+",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("paintpalette", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Dropdown menu","iOS13+",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("contextualmenu.and.cursorarrow", 0)
		    Me.AddRow(0,d)
		    
		    d = Me.CreateCell("Printing","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		    d.Image = iOSImage.SystemImage("printer", 0)
		    Me.AddRow(0,d)
		    
		    
		    If Self.ParentSplitView.Available Then
		      d = Me.CreateCell("Unit Tests","",Nil,iOSTableCellData.AccessoryTypes.Disclosure)
		      Me.AddRow(0,d)
		    End If
		  #endif
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
