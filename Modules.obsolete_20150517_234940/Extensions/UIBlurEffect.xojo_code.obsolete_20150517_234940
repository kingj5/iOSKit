#tag Class
Protected Class UIBlurEffect
Inherits Extensions.UIVisualEffect
	#tag Method, Flags = &h0
		 Shared Function EffectWithStyle(style as BlurEffectStyle) As Extensions.UIBlurEffect
		  declare function effectWithStyle_ lib UIKitLib selector "effectWithStyle:" (clsRef as ptr, style as BlurEffectStyle) as ptr
		  Return new UIBlurEffect(effectWithStyle_(NSClassFromString("UIBlurEffect"),style))
		End Function
	#tag EndMethod


	#tag Enum, Name = BlurEffectStyle, Type = Integer, Flags = &h0
		ExtraLight = 0
		  Light = 1
		Dark = 2
	#tag EndEnum


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
