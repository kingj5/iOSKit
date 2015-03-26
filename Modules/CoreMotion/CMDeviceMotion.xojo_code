#tag Class
Class CMDeviceMotion
Inherits CMLogItem
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function acceleration_ lib CoreMotionLib selector "acceleration" (obj_id as ptr) as CMAcceleration
			  Return acceleration_(self)
			  
			End Get
		#tag EndGetter
		acceleration As CMAcceleration
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function gravity_ lib CoreMotionLib selector "gravity" (obj_id as ptr) as CMAcceleration
			  Return gravity_(self)
			  
			End Get
		#tag EndGetter
		gravity As CMAcceleration
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function rotationRate_ lib CoreMotionLib selector "rotationRate" (obj_id as ptr) as CMRotationRate
			  Return rotationRate_(self)
			  
			End Get
		#tag EndGetter
		rotationRate As CMRotationRate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function userAcceleration_ lib CoreMotionLib selector "userAcceleration" (obj_id as ptr) as CMAcceleration
			  Return userAcceleration_(self)
			  
			End Get
		#tag EndGetter
		userAcceleration As CMAcceleration
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
			Name="timeStamp"
			Group="Behavior"
			Type="Double"
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
