#tag Class
Class UISwipeGestureRecognizer
Inherits UIGestureRecognizer
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(subclassName as Text) -- From UIGestureRecognizer
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor("UISwipeGestureRecognizer")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(direction as SwipeDirection)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(subclassName as Text) -- From UIGestureRecognizer
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor("UISwipeGestureRecognizer")
		  self.direction = direction
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function direction_ lib UIKitLib selector "direction" (obj_id as ptr) as SwipeDirection
			  Return direction_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setDirection lib UIKitLib selector "setDirection:" (obj_id as ptr, direction as SwipeDirection)
			  setDirection(self,value)
			End Set
		#tag EndSetter
		direction As SwipeDirection
	#tag EndComputedProperty


	#tag Enum, Name = SwipeDirection, Type = Integer, Flags = &h0
		Right = 1
		  Left = 2
		  Up = 4
		Down = 8
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="direction"
			Visible=true
			Group="Behavior"
			Type="SwipeDirection"
			EditorType="Enum"
			#tag EnumValues
				"1 - Right"
				"2 - Left"
				"4 - Up"
				"8 - Down"
			#tag EndEnumValues
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="state"
			Group="Behavior"
			Type="TouchState"
			EditorType="Enum"
			#tag EnumValues
				"3 - Ended"
				"1 - Began"
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
