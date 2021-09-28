#tag Class
Class UIAction
Inherits UIMenuElement
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("UIAction")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateWithTitleImage(title As String, image As Picture, handler As iOSBlock, identifier As String = "") As UIAction
		  
		  '+ (instancetype)actionWithTitle:(NSString *)title 
		  'image:(UIImage *)image 
		  'identifier:(UIActionIdentifier)identifier 
		  'handler:(UIActionHandler)handler;
		  
		  
		  Declare function actionWithTitle_ lib FoundationLib selector "actionWithTitle:image:identifier:handler:" _
		  (obj as ptr, title As CFStringRef, image as ptr, identifier as CFStringRef, handler as ptr) as ptr
		  
		  Dim action As UIAction
		  Dim imgHandle As Ptr
		  
		  if image <> nil then
		    imgHandle = image.Handle
		  end if
		  
		  if identifier.IsEmpty then
		    Return new UIAction(actionWithTitle_((ClassRef), title, imgHandle, nil, handler.Handle))
		  else
		    Return new UIAction(actionWithTitle_((ClassRef), title, imgHandle, identifier, handler.Handle))
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttributes(value As UInteger)
		  
		  Declare sub setAttributes_ lib "UIKit" selector "setAttributes:" (obj as ptr, value as UInteger)
		  
		  SetAttributes_(self, value)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Declare function identifier_ lib UIKitLib selector "identifier" (obj as ptr) as CFStringRef
			  
			  Return identifier_(self)
			End Get
		#tag EndGetter
		identifier As String
	#tag EndComputedProperty


	#tag Enum, Name = UIMenuElementAttributes, Type = Integer, Flags = &h0
		Disabled = 1
		  Destructive
		Hidden = 4
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="identifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
