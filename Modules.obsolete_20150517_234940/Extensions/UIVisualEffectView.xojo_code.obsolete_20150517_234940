#tag Class
Protected Class UIVisualEffectView
Inherits iOSUserControl
	#tag Event
		Function CreateView() As UInteger
		  declare function initWithEffect lib UIKitLib selector "initWithEffect:" (obj_id as ptr, effect as ptr) as ptr
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  dim selfRef as ptr = initWithEffect(alloc(NSClassFromString("UIVisualEffectView")), DefaultEffect)
		  
		  Return UInteger(selfRef)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddControl(child As iOSControl)
		  declare sub addSubview lib UIKitLib selector "addSubview:" (obj_id as ptr, subview as ptr)
		  addSubview(self.ContentView, child.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveControl(child As iOSControl)
		  declare sub removeFromSuperview lib UIKitLib selector "removeFromSuperview" (obj_id as ptr)
		  removeFromSuperview(child.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function ContentView_ lib UIKitLib selector "contentView" (obj_id as ptr) as ptr
			  Return ContentView_(self.Handle)
			End Get
		#tag EndGetter
		ContentView As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mDefaultEffect = nil then
			    using Extensions
			    mDefaultEffect = UIVibrancyEffect.EffectForBlurEffect(UIBlurEffect.EffectWithStyle(UIBlurEffect.BlurEffectStyle.Light))
			  end if
			  Return mDefaultEffect
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaultEffect = value
			End Set
		#tag EndSetter
		Shared DefaultEffect As Extensions.UIVisualEffect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function effect_ lib UIKitLib selector "effect" (obj_id as ptr) as ptr
			  Return new UIVisualEffect(effect_(self.Handle))
			End Get
		#tag EndGetter
		Effect As Extensions.UIVisualEffect
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mDefaultEffect As Extensions.UIVisualEffect
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityHint"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
