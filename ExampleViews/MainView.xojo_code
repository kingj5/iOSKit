#tag IOSView
Begin iosView MainView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSTable Table1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Table1, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, -69, 
      AutoLayout      =   Table1, 2, <Parent>, 2, False, +1.00, 1, 1, -0, 
      AutoLayout      =   Table1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Table1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      Format          =   "0"
      Height          =   338.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   73
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
		  // 12 = Unit Tests
		  
		  dim newMasterView as iOSView
		  dim newDetailView as iOSView
		  
		  select case row
		  case 0
		    newDetailView = new ActivityView
		  case 1
		    newDetailView = new CameraView
		  case 2
		    newDetailView = new MissingControlsView
		  case 3
		    newDetailView = new CreateQRView
		  case 4
		    newDetailView = new ReadQRView
		  case 5
		    newDetailView = new SoundsView
		  case 6
		    newDetailView = new EmailView
		  case 7
		    newDetailView = new ReachabilityView
		  case 8
		    newDetailView = new CoreMotionView
		  case 9
		    newDetailView = new KeychainView
		  case 10
		    newDetailView = new AVFoundationDemoView
		  case 11
		    newDetailView = new RecordPlayVideo
		  case 12
		    newMasterView = new XojoUnitTestGroupView
		    newDetailView = new XojoUnitTestDetailsView
		  else
		    //shouldn't get here
		    Return
		  end select
		  'declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewControllerToPresent as ptr, flag as Boolean, completion as ptr)
		  'PresentViewController_(self.ViewControllerHandle, newDetailView.ViewControllerHandle, True, nil)
		  
		  if newMasterView isa iOSView then
		    self.PushTo newMasterView
		  end if
		  
		  if newDetailView isa iOSView then
		    if ParentSplitView.Available then
		      self.ParentSplitView.Detail = newDetailView
		    else
		      self.PushTo newDetailView
		    end if
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.AddSection("Select a view")
		  
		  dim d as new iOSTableCellData("UIActivityView")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Camera")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Missing UIControls")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Create QRCode")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Read QRCode")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("System Sounds")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Email")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Reachability")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Core Motion")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Keychain Services")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("AVFoundation Demos")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  d = new iOSTableCellData("Record and Play video")
		  d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		  me.AddRow(0,d)
		  
		  if self.ParentSplitView.Available then
		    d = new iOSTableCellData("Unit Tests")
		    d.AccessoryType = iOSTableCellData.AccessoryTypes.Disclosure
		    me.AddRow(0,d)
		  end if
		  
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
