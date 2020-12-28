#tag IOSView
Begin iosView StillImageView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Still Image Capture"
   Top             =   0
   Begin Extensions.SwipeView GenericView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   GenericView1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   GenericView1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   GenericView1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   GenericView1, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      Height          =   503.0
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
		  Timer.CallLater(1,AddressOf SetUp)
		  //iosusercontrols are not resized until after the open event so any code which uses their bounds
		  //gets messed up in the open event - delay setup until after the open event
		  
		  
		  #if XojoVersion < 2015.03
		    self.Toolbar.Add iOSToolButton.NewSystemItem(iOSToolButton.Type.SystemCamera)
		    self.Toolbar.Add iOSToolButton.NewSystemItem(iOSToolButton.Type.SystemFlexibleSpace)
		    self.Toolbar.Add iOSToolButton.NewPlain("Flip Camera")
		  #Else
		    self.Toolbar.Add iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemCamera)
		    self.Toolbar.Add iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemFlexibleSpace)
		    self.Toolbar.Add iOSToolButton.NewPlain("Flip Camera")
		  #Endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  if button.Type = iOSToolButton.Types.SystemCamera then
		    TakePicture
		  else
		    ToggleCamera
		  end if
		  
		  #Pragma Unused button
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CleanupConnection()
		  captureSession.StopRunning
		  captureSession = nil
		  
		  declare sub removeFromSuperlayer lib UIKitLib selector "removeFromSuperlayer" (obj_id as Ptr)
		  removeFromSuperlayer(videoPreviewLayer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FaceCamera() As AVFoundation.AVCaptureDevice
		  dim devices as Foundation.NSArray = AVFoundation.AVCaptureDevice.DevicesWithMediaType(AVFoundation.AVStringConstant("AVMediaTypeVideo"))
		  dim count as Integer = devices.Count
		  for x as Integer = 0 to count-1
		    dim device as new AVFoundation.AVCaptureDevice(devices.Value(x))
		    if device.position = AVFoundation.AVCaptureDevice.AVCaptureDevicePosition.Front then
		      Return device
		    end if
		  next 
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImageCaptured(img as iOSImage)
		  
		  dim p as new PictureView
		  p.SetImage(img)
		  self.PushTo(p)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUp()
		  captureDevice = AVFoundation.AVCaptureDevice.DefaultDeviceWithMediaType(AVFoundation.AVStringConstant("AVMediaTypeVideo"))
		  
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
		  'videoPreviewLayer.connection.videoOrientation = AVFoundation.AVCaptureConnection.AVCaptureVideoOrientation.LandscapeRight
		  
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
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUpFaceCamera()
		  captureDevice = FaceCamera()
		  
		  if captureDevice = nil then
		    //there is no face camera on this device
		    MsgBox "Face Camera is unavailable"
		    isFaceCamera = False
		    SetUp() //call the normal setup so we still have a connection
		    Return
		  end if
		  
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
		  'videoPreviewLayer.connection.videoOrientation = AVFoundation.AVCaptureConnection.AVCaptureVideoOrientation.LandscapeRight
		  
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
		  
		  #if XojoVersion < 2015.03
		    self.Toolbar.Add iOSToolButton.NewSystemItem(iOSToolButton.Type.SystemCamera)
		  #Else
		    self.Toolbar.Add iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemCamera)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TakePicture()
		  
		  dim connection as AVFoundation.AVCaptureConnection = stillImageOutput.ConnectionWithMediaType(AVFoundation.AVStringConstant("AVMediaTypeVideo"))
		  connection.videoOrientation = AVFoundation.AVCaptureConnection.AVCaptureVideoOrientation.Portrait
		  stillImageOutput.CaptureJPEGImageAsynchronously(connection,AddressOf ImageCaptured)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleCamera()
		  CleanupConnection
		  
		  if isFaceCamera then
		    isFaceCamera = False
		    SetUp()
		  else
		    isFaceCamera = True
		    SetUpFaceCamera
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private captureDevice As AVFoundation.AVCaptureDevice
	#tag EndProperty

	#tag Property, Flags = &h0
		captureSession As AVFoundation.AVCaptureSession
	#tag EndProperty

	#tag Property, Flags = &h0
		isFaceCamera As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		stillImageOutput As AVFoundation.AVCaptureStillImageOutput
	#tag EndProperty

	#tag Property, Flags = &h0
		videoPreviewLayer As AVFoundation.AVCaptureVideoPreviewLayer
	#tag EndProperty


#tag EndWindowCode

#tag Events GenericView1
	#tag Event
		Sub LayerTouch(t as xojo.Core.Point, type as Integer)
		  //type 0 = began, 1 = moved, 2 = ended
		  dim pt as new NSPoint(t.x,t.y)
		  pt = videoPreviewLayer.CaptureDevicePointOfInterestForPoint(pt)
		  dim err as Foundation.NSError
		  call captureDevice.LockForConfiguration(err)
		  captureDevice.focusPointOfInterest = pt
		  captureDevice.focusMode = AVFoundation.AVCaptureDevice.AVCaptureFocusMode.AutoFocus
		  
		  call captureDevice.UnlockForConfiguration
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
		Name="isFaceCamera"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
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
