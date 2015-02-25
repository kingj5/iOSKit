#tag Class
Class UIImagePickerController
Inherits UINavigationController
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As ptr
		  Return NSClassFromString("UIImagePickerController")
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
		  SetDelegate(del)
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(del) = self
		  
		  
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
		  self.dismiss
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFinishPicking(infoDict as ptr)
		  declare function objectForKey lib FoundationLib selector "objectForKey:" (obj_id as ptr, key as CFStringRef) as ptr
		  originalImage = iOSImage.FromHandle(objectForKey(infoDict,UIImagePickerControllerOriginalImage))
		  dim edit as ptr = objectForKey(infoDict,UIImagePickerControllerEditedImage)
		  if edit <> nil then
		    editedImage = iOSImage.FromHandle(edit)
		  end if
		  
		  RaiseEvent PictureTaken
		  
		  self.dismiss
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didCancel(pid as ptr, sel as ptr, pickercontroller as ptr)
		  UIImagePickerController(dispatch.Value(pid)).HandleDidCancel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didFinishPickingMedia(pid as ptr, sel as ptr, pickercontroller as ptr, infoDict as ptr)
		  UIImagePickerController(dispatch.Value(pid)).HandleDidFinishPicking(infoDict)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(mView as iOSView)
		  declare sub presentViewController lib UIKitLib selector "presentViewController:animated:completion:" _
		  (obj_id as ptr, controller as ptr, animated as Boolean, completion as ptr)
		  presentViewController(mView.ViewControllerHandle, self, True, nil)
		  
		  mparentViewController = mView //get a reference to dismiss ourself
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate(del as ptr)
		  declare sub setDelegate lib UIKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
		  setDelegate(self.id, del)
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
		Event Dismiss()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PictureTaken()
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		editedImage As iOSImage
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
			  declare function sourceType_ lib UIKitLib selector "sourceType" (obj_id as ptr) as Source
			  Return sourceType_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if DebugBuild 
			    if value = Source.Camera then Break //camera source type is not available in the iOS simulator,
			    //it is only available in built apps
			    Return
			  #Endif
			  
			  Declare sub setSourceType lib UIKitLib selector "setSourceType:" (obj_id as ptr, type as Source)
			  setSourceType(self, value)
			End Set
		#tag EndSetter
		sourceType As Source
	#tag EndComputedProperty


	#tag Constant, Name = kUTTypeImage, Type = Text, Dynamic = False, Default = \"public.image", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUTTypeMovie, Type = Text, Dynamic = False, Default = \"public.movie", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIImagePickerControllerEditedImage, Type = Text, Dynamic = False, Default = \"UIImagePickerControllerEditedImage", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIImagePickerControllerMediaType, Type = Text, Dynamic = False, Default = \"UIImagePickerControllerMediaType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIImagePickerControllerOriginalImage, Type = Text, Dynamic = False, Default = \"UIImagePickerControllerOriginalImage", Scope = Public
	#tag EndConstant


	#tag Enum, Name = Source, Type = Integer, Flags = &h0
		Camera = 1
		  PhotoLibrary = 0
		SavedPhotoAlbum = 2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="automaticallyAdjustsScrollViewInsets"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="definesPresentationContext"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="editing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extendedLayoutIncludesOpaqueBars"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hidesBottomBarWhenPushed"
			Group="Behavior"
			Type="Boolean"
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
			Name="modalInPopover"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalPresentationCapturesStatusBarAppearance"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="providesPresentationContextTransitionStyle"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sourceType"
			Visible=true
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
	#tag EndViewBehavior
End Class
#tag EndClass
