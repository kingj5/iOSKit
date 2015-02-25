#tag Class
Protected Class App
Inherits IOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Event
		Sub Open()
		  'using Extensions
		  'UIVisualEffectView.DefaultEffect = UIVibrancyEffect.EffectForBlurEffect(UIBlurEffect.EffectWithStyle(UIBlurEffect.BlurEffectStyle.Dark))
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(exc As RuntimeException) As Boolean
		  MsgBox "Exception", exc.Reason
		  Return True
		End Function
	#tag EndEvent


	#tag Constant, Name = TestBlue, Type = Color, Dynamic = False, Default = \"&c6DFFF6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TestWhite, Type = Color, Dynamic = False, Default = \"&cF6F6F6", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
