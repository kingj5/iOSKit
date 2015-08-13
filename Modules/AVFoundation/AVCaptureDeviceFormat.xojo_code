#tag Class
Protected Class AVCaptureDeviceFormat
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureDeviceFormat")
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

	#tag Method, Flags = &h0
		Function IsVideoStabilizationModeSupported(videoStabilizationMode as AVCaptureVideoStabilizationMode) As Boolean
		  declare function isVideoStabilizationModeSupported_ lib AVFoundationLib selector "isVideoStabilizationModeSupported:" (obj_id as ptr, videoStabilizationMode as AVCaptureVideoStabilizationMode) as Boolean
		  Return isVideoStabilizationModeSupported_(self, videoStabilizationMode)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function autoFocusSystem_ lib AVFoundationLib selector "autoFocusSystem" (obj_id as ptr) as AVCaptureAutoFocusSystem
			  Return (autoFocusSystem_(self))
			End Get
		#tag EndGetter
		autoFocusSystem As AVCaptureAutoFocusSystem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function highResolutionStillImageDimensions_ lib AVFoundationLib selector "highResolutionStillImageDimensions" (obj_id as ptr) as CMVideoDimensions
			  Return (highResolutionStillImageDimensions_(self))
			End Get
		#tag EndGetter
		highResolutionStillImageDimensions As CMVideoDimensions
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maxExposureDuration_ lib AVFoundationLib selector "maxExposureDuration" (obj_id as ptr) as CMTime
			  Return (maxExposureDuration_(self))
			End Get
		#tag EndGetter
		maxExposureDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maxISO_ lib AVFoundationLib selector "maxISO" (obj_id as ptr) as Double
			  Return (maxISO_(self))
			End Get
		#tag EndGetter
		maxISO As Double
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function minExposureDuration_ lib AVFoundationLib selector "minExposureDuration" (obj_id as ptr) as CMTime
			  Return (minExposureDuration_(self))
			End Get
		#tag EndGetter
		minExposureDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function minISO_ lib AVFoundationLib selector "minISO" (obj_id as ptr) as Double
			  Return (minISO_(self))
			End Get
		#tag EndGetter
		minISO As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoBinned_ lib AVFoundationLib selector "isVideoBinned" (obj_id as ptr) as Boolean
			  Return videoBinned_(self)
			End Get
		#tag EndGetter
		videoBinned As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoFieldOfView_ lib AVFoundationLib selector "videoFieldOfView" (obj_id as ptr) as Double
			  Return (videoFieldOfView_(self))
			End Get
		#tag EndGetter
		videoFieldOfView As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoHDRSupported_ lib AVFoundationLib selector "isVideoHDRSupported" (obj_id as ptr) as Boolean
			  Return videoHDRSupported_(self)
			End Get
		#tag EndGetter
		videoHDRSupported As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoMaxZoomFactor_ lib AVFoundationLib selector "videoMaxZoomFactor" (obj_id as ptr) as Double
			  Return videoMaxZoomFactor_(self)
			End Get
		#tag EndGetter
		videoMaxZoomFactor As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoSupportedFrameRateRanges_ lib AVFoundationLib selector "videoSupportedFrameRateRanges" (obj_id as ptr) as ptr
			  Return new NSArray(videoSupportedFrameRateRanges_(self))
			End Get
		#tag EndGetter
		videoSupportedFrameRateRanges As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoZoomFactorUpscaleThreshold_ lib AVFoundationLib selector "videoZoomFactorUpscaleThreshold" (obj_id as ptr) as Double
			  Return videoZoomFactorUpscaleThreshold_(self)
			End Get
		#tag EndGetter
		videoZoomFactorUpscaleThreshold As Double
	#tag EndComputedProperty


	#tag Enum, Name = AVCaptureAutoFocusSystem, Type = Integer, Flags = &h0
		None = 0
		  ContrastDetection = 1
		PhaseDetection = 2
	#tag EndEnum

	#tag Enum, Name = AVCaptureVideoStabilizationMode, Type = Integer, Flags = &h0
		Off = 0
		  Standard = 1
		  Cinematic = 2
		Auto = -1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="autoFocusSystem"
			Group="Behavior"
			Type="AVCaptureAutoFocusSystem"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - ContrastDetection"
				"2 - PhaseDetection"
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
			Name="maxISO"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mediaType"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="minISO"
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
			Name="videoBinned"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoFieldOfView"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoHDRSupported"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoMaxZoomFactor"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoZoomFactorUpscaleThreshold"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
