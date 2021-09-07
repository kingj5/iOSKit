#tag Class
Class NSCharacterSet
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSCharacterSet")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function init(charactersIn As Text) As NSCharacterSet
		  
		  
		  
		  declare function init_ lib FoundationLib selector "init" (class_id as Ptr, aString as ptr) as Ptr
		  
		  dim stringRef as Ptr = init_(ClassRef, NSString.CreateWithString(charactersIn))
		  if stringRef <> nil then
		    return new NSCharacterSet(stringRef)
		  else
		    return nil
		  end if
		  
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
	#tag EndViewBehavior
End Class
#tag EndClass
