#tag Class
Class UISelectionFeedbackGenerator
Inherits UIFeedbackGenerator
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From UIFeedbackGenerator
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  
		  
		  Super.Constructor(initialize(Allocate(NSClassFromString("UISelectionFeedbackGenerator"))))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54726967676572732073656C656374696F6E20666565646261636B2E
		Sub SelectionChanged()
		  
		  Declare Sub SelectionChanged_ Lib UIKitLib selector "selectionChanged" (obj_id As ptr)
		  
		  SelectionChanged_(self.id)
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
