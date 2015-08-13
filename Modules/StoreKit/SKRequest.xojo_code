#tag Class
Protected Class SKRequest
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Cancel()
		  declare sub cancel_ lib StoreKitLib selector "cancel" (obj_id as ptr)
		  cancel_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKRequest")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  declare sub start_ lib StoreKitLib selector "start" (obj_id as ptr)
		  start_(self)
		End Sub
	#tag EndMethod


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
