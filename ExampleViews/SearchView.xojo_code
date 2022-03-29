#tag IOSView
Begin iOSView SearchView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Device = 1
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   Orientation = 0
   TabIcon         =   0
   TabTitle        =   ""
   Title           =   "Search View"
   Top             =   0
   Begin MobileLabel lblStatus
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   lblStatus, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   lblStatus, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   lblStatus, 8, , 0, False, +1.00, 4, 1, 186, , True
      AutoLayout      =   lblStatus, 10, <Parent>, 10, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   186
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   True
      Scope           =   2
      Text            =   "Untitled"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   191
      Visible         =   True
      Width           =   280
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Close()
		  //Handler for search text changed
		  if searchBar <> nil then
		    RemoveHandler searchbar.TextChanged, AddressOf handle_SearchTextChanged
		    RemoveHandler searchbar.CancelButtonPressed, AddressOf handle_SearchCancelled
		  end if
		  
		  searchBar = nil
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  lblStatus.Text = "Type something in the searchbar"
		  
		  SetupSearchBar
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub handle_SearchCancelled(caller As UISearchBar)
		  
		  
		  lblStatus.Text = "Search cancelled"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub handle_SearchTextChanged(caller As UISearchBar, value As Text)
		  
		  
		  lblStatus.Text = "search: " + value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupSearchBar()
		  //Source: https://stackoverflow.com/questions/45997996/ios-11-uisearchbar-in-uinavigationbar
		  
		  
		  Dim sc As new UISearchController(nil)
		  
		  //A few options are available here
		  sc.dimsBackgroundDuringPresentation = False
		  sc.hidesNavigationBarDuringPresentation = False
		  
		  
		  Dim scb As UIKit.UISearchBar = sc.searchBar
		  
		  //A few options are available here
		  scb.placeholder = "Type something here..."
		  'scb.showsCancelButton = True
		  
		  'scb.tintColor = UIColor.White
		  'scb.barTintColor = UIColor.Red
		  
		  //Keep a reference to the searchbar
		  self.searchBar = scb
		  
		  //Setup the searchfield delegate
		  scb.SetupDelegate
		  
		  //Handler for search text changed
		  AddHandler scb.TextChanged, AddressOf handle_SearchTextChanged
		  AddHandler scb.CancelButtonPressed, AddressOf handle_SearchCancelled
		  
		  declare function valueForKey_ lib FoundationLib selector "valueForKey:" (obj_id as ptr, key as CFStringRef) as ptr
		  
		  Dim textfield As Ptr = valueForKey_(scb.handle, "searchField")
		  if textfield <> nil then
		    
		    declare sub setTextColor lib "UIKit.framework" selector "setTextColor:" (obj_id as ptr, col as ptr)
		    setTextColor(textfield,  UIColor.White)
		    
		    
		  end if
		  
		  //Now attaching the searchbar to the navigation bar
		  Declare Function navigationItem Lib "UIKit.framework" selector "navigationItem" (obj_ref As ptr) As ptr
		  Dim navItem As ptr = navigationItem(self.ViewControllerHandle)
		  Declare sub setSearchController lib UIKitLib Selector "setSearchController:" (obj as ptr, ctrl as ptr)
		  setSearchController(navItem, sc)
		  
		  //If necessary, set this
		  Declare sub hidesSearchBarWhenScrolling lib "UIKit" selector "hidesSearchBarWhenScrolling" (obj as ptr, value As Boolean)
		  hidesSearchBarWhenScrolling(navItem, False)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		searchBar As UISearchBar
	#tag EndProperty


#tag EndWindowCode

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
