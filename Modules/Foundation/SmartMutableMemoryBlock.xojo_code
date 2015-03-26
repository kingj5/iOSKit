#tag Class
Class SmartMutableMemoryBlock
Inherits Xojo.Core.MutableMemoryBlock
	#tag Method, Flags = &h0
		Function UIntegerValue(offset as UInteger) As UInteger
		  #if Target32Bit
		    Return self.UInt32Value(offset)
		  #Elseif Target64Bit
		    Return self.UInt64Value(offset)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UIntegerValue(offset as UInteger, assigns value as Ptr)
		  #if Target32Bit
		    me.UInt32Value(offset) = UInt32(value)
		  #Elseif Target64Bit
		    me.UInt64Value(offset) = UInt64(value)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UIntegerValue(offset as UInteger, assigns value as UInteger)
		  #if Target32Bit
		    me.UInt32Value(offset) = value
		  #Elseif Target64Bit
		    me.UInt64Value(offset) = value
		  #Endif
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
			Name="LittleEndian"
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
