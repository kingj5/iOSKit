#tag Class
Private Class AVCaptureAudioDataOutput
Inherits AVFoundation.AVCaptureOutput
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureAudioDataOutput")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecommendedAudioSettingsForAssetWriterWithOutputFileTypeAssetWriterInputWithMediaTypeOutputSettingsSourceFormatHint(outputFileType as CFStringRef, outputSettings as ptr) As NSDictionary
		  declare function recommendedAudioSettingsForAssetWriterWithOutputFileType_ lib AVFoundationLib selector "recommendedAudioSettingsForAssetWriterWithOutputFileType:assetWriterInputWithMediaType:outputSettings:sourceFormatHint:" (obj_id as ptr, outputFileType as CFStringRef, outputSettings as ptr) as ptr
		  Return new NSDictionary(recommendedAudioSettingsForAssetWriterWithOutputFileType_(self, outputFileType, outputSettings))
		  
		  //output settings as AVAssetWriterInput
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSampleBufferDelegateQueue(sampleBufferDelegate as ptr, sampleBufferCallbackQueue as ptr)
		  declare sub setSampleBufferDelegate_ lib AVFoundationLib selector "setSampleBufferDelegate:queue:" (obj_id as ptr, sampleBufferDelegate as ptr, sampleBufferCallbackQueue as ptr)
		  setSampleBufferDelegate_(self, sampleBufferDelegate, sampleBufferCallbackQueue)
		  
		  //param 1
		  //id < AVCaptureAudioDataOutputSampleBufferDelegate >
		  
		  //param 2
		  //dispatch_queue_t
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sampleBufferCallbackQueue_ lib AVFoundationLib selector "sampleBufferCallbackQueue" (obj_id as ptr) as ptr
			  Return (sampleBufferCallbackQueue_(self))
			End Get
		#tag EndGetter
		Attributes( dispatch_queue_t ) sampleBufferCallbackQueue As ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sampleBufferDelegate_ lib AVFoundationLib selector "sampleBufferDelegate" (obj_id as ptr) as ptr
			  Return (sampleBufferDelegate_(self))
			End Get
		#tag EndGetter
		sampleBufferDelegate As Ptr
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
