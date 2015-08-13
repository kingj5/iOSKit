#tag Class
Protected Class AVCaptureInputPort
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureInputPort")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor( Initialize(Allocate(ClassRef)) )
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function enabled_ lib AVFoundationLib selector "isEnabled" (obj_id as ptr) as Boolean
			  Return enabled_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub enabled_ lib AVFoundationLib selector "setEnabled:" (obj_id as ptr, enabled as Boolean)
			  enabled_(self, value)
			End Set
		#tag EndSetter
		enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function input_ lib AVFoundationLib selector "input" (obj_id as ptr) as ptr
			  Return new AVCaptureInput(input_(self))
			End Get
		#tag EndGetter
		input As AVCaptureInput
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function mediaType_ lib AVFoundationLib selector "mediaType" (obj_id as ptr) as CFStringRef
			  Return mediaType_(self)
			End Get
		#tag EndGetter
		mediaType As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="enabled"
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
			Name="mediaType"
			Group="Behavior"
			Type="Text"
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
