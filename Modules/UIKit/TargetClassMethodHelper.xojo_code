#tag Class
Protected Class TargetClassMethodHelper
	#tag Method, Flags = &h0
		Sub Constructor(selName as Text, impl as ptr, charCode as Text)
		  self.selName = selName
		  self.impl = impl
		  self.charCode = charCode
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		charCode As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		impl As Ptr
	#tag EndProperty

	#tag Property, Flags = &h0
		selName As Text
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="charCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
			Name="selName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
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
