#tag IOSView
Begin iosView UIDocumentPickerView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "UIDocumentPicker Example"
   Top             =   0
   Begin iOSTextArea TextArea1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TextArea1, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, -*kStdControlGapV, 
      AutoLayout      =   TextArea1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   TextArea1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   TextArea1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      Editable        =   True
      Height          =   399.0
      KeyboardType    =   "0"
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  self.Toolbar.Add iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemAdd)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  if button.Type = iOSToolButton.Types.SystemAdd then
		    if picker <> nil then
		      RemoveHandler picker.Cancelled, AddressOf Cancelled
		      RemoveHandler picker.DidPickDocument, AddressOf DidPickDocument
		      picker = nil
		    end if
		    picker = new iCloudStuff.UIDocumentPickerViewController(NSArray.CreateWithObject(new NSString("public.text")), iCloudStuff.UIDocumentPickerViewController.UIDocumentPickerMode.Open)
		    self.PresentViewController(picker, True, Nil)
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Cancelled(sender as iCloudStuff.UIDocumentPickerViewController)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DidPickDocument(sender as iCloudStuff.UIDocumentPickerViewController, url as NSURL)
		  using  xojo.IO
		  dim file as FolderItem = url.folderitemValue
		  dim tis as TextInputStream = TextInputStream.Open(file, TextEncoding.ASCII)
		  dim docText as Text = tis.ReadAll
		  tis.Close
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		picker As iCloudStuff.UIDocumentPickerViewController
	#tag EndProperty


#tag EndWindowCode

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
