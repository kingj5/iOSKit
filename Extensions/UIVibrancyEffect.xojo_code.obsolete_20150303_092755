#tag Class
Protected Class UIVibrancyEffect
Inherits Extensions.UIVisualEffect
	#tag Method, Flags = &h0
		 Shared Function EffectForBlurEffect(blurEffect as Extensions.UIBlurEffect) As Extensions.UIVisualEffect
		  declare function effectWithBlurEffect_ lib UIKitLib selector "effectForBlurEffect:" (clsRef as ptr, effect as ptr) as ptr
		  Return new UIVibrancyEffect(effectWithBlurEffect_(NSClassFromString("UIVibrancyEffect"),blurEffect))
		End Function
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
