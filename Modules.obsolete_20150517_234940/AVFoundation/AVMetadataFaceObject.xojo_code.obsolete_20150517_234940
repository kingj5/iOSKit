#tag Class
Protected Class AVMetadataFaceObject
Inherits AVFoundation.AVMetadataObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVMetadataFaceObject")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function faceID_ lib AVFoundationLib selector "faceID" (obj_id as ptr) as Integer
			  Return faceID_(self)
			End Get
		#tag EndGetter
		faceID As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hasRollAngle_ lib AVFoundationLib selector "hasRollAngle" (obj_id as ptr) as Boolean
			  Return hasRollAngle_(self)
			End Get
		#tag EndGetter
		hasRollAngle As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hasYawAngle_ lib AVFoundationLib selector "hasYawAngle" (obj_id as ptr) as Boolean
			  Return hasYawAngle_(self)
			End Get
		#tag EndGetter
		hasYawAngle As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function rollAngle_ lib AVFoundationLib selector "rollAngle" (obj_id as ptr) as Double
			  Return rollAngle_(self)
			End Get
		#tag EndGetter
		rollAngle As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function yawAngle_ lib AVFoundationLib selector "yawAngle" (obj_id as ptr) as Double
			  Return yawAngle_(self)
			End Get
		#tag EndGetter
		yawAngle As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="faceID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasRollAngle"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasYawAngle"
			Group="Behavior"
			Type="Boolean"
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
			Name="rollAngle"
			Group="Behavior"
			Type="Double"
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
		#tag ViewProperty
			Name="type"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yawAngle"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
