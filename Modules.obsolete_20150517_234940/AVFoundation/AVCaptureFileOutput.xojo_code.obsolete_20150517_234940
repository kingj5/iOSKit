#tag Class
Private Class AVCaptureFileOutput
Inherits AVFoundation.AVCaptureOutput
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureFileOutput")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartRecordingToOutputFileURLRecordingDelegate(outputFileURL as NSURL, del as ptr)
		  declare sub startRecordingToOutputFileURL_ lib AVFoundationLib selector "startRecordingToOutputFileURL:recordingDelegate:" (obj_id as ptr, outputFileURL as ptr, del as ptr)
		  startRecordingToOutputFileURL_(self, outputFileURL, del)
		  
		  //del as id<AVCaptureFileOutputRecordingDelegate>
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopRecording()
		  declare sub stopRecording_ lib AVFoundationLib selector "stopRecording" (obj_id as ptr)
		  stopRecording_(self)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maxRecordedDuration_ lib AVFoundationLib selector "maxRecordedDuration" (obj_id as ptr) as CMTime
			  Return (maxRecordedDuration_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub maxRecordedDuration_ lib AVFoundationLib selector "setMaxRecordedDuration:" (obj_id as ptr, maxRecordedDuration as CMTime)
			  maxRecordedDuration_(self, value)
			End Set
		#tag EndSetter
		maxRecordedDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maxRecordedFileSize_ lib AVFoundationLib selector "maxRecordedFileSize" (obj_id as ptr) as Int64
			  Return (maxRecordedFileSize_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub maxRecordedFileSize_ lib AVFoundationLib selector "setMaxRecordedFileSize:" (obj_id as ptr, maxRecordedFileSize as Int64)
			  maxRecordedFileSize_(self, value)
			End Set
		#tag EndSetter
		maxRecordedFileSize As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function minFreeDiskSpaceLimit_ lib AVFoundationLib selector "minFreeDiskSpaceLimit" (obj_id as ptr) as Int64
			  Return (minFreeDiskSpaceLimit_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub minFreeDiskSpaceLimit_ lib AVFoundationLib selector "setMinFreeDiskSpaceLimit:" (obj_id as ptr, minFreeDiskSpaceLimit as Int64)
			  minFreeDiskSpaceLimit_(self, value)
			End Set
		#tag EndSetter
		minFreeDiskSpaceLimit As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function outputFileURL_ lib AVFoundationLib selector "outputFileURL" (obj_id as ptr) as ptr
			  Return new NSURL(outputFileURL_(self))
			End Get
		#tag EndGetter
		outputFileURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function recordedDuration_ lib AVFoundationLib selector "recordedDuration" (obj_id as ptr) as CMTime
			  Return (recordedDuration_(self))
			End Get
		#tag EndGetter
		recordedDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function recordedFileSize_ lib AVFoundationLib selector "recordedFileSize" (obj_id as ptr) as Int64
			  Return (recordedFileSize_(self))
			End Get
		#tag EndGetter
		recordedFileSize As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function recording_ lib AVFoundationLib selector "isRecording" (obj_id as ptr) as Boolean
			  Return recording_(self)
			End Get
		#tag EndGetter
		recording As Boolean
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
			Name="recording"
			Group="Behavior"
			Type="Boolean"
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
