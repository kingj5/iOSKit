#tag IOSView
Begin iosView MissingControlsView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Some Missing Controls"
   Top             =   0
   Begin iOSMessageBox MessageBox1
      Left            =   0
      LeftButton      =   "Cancel"
      LockedInPosition=   False
      Message         =   "Hello World"
      PanelIndex      =   -1
      Parent          =   ""
      RightButton     =   ""
      Scope           =   0
      Title           =   "Hi There"
      Top             =   0
   End
   Begin iOSLabel Label2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label2, 1, <Parent>, 1, False, +1.00, 1, 1, 160, , True
      AutoLayout      =   Label2, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Label2, 3, <Parent>, 3, False, +1.00, 1, 1, 73, , True
      AutoLayout      =   Label2, 8, , 0, False, +1.00, 1, 1, 30, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   160
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Value:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   100.0
   End
   Begin Extensions.PickerView PickerView2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PickerView2, 8, , 0, False, +1.00, 1, 1, 116, , True
      AutoLayout      =   PickerView2, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   PickerView2, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   PickerView2, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      Height          =   116.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   1
      Top             =   452
      Visible         =   True
      Width           =   280.0
   End
   Begin UIKit.UISearchBar UISearchBar1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      autocapitalizationType=   1
      autocorrectionType=   ""
      AutoLayout      =   UISearchBar1, 3, <Parent>, 3, False, +1.00, 1, 1, 151, , True
      AutoLayout      =   UISearchBar1, 9, <Parent>, 1, False, +1.00, 2, 1, 20, , True
      AutoLayout      =   UISearchBar1, 1, <Parent>, 1, False, +1.00, 1, 1, 20, , True
      AutoLayout      =   UISearchBar1, 8, , 0, False, +1.00, 1, 1, 121, , True
      AutoLayout      =   UISearchBar1, 2, <Parent>, 2, False, +1.00, 2, 1, -20, , True
      backgroundImage =   ""
      barStyle        =   ""
      Height          =   121.0
      keyboardType    =   0
      Left            =   20
      LockedInPosition=   False
      placeholder     =   "My name is..."
      prompt          =   "Enter your name:"
      Scope           =   0
      scopeBarBackgroundImage=   ""
      searchBarStyle  =   2
      searchResultsButtonSelected=   False
      selectedScopeButtonIndex=   0
      showsBookmarkButton=   False
      showsCancelButton=   False
      showsScopeBar   =   True
      showsSearchResultsButton=   False
      spellCheckingType=   ""
      text            =   ""
      Top             =   151
      translucent     =   False
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 304, , True
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 1, 1, 20, , True
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, 20, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   304
      Visible         =   True
      Width           =   320.0
   End
   Begin Extensions.UIStepper UIStepper1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   UIStepper1, 8, , 0, False, +1.00, 1, 1, 46, , True
      AutoLayout      =   UIStepper1, 1, <Parent>, 1, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   UIStepper1, 3, <Parent>, 3, False, +1.00, 2, 1, 70, , True
      AutoLayout      =   UIStepper1, 7, , 0, False, +1.00, 1, 1, 103, , True
      autorepeat      =   False
      continuous      =   False
      Height          =   46.0
      Left            =   30
      LockedInPosition=   False
      maximumValue    =   100.0
      minimumValue    =   0.0
      Scope           =   1
      stepValue       =   1.0
      Top             =   70
      value           =   0.0
      Visible         =   True
      Width           =   103.0
      wraps           =   False
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  'cmm = new CMMotionManager
		  'if not cmm.deviceMotionAvailable then
		  'MsgBox "Device motion not available","This game cannot be played on your device"
		  'end if
		  'cmm.startDeviceMotionUpdates
		  
		  'dim b as new iOSButton
		  'b.Caption = "Hello"
		  'self.AddControlAtPoint(b,new xojo.Core.Point(25,100))
		  '
		  'dim r as new iOSRectangle
		  'r.FillColor = color.Blue
		  'self.AddControlWithBounds(r,new xojo.Core.Rect(50,50,50,50))
		  
		  /////////////////
		  'SEL selector = @selector(someMethodWithAchar:anInt:aFloat:aString:);
		  
		  'SomeObject        * obj = [[SomeObject alloc]init];
		  'NSMethodSignature * sig = [obj methodSignatureForSelector:selector];
		  
		  
		  'NSUInteger arg_count = [sig numberOfArguments];
		  
		  'for( NSUInteger i = 0; i < arg_count; i++ ) {
		  
		  'const char * type = [sig getArgumentTypeAtIndex:i];
		  
		  'NSGetSizeAndAlignment( type, &size, NULL );
		  'next
		  /////////////////
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub draw(sender as iOSCanvas, mgraphics as iOSGraphics)
		  mgraphics.FillOval 100,100,10,10
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cmm As CMMotionManager
	#tag EndProperty

	#tag Property, Flags = &h0
		touchPts() As xojo.Core.Point
	#tag EndProperty


#tag EndWindowCode

#tag Events PickerView2
	#tag Event
		Sub Open()
		  PickerView2.AddColumn(Array("Apple","Banana","Pear","Grape"))
		  PickerView2.AddColumn(Array("Punch","Soda"))
		  PickerView2.Invalidate
		  PickerView2.SelectedRow(0) = 1
		  PickerView2.SelectedRow(1) = 1
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(row as integer, column as integer)
		  Label1.Text = me.Text(row,column)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UISearchBar1
	#tag Event
		Sub TextChanged(newText as Text)
		  Label2.Text = newText
		End Sub
	#tag EndEvent
	#tag Event
		Sub SearchButtonPressed()
		  me.DismissKeyboard
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  dim scopeButtonArr as Foundation.NSArray = Array(new NSString("One"),new NSString("Two"), new NSString("Three"))
		  me.scopeButtonTitles = scopeButtonArr
		  me.barTintColor = new UIColor(app.TestWhite)
		  me.tintColor = new UIColor(app.TestBlue)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UIStepper1
	#tag Event
		Sub ValueChanged()
		  dim value as Integer = me.value
		  label2.Text = "Value: " + value.ToText
		  
		  
		  
		  
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
