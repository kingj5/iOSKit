#tag Class
Class UITapGestureRecognizer
Inherits UIGestureRecognizer
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(subclassName as Text) -- From UIGestureRecognizer
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor("UITapGestureRecognizer")
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function numberOfTapsRequired_ lib UIKitLib selector "numberOfTapsRequired" _
			  (obj_id as ptr) as UInteger
			  Return numberOfTapsRequired_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setNumberOfTapsRequired lib UIKitLib selector "setNumberOfTapsRequired:" _
			  (obj_id as ptr, val as UInteger)
			  setNumberOfTapsRequired(self,value)
			End Set
		#tag EndSetter
		numberOfTapsRequired As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function numberOfTouchesRequired_ lib UIKitLib selector "numberOfTouchesRequired" _
			  (obj_id as ptr) as UInteger
			  Return numberOfTouchesRequired_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setNumberOfTouchesRequired lib UIKitLib selector "setNumberOfTouchesRequired:" _
			  (obj_id as ptr, val as UInteger)
			  setNumberOfTouchesRequired(self,value)
			End Set
		#tag EndSetter
		numberOfTouchesRequired As UInteger
	#tag EndComputedProperty


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
