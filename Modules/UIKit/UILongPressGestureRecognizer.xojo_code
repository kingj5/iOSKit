#tag Class
Class UILongPressGestureRecognizer
Inherits UIGestureRecognizer
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(subclassName as Text) -- From UIGestureRecognizer
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor("UILongPressGestureRecognizer")
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target32Bit
			    declare function allowableMovement_ lib UIKitLib selector "allowableMovement" (obj_id as ptr) as Single
			  #Elseif Target64Bit
			    declare function allowableMovement_ lib UIKitLib selector "allowableMovement" (obj_id as ptr) as Single
			  #Endif
			  Return allowableMovement_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    declare sub allowableMovement_ lib UIKitLib selector "setAllowableMovement:" (obj_id as ptr, allowableMovement as Single)
			  #Elseif Target64Bit
			    declare sub allowableMovement_ lib UIKitLib selector "setAllowableMovement:" (obj_id as ptr, allowableMovement as Double)
			  #Endif
			  allowableMovement_(self, value)
			End Set
		#tag EndSetter
		allowableMovement As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function minimumPressDuration_ lib UIKitLib selector "minimumPressDuration" (obj_id as ptr) as Double
			  Return minimumPressDuration_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub minimumPressDuration_ lib UIKitLib selector "setMinimumPressDuration:" (obj_id as ptr, minimumPressDuration as Double)
			  minimumPressDuration_(self, value)
			End Set
		#tag EndSetter
		minimumPressDuration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function numberOfTapsRequired_ lib UIKitLib  selector "numberOfTapsRequired" (obj_id as ptr) as UInteger
			  Return numberOfTapsRequired_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub numberOfTapsRequired_ lib UIKitLib selector "setNumberOfTapsRequired:" (obj_id as ptr, numberOfTapsRequired as UInteger)
			  numberOfTapsRequired_(self, value)
			End Set
		#tag EndSetter
		numberOfTapsRequired As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function numberOfTouchesRequired_ lib UIKitLib selector "numberOfTouchesRequired" (obj_id as ptr) as UInteger
			  Return numberOfTouchesRequired_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub numberOfTouchesRequired_ lib UIKitLib selector "setNumberOfTouchesRequired:" (obj_id as ptr, numberOfTouchesRequired as UInteger)
			  numberOfTouchesRequired_(self, value)
			End Set
		#tag EndSetter
		numberOfTouchesRequired As UInteger
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="allowableMovement"
			Group="Behavior"
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
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="minimumPressDuration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="numberOfTapsRequired"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="numberOfTouchesRequired"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="state"
			Group="Behavior"
			Type="TouchState"
			EditorType="Enum"
			#tag EnumValues
				"3 - Ended"
				"1 - Began"
				"2 - Changed"
			#tag EndEnumValues
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
