#tag IOSView
Begin iosView BarcodeScannerView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin Extensions.GenericView GenericView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   GenericView1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   GenericView1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   GenericView1, 3, TopLayoutGuide, 3, False, +1.00, 1, 1, 0, 
      AutoLayout      =   GenericView1, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, 0, 
      Height          =   415.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   1
      Top             =   65
      Visible         =   True
      Width           =   320.0
      Begin iOSButton Button1
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Button1, 4, GenericView1, 4, False, +1.00, 1, 1, -*kStdGapCtlToViewV, 
         AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, 
         AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   Button1, 9, GenericView1, 9, False, +1.00, 1, 1, 0, 
         Caption         =   "Start"
         Enabled         =   True
         Height          =   30.0
         Left            =   110
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "GenericView1"
         Scope           =   0
         TextColor       =   &c007AFF00
         TextFont        =   ""
         TextSize        =   0
         Top             =   430
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel Label1
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   Label1, 2, Button1, 2, False, +1.00, 1, 1, 102, 
         AutoLayout      =   Label1, 4, Button1, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
         AutoLayout      =   Label1, 1, Button1, 1, False, +1.00, 1, 1, -103, 
         Enabled         =   True
         Height          =   30.0
         Left            =   7
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "GenericView1"
         Scope           =   0
         Text            =   ""
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   392
         Visible         =   True
         Width           =   305.0
      End
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  #if DebugBuild
		    Button1.Enabled = False
		    Label1.Text = "This project must be deployed to a device"
		    MsgBox "This project cannot be used in the simulator."
		  #Endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub HandleOutputMetadataObjs(sender as AVFoundation.AVCaptureMetadataOutput, output as AVFoundation.AVCaptureOutput, metadataObjects as Foundation.NSArray, connection as AVFoundation.AVCaptureConnection)
		  if metadataObjects.Count > 0 then
		    dim metadataObj as new AVFoundation.AVMetadataMachineReadableCodeObject( metadataObjects.Value(0) )
		    
		    declare sub performSelectorOnMainThread lib FoundationLib selector "performSelectorOnMainThread:withObject:waitUntilDone:" (obj_id as ptr, sel as ptr, obj as CFStringRef, wait as Boolean)
		    if metadataObj.type = "org.iso.QRCode" or metadataObj.type = "org.iso.Code39" or metadataObj.type = "org.gs1.EAN-13" or metadataObj.type = "org.iso.PDF417" then
		      performSelectorOnMainThread(Label1.Handle,NSSelectorFromString("setText:"),metadataObj.stringValue,False)
		    end if
		    
		    StopReading
		  end if
		  
		  #Pragma Unused sender
		  #Pragma Unused output
		  #Pragma Unused connection
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartReading()
		  using AVFoundation
		  using Foundation
		  dim captureDevice as AVCaptureDevice = AVCaptureDevice.DefaultDeviceWithMediaType(StringConstant("AVFoundation","AVMediaTypeVideo"))
		  
		  dim err as foundation.NSError
		  dim input as AVCaptureDeviceInput = AVCaptureDeviceInput.DeviceInputWithDeviceError(captureDevice, err)
		  
		  if input = nil then
		    MsgBox "", err.localizedDescription
		    Return
		  end if
		  
		  captureSession = new AVCaptureSession
		  captureSession.AddInput input
		  
		  dim metadataOutput as new AVCaptureMetadataOutput
		  
		  captureSession.AddOutput metadataOutput
		  
		  AddHandler metadataOutput.DidOutputMetadataObjects, AddressOf HandleOutputMetadataObjs
		  
		  metadataOutput.metadataObjectTypes = NSArray.CreateWithObjects( Array(new NSString("org.iso.QRCode"), new NSString("org.iso.Code39"), new NSString("org.gs1.EAN-13"), new NSString("org.iso.PDF417")) ) //AVMetadataObjectTypeQRCode
		  
		  videoPreviewLayer = new AVCaptureVideoPreviewLayer(captureSession)
		  
		  videoPreviewLayer.videoGravity = StringConstant("AVFoundation","AVLayerVideoGravityResizeAspectFill")
		  
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
		Sub StopReading()
		  captureSession.StopRunning
		  captureSession = nil
		  
		  declare sub removeFromSuperlayer lib UIKitLib selector "removeFromSuperlayer" (obj_id as Ptr)
		  removeFromSuperlayer(videoPreviewLayer)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		captureSession As AVFoundation.AVCaptureSession
	#tag EndProperty

	#tag Property, Flags = &h0
		videoPreviewLayer As AVFoundation.AVCaptureVideoPreviewLayer
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  StartReading
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
