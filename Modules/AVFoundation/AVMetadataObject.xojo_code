#tag Class
Protected Class AVMetadataObject
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVMetadataObject")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target32Bit
			    declare function bounds_ lib AVFoundationLib selector "bounds" (obj_id as ptr) as NSRect32
			  #elseif Target64Bit
			    declare function bounds_ lib AVFoundationLib selector "bounds" (obj_id as ptr) as NSRect64
			  #Endif
			  Return bounds_(self)
			End Get
		#tag EndGetter
		bounds As NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function duration_ lib AVFoundationLib selector "duration" (obj_id as ptr) as CMTime
			  Return (duration_(self))
			End Get
		#tag EndGetter
		duration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function time_ lib AVFoundationLib selector "time" (obj_id as ptr) as CMTime
			  Return time_(self)
			End Get
		#tag EndGetter
		time As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function type_ lib AVFoundationLib selector "type" (obj_id as ptr) as CFStringRef
			  Return type_(self)
			End Get
		#tag EndGetter
		type As Text
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
		#tag ViewProperty
			Name="type"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
