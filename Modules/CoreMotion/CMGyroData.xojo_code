#tag Class
Class CMGyroData
Inherits CMLogItem
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function rotationRate_ lib CoreMotionLib selector "rotationRate" (obj_id as ptr) as CMRotationRate
			  Return rotationRate_(self)
			  
			End Get
		#tag EndGetter
		rotationRate As CMRotationRate
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="timeStamp"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
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
