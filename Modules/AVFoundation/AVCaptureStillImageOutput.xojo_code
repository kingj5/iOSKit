#tag Class
Protected Class AVCaptureStillImageOutput
Inherits AVFoundation.AVCaptureOutput
	#tag Method, Flags = &h0
		Sub CaptureJPEGImageAsynchronously(connection as AVFoundation.AVCaptureConnection, callback as ImageCapturedDelegate)
		  declare sub capture_ lib AVFoundationLib selector "captureStillImageAsynchronouslyFromConnection:completionHandler:" _
		  (obj_id as ptr, connection as ptr, callback as ptr)
		  mCallback = callback
		  done = False
		  dim compHandler as new iOSBlock(AddressOf CompletionHandler)
		  capture_(self,connection,compHandler.Handle)
		  
		  xojo.core.timer.CallLater(2,AddressOf CompletionWatcher)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureStillImageOutput")
		  Return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompletionHandler(sampleBuffer as ptr, err as ptr)
		  #Pragma StackOverflowChecking false
		  #Pragma DisableBackgroundTasks
		  
		  declare function retain lib FoundationLib selector "retain" (obj_id as ptr) as ptr
		  sampleBuff = retain(sampleBuffer)
		  error = retain(err)
		  done = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompletionWatcher()
		  if not done then
		    xojo.core.Timer.CallLater(2,AddressOf CompletionWatcher)
		    Return
		  end if
		  
		  if error <> nil then
		    mCallback.Invoke(nil)
		  end if
		  declare function imageWithData lib UIKitLib selector "imageWithData:" (clsRef as ptr, data as ptr) as ptr
		  declare function jpegDataRepresentation lib AVFoundationLib selector "jpegStillImageNSDataRepresentation:" (clsRef as ptr, buff as ptr) as ptr
		  
		  dim UIImg as ptr = imageWithData(NSClassFromString("UIImage"), jpegDataRepresentation(ClassRef,sampleBuff))
		  
		  declare sub release lib FoundationLib selector "release" (obj_id as ptr)
		  release(sampleBuff)
		  release(error)
		  
		  dim img as iOSImage = iOSImage.FromHandle(UIImg)
		  mCallback.Invoke(img)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(ClassRef)))
		  
		  
		  //kCMVideoCodecType_JPEG = 1785750887
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ImageCapturedDelegate(img as iOSImage)
	#tag EndDelegateDeclaration


	#tag Property, Flags = &h21
		Private done As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private error As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCallback As ImageCapturedDelegate
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function outputSettings_ lib AVFoundationLib selector "outputSettings" (obj_id as ptr) as ptr
			  Return new Foundation.NSDictionary(outputSettings_(self))
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setOutputSettings lib AVFoundationLib selector "setOutputSettings:" (obj_id as ptr, settings as ptr)
			  setOutputSettings(self,value)
			End Set
		#tag EndSetter
		outputSettings As Foundation.NSDictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private sampleBuff As Ptr
	#tag EndProperty


	#tag ViewBehavior
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
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
