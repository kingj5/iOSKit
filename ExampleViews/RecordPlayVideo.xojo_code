#tag IOSView
Begin iosView RecordPlayVideo
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Record and Play Video"
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   Button1, 4, <Parent>, 4, False, +1.00, 1, 1, -*kStdGapCtlToViewV, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, 
      Caption         =   "Record"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   430
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton Button2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button2, 4, <Parent>, 4, False, +1.00, 2, 1, -*kStdGapCtlToViewV, 
      AutoLayout      =   Button2, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Button2, 7, , 0, False, +1.00, 2, 1, 100, 
      AutoLayout      =   Button2, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Play"
      Enabled         =   True
      Height          =   30.0
      Left            =   200
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   430
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 4, Button2, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      Height          =   349.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Top             =   73
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Method, Flags = &h0
		Sub HandlePictureTaken(sender as UIKit.UIImagePickerController)
		  mediaURL = sender.mediaURL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  if mediaURL <> nil then
		    player = new Extensions.MPMoviePlayerController(mediaURL)
		    player.prepareToPlay
		    
		    dim viewBounds as new NSRect
		    viewBounds.rsize = new NSSize(Canvas1.Width,Canvas1.Height) //use the canvas instead
		    //the original declares were wrong here and caused a weird offset, switch to these and it will properly appear in the frame
		    #if Target32Bit
		      declare sub setFrame lib UIKitLib selector "setFrame:" (obj_id as ptr, frame as NSRect32)
		      setFrame(player.view,viewBounds.Value32)
		    #Elseif Target64Bit
		      declare sub setFrame lib UIKitLib selector "setFrame:" (obj_id as ptr, frame as NSRect64)
		      setFrame(player.view,viewBounds.Value64)
		    #Endif
		    
		    dim viewPtr as Ptr = Canvas1.Handle //use the canvas handle
		    declare sub addSubview lib UIKitLib selector "addSubview:" (obj_id as ptr, view as ptr)
		    addSubview(viewPtr,player.view)
		    
		    player.play
		    
		    //player.fullscreen = True //don't put it in full screen, the user can do that if they want
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Record()
		  if recorder <> nil then
		    RemoveHandler recorder.PictureTaken, AddressOf HandlePictureTaken
		  end if
		  
		  recorder = new UIKit.UIImagePickerController
		  AddHandler recorder.PictureTaken, AddressOf HandlePictureTaken
		  
		  recorder.sourceType = UIKit.UIImagePickerController.Source.Camera
		  recorder.mediaTypes = Foundation.NSArray.CreateWithObject(new NSString(UIKit.UIImagePickerController.kUTTypeMovie))
		  
		  recorder.PresentInView(self)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mediaURL As Foundation.NSURL
	#tag EndProperty

	#tag Property, Flags = &h0
		player As Extensions.MPMoviePlayerController
	#tag EndProperty

	#tag Property, Flags = &h0
		recorder As UIKit.UIImagePickerController
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  Record
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button2
	#tag Event
		Sub Action()
		  Play
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
