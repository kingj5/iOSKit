#tag Class
Class UIInterpolatingMotionEffect
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIInterpolatingMotionEffect")
		  return ref
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path As String, type As EffectType)
		  
		  declare function initWithKeyPathType lib UIKitLib selector "initWithKeyPath:type:" (obj as ptr, keypath as CFStringRef, tp As EffectType) as ptr
		  
		  super.Constructor(initWithKeyPathType(nsobject.Allocate(ClassRef), path, type))
		End Sub
	#tag EndMethod


	#tag Note, Name = HOWTO
		
		
		// Set vertical effect
		Dim verticalMotionEffect as new UIInterpolatingMotionEffect("center.y", UIInterpolatingMotionEffect.EffectType.TiltAlongVerticalAxis)
		
		verticalMotionEffect.minimumRelativeValue = -20
		verticalMotionEffect.maximumRelativeValue = 20
		
		// Set horizontal effect 
		Dim horizontalMotionEffect as new UIInterpolatingMotionEffect("center.x", UIInterpolatingMotionEffect.EffectType.TiltAlongHorizontalAxis)
		
		horizontalMotionEffect.minimumRelativeValue = -20
		horizontalMotionEffect.maximumRelativeValue = 20
		
		
		// Create group to combine both
		dim effectGroup as new UIMotionEffectGroup
		
		Dim effects As Foundation.NSArray
		effects = Array(verticalMotionEffect, horizontalMotionEffect)
		
		effectGroup.SetMotionEffects(effects)
		
		
		declare sub addMotionEffect lib UIKitLib selector "addMotionEffect:" (obj as ptr, effect as ptr)
		
		addMotionEffect(ImageViewer1.Handle, effectGroup)
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  
			  Declare sub setmaximumRelativeValue lib UIKitLib Selector "setMaximumRelativeValue:" (obj as ptr, value as ptr)
			  
			  'Dim mb As new MemoryBlock(1)
			  'mb.Byte(0) = value
			  
			  setmaximumRelativeValue(self, new NSNumber(value))
			End Set
		#tag EndSetter
		maximumRelativeValue As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  
			  Declare sub setMinimumRelativeValue lib UIKitLib Selector "setMinimumRelativeValue:" (obj as ptr, value as ptr)
			  
			  'Dim mb As new MemoryBlock(1)
			  'mb.Byte(0) = value
			  
			  Dim nvalue As new NSNumber(value)
			  
			  setMinimumRelativeValue(self, nvalue)
			End Set
		#tag EndSetter
		minimumRelativeValue As Integer
	#tag EndComputedProperty


	#tag Enum, Name = EffectType, Type = Integer, Flags = &h0
		tiltAlongHorizontalAxis
		tiltAlongVerticalAxis
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="minimumRelativeValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="maximumRelativeValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
