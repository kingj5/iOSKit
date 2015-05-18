#tag Class
Protected Class EditableIOSImage
	#tag Method, Flags = &h0
		Sub Constructor(width as integer, height as integer, scale as Double = 1.0)
		  bitmap = new iOSBitmap(width,height,scale)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fromImage as iOSImage)
		  bitmap = new iOSBitmap(fromImage.Width,fromImage.Height,fromImage.Scale)
		  graphics.DrawImage fromImage,0,0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As ptr
		  Return self.bitmap.Image.Handle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Image() As iOSImage
		  Return self.bitmap.Image
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As iOSBitmap
		  Return bitmap
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As iOSImage
		  Return bitmap.Image
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected bitmap As iOSBitmap
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return bitmap.Graphics
			End Get
		#tag EndGetter
		graphics As iOSGraphics
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
