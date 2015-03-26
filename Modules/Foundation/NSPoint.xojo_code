#tag Class
Class NSPoint
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(x as Double, y as Double)
		  self.x = x
		  self.y = y
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other as NSPoint32)
		  self.Constructor(other.x,other.y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other as NSPoint64)
		  self.Constructor(other.x,other.y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value32() As NSPoint32
		  dim result as NSPoint32
		  result.x = self.x
		  result.y = self.y
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value64() As NSPoint64
		  dim result as NSPoint64
		  result.x = self.x
		  result.y = self.y
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		x As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		y As Double
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
		#tag ViewProperty
			Name="x"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
