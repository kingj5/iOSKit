#tag IOSView
Begin iosView StillImageView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Still Image Capture"
   Top             =   0
   Begin Extensions.GenericView GenericView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   GenericView1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   GenericView1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, 
      AutoLayout      =   GenericView1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   GenericView1, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, 0, 
      Height          =   415.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   1
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  xojo.core.Timer.CallLater(1,AddressOf SetUp)
		  //iosusercontrols are not resized until after the open event so any code which uses their bounds
		  //gets messed up in the open event - delay setup until after the open event
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  TakePicture
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ImageCaptured(img as iOSImage)
		  
		  captureSession.StopRunning
		  captureSession = nil
		  
		  declare sub removeFromSuperlayer lib UIKitLib selector "removeFromSuperlayer" (obj_id as Ptr)
		  removeFromSuperlayer(videoPreviewLayer)
		  
		  'declare function CGImage Lib UIKitLib selector "CGImage" (obj_id as ptr) as ptr
		  'declare function layer lib UIKitLib selector "layer" (obj_id as ptr) as ptr
		  'dim viewLayer as ptr = layer(GenericView1.Handle)
		  'declare sub setContents lib UIKitLib selector "setContents:" (obj_id as ptr, contents as Ptr)
		  'setContents(viewLayer,CGImage(img.Handle))
		  
		  
		  
		  dim p as new PictureView
		  p.SetImage(img)
		  self.PushTo(p)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUp()
		  dim captureDevice as AVFoundation.AVCaptureDevice = AVFoundation.AVCaptureDevice.DefaultDeviceWithMediaType(AVFoundation.AVStringConstant("AVMediaTypeVideo"))
		  
		  dim err as foundation.NSError
		  dim input as AVFoundation.AVCaptureDeviceInput = AVFoundation.AVCaptureDeviceInput.DeviceInputWithDeviceError(captureDevice, err)
		  
		  if input = nil then
		    MsgBox "", err.localizedDescription
		    Return
		  end if
		  
		  stillImageOutput = new AVFoundation.AVCaptureStillImageOutput
		  
		  dim jpeg as Text = AVFoundation.AVStringConstant("AVVideoCodecJPEG")
		  dim videoKey as Text = AVFoundation.AVStringConstant("AVVideoCodecKey")
		  
		  dim outputSettings as Foundation.NSDictionary = Foundation.NSDictionary.CreateFromObject(new NSString(videoKey), new NSString(jpeg))
		  stillImageOutput.outputSettings = outputSettings
		  
		  captureSession = new AVFoundation.AVCaptureSession
		  if captureSession.CanAddInput(input) then
		    captureSession.AddInput(input)
		  end if
		  if captureSession.CanAddOutput(stillImageOutput) then
		    captureSession.AddOutput(stillImageOutput)
		  end if
		  
		  //set up preview
		  videoPreviewLayer = new AVFoundation.AVCaptureVideoPreviewLayer(captureSession)
		  
		  videoPreviewLayer.videoGravity = AVFoundation.AVStringConstant("AVLayerVideoGravityResizeAspectFill")
		  
		  #if Target32Bit
		    declare sub setFrame lib AVFoundationLib selector"setFrame:" (obj_id as ptr, frame as NSRect32)
		    declare function bounds lib UIKitLib selector "bounds" (obj_id as ptr) as NSRect32
		  #elseif Target64Bit
		    declare sub setFrame lib AVFoundationLib selector"setFrame:" (obj_id as ptr, frame as NSRect64)
		    declare function bounds lib UIKitLib selector "bounds" (obj_id as ptr) as NSRect64
		  #Endif
		  declare function layer lib UIKitLib selector "layer" (obj_id as ptr) as ptr
		  declare sub addSublayer lib UIKitLib selector "addSublayer:" (obj_id as ptr, sublayer as ptr)
		  
		  dim viewLayer as ptr = layer(GenericView1.Handle)
		  setFrame( videoPreviewLayer, bounds(viewLayer) )
		  addSublayer(viewLayer, videoPreviewLayer)
		  
		  captureSession.StartRunning
		  
		  self.Toolbar.Add iOSToolButton.NewSystemItem(iOSToolButton.Type.SystemCamera)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TakePicture()
		  
		  dim connection as AVFoundation.AVCaptureConnection = stillImageOutput.ConnectionWithMediaType(AVFoundation.AVStringConstant("AVMediaTypeVideo"))
		  connection.videoOrientation = AVFoundation.AVCaptureConnection.AVCaptureVideoOrientation.Portrait
		  stillImageOutput.CaptureJPEGImageAsynchronously(connection,AddressOf ImageCaptured)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		captureSession As AVFoundation.AVCaptureSession
	#tag EndProperty

	#tag Property, Flags = &h0
		stillImageOutput As AVFoundation.AVCaptureStillImageOutput
	#tag EndProperty

	#tag Property, Flags = &h0
		videoPreviewLayer As AVFoundation.AVCaptureVideoPreviewLayer
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
