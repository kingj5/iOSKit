#tag Class
Class UIImagePickerController
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function AvailableCaptureModesForCameraDevice(cameraDevice as UIImagePickerControllerCameraDevice) As NSArray
		  declare function availableCaptureModesForCameraDevice_ lib UIKitLib selector "availableCaptureModesForCameraDevice:" (clsRef as ptr, cameraDevice as UIImagePickerControllerCameraDevice) as ptr
		  Return new NSArray(availableCaptureModesForCameraDevice_(ClassRef, cameraDevice))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function AvailableMediaTypesForSourceType(sourceType as Source) As NSArray
		  declare function availableMediaTypesForSourceType_ lib UIKitLib selector "availableMediaTypesForSourceType:" (clsRef as ptr, sourceType as Source) as ptr
		  Return new NSArray(availableMediaTypesForSourceType_(ClassRef, sourceType))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIImagePickerController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(NSClassFromString("UIImagePickerController"))))
		  
		  dim del as ptr = Initialize(Allocate(TargetClass))
		  mdelegate = del
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(del) = xojo.Core.WeakRef.Create(self)
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub dismiss()
		  declare sub dismissModalViewController lib UIKitLib selector "dismissViewControllerAnimated:completion:" _
		  (obj_id as ptr, animated as Boolean, completion as ptr)
		  dismissModalViewController(mparentViewController.ViewControllerHandle, True, Nil)
		  
		  mparentViewController = nil
		  
		  RaiseEvent Dismiss
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidCancel()
		  RaiseEvent Cancel
		  self.dismiss
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFinishPicking(infoDict as ptr)
		  
		  declare function objectForKey lib FoundationLib selector "objectForKey:" (obj_id as ptr, key as CFStringRef) as ptr
		  declare function stringForKey lib FoundationLib selector "objectForKey:" (obj_id as ptr, key as CFStringRef) as CFStringRef
		  
		  dim mediaType as Text = stringForKey(infoDict,UIImagePickerControllerMediaType)
		  
		  originalImage = nil
		  editedImage = nil
		  mediaURL = nil
		  
		  if mediaType = kUTTypeImage then
		    originalImage = iOSImage.FromHandle(objectForKey(infoDict,UIImagePickerControllerOriginalImage))
		    dim edit as ptr = objectForKey(infoDict,UIImagePickerControllerEditedImage)
		    if edit <> nil then
		      editedImage = iOSImage.FromHandle(edit)
		    end if
		  elseif mediaType = kUTTypeMovie then
		    mediaURL = new Foundation.NSURL(objectForKey(infoDict,UIImagePickerControllerMediaURL))
		  end if
		  
		  RaiseEvent PictureTaken
		  
		  self.dismiss
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didCancel(pid as ptr, sel as ptr, pickercontroller as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w<> nil then
		    UIImagePickerController(w.Value).HandleDidCancel
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused pickercontroller
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didFinishPickingMedia(pid as ptr, sel as ptr, pickercontroller as ptr, infoDict as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w<> nil then
		    UIImagePickerController(w.Value).HandleDidFinishPicking(infoDict)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused pickercontroller
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IsCameraDeviceAvailable(cameraDevice as UIImagePickerControllerCameraDevice) As Boolean
		  declare function isCameraDeviceAvailable_ lib UIKitLib selector "isCameraDeviceAvailable:" (clsRef as ptr, cameraDevice as UIImagePickerControllerCameraDevice) as Boolean
		  Return isCameraDeviceAvailable_(ClassRef, cameraDevice)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IsFlashAvailableForCameraDevice(cameraDevice as UIImagePickerControllerCameraDevice) As Boolean
		  declare function isFlashAvailableForCameraDevice_ lib UIKitLib selector "isFlashAvailableForCameraDevice:" (clsRef as ptr, cameraDevice as UIImagePickerControllerCameraDevice) as Boolean
		  Return isFlashAvailableForCameraDevice_(ClassRef, cameraDevice)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IsSourceTypeAvailable(sourceType as Source) As Boolean
		  declare function isSourceTypeAvailable_ lib UIKitLib selector "isSourceTypeAvailable:" (clsRef as ptr, sourceType as Source) as Boolean
		  Return isSourceTypeAvailable_(ClassRef, sourceType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(mView as iOSView)
		  declare sub presentViewController lib UIKitLib selector "presentViewController:animated:completion:" _
		  (obj_id as ptr, controller as ptr, animated as Boolean, completion as ptr)
		  presentViewController(mView.ViewControllerHandle, self, True, nil)
		  
		  mparentViewController = mView //get a reference to dismiss ourself
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartVideoCapture() As Boolean
		  declare function startVideoCapture_ lib UIKitLib selector "startVideoCapture" (obj_id as ptr) as Boolean
		  Return startVideoCapture_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopVideoCapture()
		  declare sub stopVideoCapture_ lib UIKitLib selector "stopVideoCapture" (obj_id as ptr)
		  stopVideoCapture_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TakePicture()
		  declare sub takePicture_ lib UIKitLib selector "takePicture" (obj_id as ptr)
		  takePicture_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("imagePickerController:didFinishPickingMediaWithInfo:", AddressOf impl_didFinishPickingMedia, "v@:@@")
		    methods.Append new TargetClassMethodHelper("imagePickerControllerDidCancel:", AddressOf impl_didCancel, "v@:@")
		    targetID = BuildTargetClass("NSObject","UIImagePickerDelegate",methods)
		  end if
		  Return targetID
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Cancel()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Dismiss()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PictureTaken()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function allowsEditing_ lib UIKitLib selector "allowsEditing" (obj_id as ptr) as Boolean
			  Return allowsEditing_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub allowsEditing_ lib UIKitLib selector "setAllowsEditing:" (obj_id as ptr, allowsEditing as Boolean)
			  allowsEditing_(self, value)
			End Set
		#tag EndSetter
		allowsEditing As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function cameraCaptureMode_ lib UIKitLib selector "cameraCaptureMode" (obj_id as ptr) as UIImagePickerControllerCameraCaptureMode
			  Return (cameraCaptureMode_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub cameraCaptureMode_ lib UIKitLib selector "setCameraCaptureMode:" (obj_id as ptr, cameraCaptureMode as UIImagePickerControllerCameraCaptureMode)
			  cameraCaptureMode_(self, value)
			End Set
		#tag EndSetter
		cameraCaptureMode As UIImagePickerControllerCameraCaptureMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function cameraDevice_ lib UIKitLib selector "cameraDevice" (obj_id as ptr) as UIImagePickerControllerCameraDevice
			  Return (cameraDevice_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub cameraDevice_ lib UIKitLib selector "setCameraDevice:" (obj_id as ptr, cameraDevice as UIImagePickerControllerCameraDevice)
			  cameraDevice_(self, value)
			End Set
		#tag EndSetter
		cameraDevice As UIImagePickerControllerCameraDevice
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function cameraFlashMode_ lib UIKitLib selector "cameraFlashMode" (obj_id as ptr) as UIImagePickerControllerCameraFlashMode
			  Return (cameraFlashMode_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub cameraFlashMode_ lib UIKitLib selector "setCameraFlashMode:" (obj_id as ptr, cameraFlashMode as UIImagePickerControllerCameraFlashMode)
			  cameraFlashMode_(self, value)
			End Set
		#tag EndSetter
		cameraFlashMode As UIImagePickerControllerCameraFlashMode
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		editedImage As iOSImage
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function delegate_ lib UIKitLib selector "delegate" (obj_id as ptr) as ptr
			  Return (delegate_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub delegate_ lib UIKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
			  delegate_(self, value)
			End Set
		#tag EndSetter
		mdelegate As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function mediaTypes_ lib UIKitLib selector "mediaTypes" (obj_id as ptr) as Ptr
			  Return new Foundation.NSArray(mediaTypes_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub mediaTypes_ lib UIKitLib selector "setMediaTypes:" (obj_id as ptr, val as Ptr)
			  mediaTypes_(self,value)
			End Set
		#tag EndSetter
		mediaTypes As Foundation.NSArray
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		mediaURL As Foundation.NSURL
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mparentViewController As iOSView
	#tag EndProperty

	#tag Property, Flags = &h0
		originalImage As iOSImage
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function showsCameraControls_ lib UIKitLib selector "showsCameraControls" (obj_id as ptr) as Boolean
			  Return showsCameraControls_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub showsCameraControls_ lib UIKitLib selector "setShowsCameraControls:" (obj_id as ptr, showsCameraControls as Boolean)
			  showsCameraControls_(self, value)
			End Set
		#tag EndSetter
		showsCameraControls As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sourceType_ lib UIKitLib selector "sourceType" (obj_id as ptr) as Source
			  Return (sourceType_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub sourceType_ lib UIKitLib selector "setSourceType:" (obj_id as ptr, sourceType as Source)
			  sourceType_(self, value)
			End Set
		#tag EndSetter
		sourceType As Source
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoMaximumDuration_ lib UIKitLib selector "videoMaximumDuration" (obj_id as ptr) as Double
			  Return videoMaximumDuration_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoMaximumDuration_ lib UIKitLib selector "setVideoMaximumDuration:" (obj_id as ptr, videoMaximumDuration as Double)
			  videoMaximumDuration_(self, value)
			End Set
		#tag EndSetter
		videoMaximumDuration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoQuality_ lib UIKitLib selector "videoQuality" (obj_id as ptr) as UIImagePickerControllerQualityType
			  Return (videoQuality_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoQuality_ lib UIKitLib selector "setVideoQuality:" (obj_id as ptr, videoQuality as UIImagePickerControllerQualityType)
			  videoQuality_(self, value)
			End Set
		#tag EndSetter
		videoQuality As UIImagePickerControllerQualityType
	#tag EndComputedProperty


	#tag Constant, Name = kUTTypeImage, Type = Text, Dynamic = False, Default = \"public.image", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUTTypeMovie, Type = Text, Dynamic = False, Default = \"public.movie", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIImagePickerControllerEditedImage, Type = Text, Dynamic = False, Default = \"UIImagePickerControllerEditedImage", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIImagePickerControllerMediaType, Type = Text, Dynamic = False, Default = \"UIImagePickerControllerMediaType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIImagePickerControllerMediaURL, Type = Text, Dynamic = False, Default = \"UIImagePickerControllerMediaURL", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIImagePickerControllerOriginalImage, Type = Text, Dynamic = False, Default = \"UIImagePickerControllerOriginalImage", Scope = Public
	#tag EndConstant


	#tag Enum, Name = Source, Type = Integer, Flags = &h0
		Camera = 1
		  PhotoLibrary = 0
		SavedPhotoAlbum = 2
	#tag EndEnum

	#tag Enum, Name = UIImagePickerControllerCameraCaptureMode, Type = Integer, Flags = &h0
		Photo = 0
		Video = 1
	#tag EndEnum

	#tag Enum, Name = UIImagePickerControllerCameraDevice, Type = Integer, Flags = &h0
		Rear = 0
		Front = 1
	#tag EndEnum

	#tag Enum, Name = UIImagePickerControllerCameraFlashMode, Type = Integer, Flags = &h0
		Off = -1
		  Auto = 0
		On = 1
	#tag EndEnum

	#tag Enum, Name = UIImagePickerControllerQualityType, Type = Integer, Flags = &h0
		High = 0
		  Medium = 1
		  Low = 2
		  Type640x480 = 3
		  IFrame1280x720 = 4
		IFrame960x540 = 5
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="allowsEditing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cameraCaptureMode"
			Group="Behavior"
			Type="UIImagePickerControllerCameraCaptureMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Photo"
				"1 - Video"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="cameraDevice"
			Group="Behavior"
			Type="UIImagePickerControllerCameraDevice"
			EditorType="Enum"
			#tag EnumValues
				"0 - Rear"
				"1 - Front"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="cameraFlashMode"
			Group="Behavior"
			Type="UIImagePickerControllerCameraFlashMode"
			EditorType="Enum"
			#tag EnumValues
				"-1 - Off"
				"0 - Auto"
				"1 - On"
			#tag EndEnumValues
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
			Name="showsCameraControls"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sourceType"
			Group="Behavior"
			Type="Source"
			EditorType="Enum"
			#tag EnumValues
				"1 - Camera"
				"0 - PhotoLibrary"
				"2 - SavedPhotoAlbum"
			#tag EndEnumValues
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
		#tag ViewProperty
			Name="videoMaximumDuration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoQuality"
			Group="Behavior"
			Type="UIImagePickerControllerQualityType"
			EditorType="Enum"
			#tag EnumValues
				"0 - High"
				"1 - Medium"
				"2 - Low"
				"3 - Type640x480"
				"4 - IFrame1280x720"
				"5 - IFrame960x540"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
