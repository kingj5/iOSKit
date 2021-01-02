#tag IOSView
Begin iosView ActivityView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Share with UIActivity"
   Top             =   0
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  #if XojoVersion < 2015.03
		    Toolbar.Add(iOSToolButton.NewSystemItem(iOSToolButton.Type.SystemAction))
		  #Else
		    Toolbar.Add(iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemAction))
		  #Endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  #if XojoVersion < 2015.03
		    if button.Type = iOSToolButton.Type.SystemAction then
		  #Else
		    if button.Type = iOSToolButton.Types.SystemAction then
		  #Endif
		  //create an image to share
		  dim b as new iOSBitmap(100,100,1.0)
		  b.Graphics.FillColor = Color.Blue
		  b.Graphics.FillRect 0,0,b.Graphics.Width, b.Graphics.Height
		  b.Graphics.FillColor = Color.Red
		  b.Graphics.DrawTextLine("Test",10,10)
		  
		  //create the view controller
		  using Extensions
		  using Foundation
		  using UIKit
		  dim controller as UIActivityViewController
		  //create the controller -> create a single item array with an nsobject representing the image
		  //the second parameter is an NSArray of custom UIActivity objects, just pass nil since custom object
		  //UIActivity creation is _difficult_ in xojo
		  'controller = new UIActivityViewController(NSArray.CreateWithObject(new NSObject(b.Image.Handle)),nil)
		  dim url as Foundation.NSURL = Foundation.NSURL.URLWithString("http://www.pps4me.de")
		  controller = new UIActivityViewController(NSArray.CreateWithObject(url),nil)
		  
		  controller.excludedActivityTypes = NSArray.CreateWithObject( new NSString(UIActivity.UIActivityTypePrint))
		  //present with nil completion handler
		  self.PresentViewController(controller, True, nil)
		  end if
		End Sub
	#tag EndEvent


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
