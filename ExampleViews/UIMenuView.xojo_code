#tag IOSView
Begin iOSView UIMenuView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Device = 1
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   Orientation = 0
   TabIcon         =   0
   TabTitle        =   ""
   Title           =   "Home"
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   Button1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 4, 1, 100, , True
      AutoLayout      =   Button1, 1, <Parent>, 1, False, +1.00, 4, 1, 20, , True
      Caption         =   "Show Menu"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      TextColor       =   0
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton Button2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button2, 11, Button1, 11, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Button2, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   Button2, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   Button2, 7, , 0, False, +1.00, 4, 1, 100, , True
      Caption         =   "Another Menu"
      Enabled         =   True
      Height          =   30.0
      Left            =   200
      LockedInPosition=   False
      Scope           =   2
      TextColor       =   0
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 1, Button1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Label1, 2, Button2, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 4, 1, 178, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 4, 1, 75, , True
      Enabled         =   True
      Height          =   75.0
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   2
      Text            =   "Click on a button"
      TextAlignment   =   0
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   178
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Function createMenu() As Ptr
		  //Source: https://www.andyibanez.com/posts/uimenu-improvements-ios14/
		  
		  Dim photoAction As UIAction = _
		  UIAction.CreateWithTitleImage("Camera", _
		  Picture.SystemImage("camera", 25), _
		  new iOSBlock(WeakAddressOf HandleMenu), _
		  "camera")
		  
		  Dim albumAction As UIAction = _
		  UIAction.CreateWithTitleImage("Photo Album", _
		  Picture.SystemImage("square.stack", 25), _
		  new iOSBlock(WeakAddressOf HandleMenu), _
		  "photoalbum")
		  
		  albumAction.SetAttributes(UInteger(UIAction.UIMenuElementAttributes.Destructive))
		  
		  Dim fromWebAction As UIAction = _
		  UIAction.CreateWithTitleImage("From the web", _
		  Picture.SystemImage("globe", 25), _
		  new iOSBlock(WeakAddressOf HandleMenu),_
		  "from the web")
		  
		  'Dim menuActions As Foundation.NSArray = Foundation.NSArray.CreateWithObjects(Array(photoAction, albumAction, fromWebAction))
		  Dim menuActions As Foundation.NSArray = Array(photoAction, albumAction, fromWebAction)
		  
		  Dim addNewMenu As Ptr = UIMenu.CreateWithTitleChildren("", menuActions)
		  
		  Return addNewMenu
		  
		  #if False
		    func createMenu() -> UIMenu {
		    
		    let photoAction = UIAction(
		    title: "Camera",
		    image: UIImage(systemName: "camera")
		    ) { (_) in
		    print("New Photo from Camera")
		    }
		    
		    let albumAction = UIAction(
		    title: "Photo Album",
		    image: UIImage(systemName: "square.stack")
		    ) { (_) in
		    print("Photo from photo album")
		    }
		    
		    let fromWebAction = UIAction(
		    title: "From the Web",
		    image: UIImage(systemName: "globe")
		    ) { (_) in
		    print("Photo from the internet")
		    }
		    
		    let menuActions = [photoAction, albumAction, fromWebAction]
		    
		    let addNewMenu = UIMenu(
		    title: "",
		    children: menuActions)
		    
		    return addNewMenu
		    }
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleMenu(actionPtr As ptr)
		  
		  dim action As new UIAction(actionPtr)
		  
		  Dim identifier As String = action.identifier
		  
		  Label1.Text = "Clicked on ID=" + identifier.ToText
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  
		  MessageBox("UIMenu requires iOS13+")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  //Source: https://www.andyibanez.com/posts/uimenu-improvements-ios14/
		  
		  if UIMenu.IsAvailable then
		    
		    Dim photoAction As UIAction = _
		    UIAction.CreateWithTitleImage("Camera", _
		    Picture.SystemImage("camera", 25), _
		    new iOSBlock(WeakAddressOf HandleMenu), _
		    "camera")
		    
		    Dim albumAction As UIAction = _
		    UIAction.CreateWithTitleImage("Photo Album", _
		    Picture.SystemImage("square.stack", 25), _
		    new iOSBlock(WeakAddressOf HandleMenu), _
		    "photoalbum")
		    
		    
		    Dim fromWebAction As UIAction = _
		    UIAction.CreateWithTitleImage("From the web", _
		    Picture.SystemImage("globe", 25), _
		    new iOSBlock(WeakAddressOf HandleMenu),_
		    "from the web")
		    
		    
		    Dim menuActions As Foundation.NSArray = Array(photoAction, albumAction, fromWebAction)
		    
		    Dim addNewMenu As Ptr = UIMenu.CreateWithTitleChildren("Title", menuActions)
		    
		    
		    
		    Declare sub setMenu lib UIKitLib selector "setMenu:" (obj as ptr, menu as ptr)
		    Declare sub showsMenuAsPrimaryAction lib UIKitLib selector "setShowsMenuAsPrimaryAction:" (obj as ptr, value as boolean)
		    
		    setMenu(me.Handle, addNewMenu)
		    showsMenuAsPrimaryAction(me.Handle, true)
		    
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button2
	#tag Event
		Sub Action()
		  
		  MessageBox("UIMenu requires iOS13+")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  //Source: https://www.andyibanez.com/posts/uimenu-improvements-ios14/
		  
		  if UIMenu.IsAvailable then
		    Dim photoAction As UIAction = _
		    UIAction.CreateWithTitleImage("Camera", _
		    Picture.SystemImage("camera", 25), _
		    new iOSBlock(WeakAddressOf HandleMenu), _
		    "camera")
		    
		    photoAction.SetAttributes(UInteger(UIAction.UIMenuElementAttributes.Disabled))
		    
		    Dim albumAction As UIAction = _
		    UIAction.CreateWithTitleImage("Photo Album", _
		    Picture.SystemImage("square.stack", 25), _
		    new iOSBlock(WeakAddressOf HandleMenu), _
		    "photoalbum")
		    
		    albumAction.SetAttributes(UInteger(UIAction.UIMenuElementAttributes.Destructive))
		    
		    Dim fromWebAction As UIAction = _
		    UIAction.CreateWithTitleImage("From the web", _
		    Picture.SystemImage("globe", 25), _
		    new iOSBlock(WeakAddressOf HandleMenu),_
		    "from the web")
		    
		    
		    Dim menuActions As Foundation.NSArray = Array(photoAction, albumAction, fromWebAction)
		    
		    Dim addNewMenu As Ptr = UIMenu.CreateWithTitleChildren("Title", menuActions)
		    
		    
		    
		    
		    Declare sub setMenu lib UIKitLib selector "setMenu:" (obj as ptr, menu as ptr)
		    Declare sub showsMenuAsPrimaryAction lib UIKitLib selector "setShowsMenuAsPrimaryAction:" (obj as ptr, value as boolean)
		    
		    setMenu(me.Handle, addNewMenu)
		    showsMenuAsPrimaryAction(me.Handle, true)
		  end if
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
