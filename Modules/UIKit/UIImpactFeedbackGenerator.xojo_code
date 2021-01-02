#tag Class
Class UIImpactFeedbackGenerator
Inherits UIFeedbackGenerator
	#tag Method, Flags = &h0
		Sub Constructor(style As UIImpactFeedbackStyle)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From UIFeedbackGenerator
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  Declare Function initWithStyle Lib UIKitLib selector "initWithStyle:" (obj_id As ptr, st As UIImpactFeedbackStyle) as ptr
		  
		  
		  Super.Constructor(initWithStyle(Allocate(NSClassFromString("UIImpactFeedbackGenerator")), style))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 547269676765727320696D7061637420666565646261636B
		Sub ImpactOccurred()
		  
		  Declare Sub impactOccurred_ Lib UIKitLib selector "impactOccurred" (obj_id As ptr)
		  
		  impactOccurred_(Self.id)
		End Sub
	#tag EndMethod


	#tag Enum, Name = UIImpactFeedbackStyle, Type = Integer, Flags = &h0
		light = 0
		  medium
		heavy
	#tag EndEnum


	#tag ViewBehavior
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
