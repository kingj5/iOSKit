#tag IOSView
Begin iosView KeychainView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Keychain Services"
   Top             =   0
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 1, 1, 236, 
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 83, 
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Service:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   83
      Visible         =   True
      Width           =   536.0
   End
   Begin iOSTextField ServiceField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ServiceField, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   ServiceField, 3, <Parent>, 3, False, +1.00, 1, 1, 82, 
      AutoLayout      =   ServiceField, 1, <Parent>, 1, False, +1.00, 1, 1, 92, 
      AutoLayout      =   ServiceField, 8, , 0, True, +1.00, 1, 1, 31, 
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   "0"
      Left            =   92
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   ""
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   82
      Visible         =   True
      Width           =   208.0
   End
   Begin iOSLabel Label2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label2, 1, Label1, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Label2, 3, <Parent>, 3, False, +1.00, 1, 1, 126, 
      AutoLayout      =   Label2, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label2, 2, <Parent>, 2, False, +1.00, 1, 1, 236, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Account:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   126
      Visible         =   True
      Width           =   536.0
   End
   Begin iOSTextField AccountField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   AccountField, 1, <Parent>, 1, False, +1.00, 1, 1, 92, 
      AutoLayout      =   AccountField, 3, <Parent>, 3, False, +1.00, 1, 1, 126, 
      AutoLayout      =   AccountField, 8, , 0, True, +1.00, 1, 1, 31, 
      AutoLayout      =   AccountField, 7, , 0, False, +1.00, 1, 1, 208, 
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   "0"
      Left            =   92
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   ""
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   126
      Visible         =   True
      Width           =   208.0
   End
   Begin iOSLabel Label3
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label3, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      AutoLayout      =   Label3, 3, <Parent>, 3, False, +1.00, 1, 1, 169, 
      AutoLayout      =   Label3, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label3, 2, <Parent>, 2, False, +1.00, 1, 1, 236, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Comment:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   169
      Visible         =   True
      Width           =   536.0
   End
   Begin iOSTextField CommentField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   CommentField, 1, ServiceField, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   CommentField, 3, <Parent>, 3, False, +1.00, 1, 1, 169, 
      AutoLayout      =   CommentField, 8, , 0, True, +1.00, 1, 1, 31, 
      AutoLayout      =   CommentField, 7, , 0, False, +1.00, 1, 1, 208, 
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   "0"
      Left            =   92
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   ""
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   169
      Visible         =   True
      Width           =   208.0
   End
   Begin iOSLabel Label4
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label4, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      AutoLayout      =   Label4, 3, <Parent>, 3, False, +1.00, 1, 1, 212, 
      AutoLayout      =   Label4, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label4, 7, , 0, False, +1.00, 1, 1, 64, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Label:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   212
      Visible         =   True
      Width           =   64.0
   End
   Begin iOSTextField LabelField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   LabelField, 1, <Parent>, 1, False, +1.00, 1, 1, 92, 
      AutoLayout      =   LabelField, 3, <Parent>, 3, False, +1.00, 1, 1, 212, 
      AutoLayout      =   LabelField, 8, , 0, True, +1.00, 1, 1, 31, 
      AutoLayout      =   LabelField, 7, , 0, False, +1.00, 1, 1, 208, 
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   "0"
      Left            =   92
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   ""
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   212
      Visible         =   True
      Width           =   208.0
   End
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      AutoLayout      =   Button1, 3, <Parent>, 3, False, +1.00, 1, 1, 402, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, 
      Caption         =   "Save"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   402
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSLabel Label5
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label5, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      AutoLayout      =   Label5, 3, <Parent>, 3, False, +1.00, 1, 1, 251, 
      AutoLayout      =   Label5, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label5, 7, , 0, False, +1.00, 1, 1, 91, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Description:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   251
      Visible         =   True
      Width           =   91.0
   End
   Begin iOSTextArea DescriptionField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   DescriptionField, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      AutoLayout      =   DescriptionField, 3, <Parent>, 3, False, +1.00, 1, 1, 286, 
      AutoLayout      =   DescriptionField, 8, , 0, False, +1.00, 1, 1, 65, 
      AutoLayout      =   DescriptionField, 2, LabelField, 2, False, +1.00, 1, 1, 0, 
      Editable        =   True
      Height          =   65.0
      KeyboardType    =   "0"
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   286
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSLabel Label6
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label6, 1, DescriptionField, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Label6, 3, DescriptionField, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Label6, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label6, 7, , 0, False, +1.00, 1, 1, 80, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Password:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   359
      Visible         =   True
      Width           =   80.0
   End
   Begin iOSTextField PasswordField
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PasswordField, 1, Label5, 2, False, +1.00, 1, 1, *kStdControlGapH, 
      AutoLayout      =   PasswordField, 10, Label6, 10, False, +1.00, 1, 1, 0, 
      AutoLayout      =   PasswordField, 8, , 0, True, +1.00, 1, 1, 31, 
      AutoLayout      =   PasswordField, 7, , 0, False, +1.00, 1, 1, 181, 
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   "0"
      Left            =   119
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   ""
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   358
      Visible         =   True
      Width           =   181.0
   End
   Begin iOSButton Button3
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button3, 4, <Parent>, 4, False, +1.00, 2, 1, -*kStdGapCtlToViewV, 
      AutoLayout      =   Button3, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button3, 7, , 0, False, +1.00, 1, 1, 100, 
      AutoLayout      =   Button3, 9, <Parent>, 9, False, +1.00, 2, 1, 0, 
      Caption         =   "Delete"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   430
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton Button4
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button4, 2, PasswordField, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button4, 3, <Parent>, 3, False, +1.00, 1, 1, 402, 
      AutoLayout      =   Button4, 7, , 0, False, +1.00, 1, 1, 145, 
      AutoLayout      =   Button4, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Load from Saved"
      Enabled         =   True
      Height          =   30.0
      Left            =   155
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   402
      Visible         =   True
      Width           =   145.0
   End
End
#tag EndIOSView

#tag WindowCode
#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  dim item as new KeychainServices.JK_KeychainItem
		  item.ServiceName = ServiceField.Text
		  item.AccountName = AccountField.Text
		  item.Comment = CommentField.Text
		  item.Label = LabelField.Text
		  item.Description = DescriptionField.Text
		  
		  dim password as Text = PasswordField.Text
		  
		  KeychainServices.AddPassword item, password
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button3
	#tag Event
		Sub Action()
		  dim item as new KeychainServices.JK_KeychainItem
		  item.ServiceName = ServiceField.Text
		  
		  item.Delete
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button4
	#tag Event
		Sub Action()
		  dim item as new KeychainServices.JK_KeychainItem
		  item.ServiceName = ServiceField.Text
		  
		  dim password as Text = KeychainServices.FindPassword(item)
		  
		  AccountField.Text = item.AccountName
		  CommentField.Text = item.Comment
		  LabelField.Text = item.Label
		  DescriptionField.Text = item.Description
		  PasswordField.Text = password
		  
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
