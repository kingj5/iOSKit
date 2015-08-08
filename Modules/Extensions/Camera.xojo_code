#tag Class
Protected Class Camera
	#tag Method, Flags = &h0
		Sub Close()
		  cam.dismiss
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  cam = new UIImagePickerController
		  AddHandler cam.PictureTaken, AddressOf HandlePictureTaken
		  AddHandler cam.Dismiss, AddressOf HandleDismiss
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDismiss(sender as UIKit.UIImagePickerController)
		  Rebuild
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePictureTaken(sender as UIKit.UIImagePickerController)
		  originalImage = cam.originalImage
		  editedImage = cam.editedImage
		  
		  RaiseEvent PictureTaken
		  
		  Rebuild
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Rebuild()
		  RemoveHandler cam.PictureTaken, AddressOf HandlePictureTaken
		  RemoveHandler cam.Dismiss, AddressOf HandleDismiss
		  
		  cam = nil
		  cam = new UIImagePickerController
		  cam.sourceType = SourceType
		  AddHandler cam.PictureTaken, AddressOf HandlePictureTaken
		  AddHandler cam.Dismiss, AddressOf HandleDismiss
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show(inView as iOSView)
		  if inView = nil then
		    Break //the view cannot be nil
		    Return
		  end if
		  
		  cam.PresentInView(inView)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event PictureTaken()
	#tag EndHook


	#tag Property, Flags = &h21
		Private cam As UIKit.UIImagePickerController
	#tag EndProperty

	#tag Property, Flags = &h0
		editedImage As iOSImage
	#tag EndProperty

	#tag Property, Flags = &h0
		originalImage As iOSImage
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return cam.sourceType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  cam.sourceType = value
			End Set
		#tag EndSetter
		SourceType As UIKit.UIImagePickerController.Source
	#tag EndComputedProperty


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
			Name="SourceType"
			Group="Behavior"
			Type="UIKit.UIImagePickerController.Source"
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
