#tag Class
Class NSObject
	#tag Method, Flags = &h0
		 Shared Function Allocate(clsRef as ptr) As ptr
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  Return alloc(clsRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ref as ptr)
		  declare function retain lib UIKitLib selector "retain" (obj_id as ptr) as ptr
		  m_id = retain(ref)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  declare sub release lib UIKitLib selector "release" (obj_id as ptr)
		  release(m_id)
		  
		  if needsExtraRelease then release(m_id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function id() As ptr
		  Return self.m_id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Initialize(obj_id as ptr) As ptr
		  declare function init lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  Return init(obj_id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isNil() As Boolean
		  dim p as Ptr = self.id
		  Return p = nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As ptr
		  return self.id
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private m_id As ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected needsExtraRelease As Boolean = false
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
