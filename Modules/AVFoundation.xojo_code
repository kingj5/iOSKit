#tag Module
Protected Module AVFoundation
	#tag Method, Flags = &h0
		Function AVStringConstant(constName as Text) As Text
		  Return Foundation.StringConstant("AVFoundation",constName)
		End Function
	#tag EndMethod


	#tag Constant, Name = AVFoundationLib, Type = Text, Dynamic = False, Default = \"AVFoundation.framework", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CMTime, Flags = &h0
		value as int64
		  timescale as int32
		  flags as uint32
		epoch as int64
	#tag EndStructure

	#tag Structure, Name = CMVideoDimensions, Flags = &h0
		width as int32
		height as int32
	#tag EndStructure


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
End Module
#tag EndModule
