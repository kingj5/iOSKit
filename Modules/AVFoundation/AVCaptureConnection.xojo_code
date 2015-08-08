#tag Class
Protected Class AVCaptureConnection
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureConnection")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ConnectionWithInputPortsOutput(ports as NSArray, output as AVCaptureOutput) As AVCaptureConnection
		  declare function connectionWithInputPorts_ lib AVFoundationLib selector "connectionWithInputPorts:output:" (clsRef as ptr, ports as ptr, output as ptr) as ptr
		  Return new AVCaptureConnection(connectionWithInputPorts_(ClassRef, ports, output))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ConnectionWithInputPortVideoPreviewLayer(port as AVCaptureInputPort, layer as AVCaptureVideoPreviewLayer) As AVCaptureConnection
		  declare function connectionWithInputPort_ lib AVFoundationLib selector "connectionWithInputPort:videoPreviewLayer:" (clsRef as ptr, port as ptr, layer as ptr) as ptr
		  Return new AVCaptureConnection(connectionWithInputPort_(ClassRef, port, layer))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(port as AVCaptureInputPort, layer as AVCaptureVideoPreviewLayer)
		  declare function initWithInputPort_ lib AVFoundationLib selector "initWithInputPort:videoPreviewLayer:" (obj_id as ptr, port as ptr, layer as ptr) as ptr
		  Super.Constructor( initWithInputPort_(Allocate(ClassRef), port, layer) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ports as NSArray, output as AVCaptureOutput)
		  declare function initWithInputPorts_ lib AVFoundationLib selector "initWithInputPorts:output:" (obj_id as ptr, ports as ptr, output as ptr) as ptr
		  Super.Constructor( initWithInputPorts_(Allocate(ClassRef), ports, output) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function active_ lib AVFoundationLib selector "isActive" (obj_id as ptr) as Boolean
			  Return active_(self)
			End Get
		#tag EndGetter
		active As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function audioChannels_ lib AVFoundationLib selector "audioChannels" (obj_id as ptr) as ptr
			  Return new NSArray(audioChannels_(self))
			End Get
		#tag EndGetter
		audioChannels As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function automaticallyAdjustsVideoMirroring_ lib AVFoundationLib selector "automaticallyAdjustsVideoMirroring" (obj_id as ptr) as Boolean
			  Return automaticallyAdjustsVideoMirroring_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub automaticallyAdjustsVideoMirroring_ lib AVFoundationLib selector "setAutomaticallyAdjustsVideoMirroring:" (obj_id as ptr, automaticallyAdjustsVideoMirroring as Boolean)
			  automaticallyAdjustsVideoMirroring_(self, value)
			End Set
		#tag EndSetter
		automaticallyAdjustsVideoMirroring As Boolean
	#tag EndComputedProperty

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
			  declare function inputPorts_ lib AVFoundationLib selector "inputPorts" (obj_id as ptr) as ptr
			  Return new NSArray(inputPorts_(self))
			End Get
		#tag EndGetter
		inputPorts As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function output_ lib AVFoundationLib selector "output" (obj_id as ptr) as ptr
			  Return new AVCaptureOutput(output_(self))
			End Get
		#tag EndGetter
		output As AVCaptureOutput
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function supportsVideoFieldMode_ lib AVFoundationLib selector "isVideoFieldModeSupported" (obj_id as ptr) as Boolean
			  Return supportsVideoFieldMode_(self)
			End Get
		#tag EndGetter
		supportsVideoFieldMode As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function supportsVideoMaxFrameDuration_ lib AVFoundationLib selector "isVideoMaxFrameDurationSupported" (obj_id as ptr) as Boolean
			  Return supportsVideoMaxFrameDuration_(self)
			End Get
		#tag EndGetter
		supportsVideoMaxFrameDuration As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function supportsVideoMinFrameDuration_ lib AVFoundationLib selector "isVideoMinFrameDurationSupported" (obj_id as ptr) as Boolean
			  Return supportsVideoMinFrameDuration_(self)
			End Get
		#tag EndGetter
		supportsVideoMinFrameDuration As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function supportsVideoMirroring_ lib AVFoundationLib selector "isVideoMirroringSupported" (obj_id as ptr) as Boolean
			  Return supportsVideoMirroring_(self)
			End Get
		#tag EndGetter
		supportsVideoMirroring As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function supportsVideoOrientation_ lib AVFoundationLib selector "isVideoOrientationSupported" (obj_id as ptr) as Boolean
			  Return supportsVideoOrientation_(self)
			End Get
		#tag EndGetter
		supportsVideoOrientation As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoFieldMode_ lib AVFoundationLib selector "videoFieldMode" (obj_id as ptr) as AVVideoFieldMode
			  Return (videoFieldMode_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoFieldMode_ lib AVFoundationLib selector "setVideoFieldMode:" (obj_id as ptr, videoFieldMode as AVVideoFieldMode)
			  videoFieldMode_(self, value)
			End Set
		#tag EndSetter
		videoFieldMode As AVVideoFieldMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoMaxFrameDuration_ lib AVFoundationLib selector "videoMaxFrameDuration" (obj_id as ptr) as CMTime
			  Return (videoMaxFrameDuration_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoMaxFrameDuration_ lib AVFoundationLib selector "setVideoMaxFrameDuration:" (obj_id as ptr, videoMaxFrameDuration as CMTime)
			  videoMaxFrameDuration_(self, value)
			End Set
		#tag EndSetter
		videoMaxFrameDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoMinFrameDuration_ lib AVFoundationLib selector "videoMinFrameDuration" (obj_id as ptr) as CMTime
			  Return (videoMinFrameDuration_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoMinFrameDuration_ lib AVFoundationLib selector "setVideoMinFrameDuration:" (obj_id as ptr, videoMinFrameDuration as CMTime)
			  videoMinFrameDuration_(self, value)
			End Set
		#tag EndSetter
		videoMinFrameDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoMirrored_ lib AVFoundationLib selector "isVideoMirrored" (obj_id as ptr) as Boolean
			  Return videoMirrored_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoMirrored_ lib AVFoundationLib selector "setVideoMirrored:" (obj_id as ptr, videoMirrored as Boolean)
			  videoMirrored_(self, value)
			End Set
		#tag EndSetter
		videoMirrored As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoOrientation_ lib AVFoundationLib selector "videoOrientation" (obj_id as ptr) as AVCaptureVideoOrientation
			  Return (videoOrientation_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoOrientation_ lib AVFoundationLib selector "setVideoOrientation:" (obj_id as ptr, videoOrientation as AVCaptureVideoOrientation)
			  videoOrientation_(self, value)
			End Set
		#tag EndSetter
		videoOrientation As AVCaptureVideoOrientation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoPreviewLayer_ lib AVFoundationLib selector "videoPreviewLayer" (obj_id as ptr) as ptr
			  Return new AVCaptureVideoPreviewLayer(videoPreviewLayer_(self))
			End Get
		#tag EndGetter
		videoPreviewLayer As AVCaptureVideoPreviewLayer
	#tag EndComputedProperty


	#tag Enum, Name = AVCaptureVideoOrientation, Type = Integer, Flags = &h0
		Portrait = 1
		  PortraitUpsideDown = 2
		  LandscapeRight = 3
		LandscapeLeft = 4
	#tag EndEnum

	#tag Enum, Name = AVVideoFieldMode, Type = Integer, Flags = &h0
		Both = 0
		  TopOnly = 1
		  BottomOnly = 2
		Deinterlace = 3
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="active"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="automaticallyAdjustsVideoMirroring"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="supportsVideoFieldMode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="supportsVideoMaxFrameDuration"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="supportsVideoMinFrameDuration"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="supportsVideoMirroring"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="supportsVideoOrientation"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoFieldMode"
			Group="Behavior"
			Type="AVVideoFieldMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Both"
				"1 - TopOnly"
				"2 - BottomOnly"
				"3 - Deinterlace"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoMirrored"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoOrientation"
			Group="Behavior"
			Type="AVCaptureVideoOrientation"
			EditorType="Enum"
			#tag EnumValues
				"1 - Portrait"
				"2 - PortraitUpsideDown"
				"3 - LandscapeRight"
				"4 - LandscapeLeft"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
