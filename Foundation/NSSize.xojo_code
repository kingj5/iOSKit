#tag Class
Class NSSize
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(w as Double, h as Double)
		  self.w = w
		  self.h = h
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other as NSSize32)
		  self.Constructor(other.w,other.h)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other as NSSize64)
		  self.Constructor(other.w,other.h)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value32() As NSSize32
		  dim result as NSSize32
		  result.w = self.w
		  result.h = self.h
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value64() As NSSize64
		  dim result as NSSize64
		  result.w = self.w
		  result.h = self.h
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		h As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		w As Double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="h"
			Group="Behavior"
			Type="Double"
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
			Name="w"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
