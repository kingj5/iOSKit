#tag Class
Class NSRect
	#tag Method, Flags = &h0
		Sub Constructor()
		  origin = new NSPoint
		  rsize = new NSSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(x as Double, y as Double, w as Double, h as Double)
		  origin = new NSPoint(x,y)
		  rsize = new NSSize(w,h)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other as NSRect32)
		  origin = other.origin
		  rsize = other.rsize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other as NSRect64)
		  origin = other.origin
		  rsize = other.rsize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value32() As NSRect32
		  dim result as NSRect32
		  result.origin = self.origin.Value32
		  result.rsize = self.rsize.value32
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value64() As NSRect64
		  dim result as NSRect64
		  result.origin = self.origin.value64
		  result.rsize = self.rsize.value64
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		origin As NSPoint
	#tag EndProperty

	#tag Property, Flags = &h0
		rsize As NSSize
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
