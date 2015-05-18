#tag Class
Private Class AVCaptureMovieFileOutput
Inherits AVFoundation.AVCaptureFileOutput
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureMovieFileOutput")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function metadata_ lib AVFoundationLib selector "metadata" (obj_id as ptr) as ptr
			  Return new NSArray(metadata_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub metadata_ lib AVFoundationLib selector "setMetadata:" (obj_id as ptr, metadata as ptr)
			  metadata_(self, value)
			End Set
		#tag EndSetter
		metadata As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function movieFragmentInterval_ lib AVFoundationLib selector "movieFragmentInterval" (obj_id as ptr) as CMTime
			  Return (movieFragmentInterval_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub movieFragmentInterval_ lib AVFoundationLib selector "setMovieFragmentInterval:" (obj_id as ptr, movieFragmentInterval as CMTime)
			  movieFragmentInterval_(self, value)
			End Set
		#tag EndSetter
		movieFragmentInterval As CMTime
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
