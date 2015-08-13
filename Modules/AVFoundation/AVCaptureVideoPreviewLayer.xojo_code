#tag Class
Protected Class AVCaptureVideoPreviewLayer
Inherits QuartzCore.CALayer
	#tag Method, Flags = &h0
		Function CaptureDevicePointOfInterestForPoint(pointInLayer as NSPoint) As NSPoint
		  #if Target32Bit
		    declare function captureDevicePointOfInterestForPoint_ lib AVFoundationLib selector "captureDevicePointOfInterestForPoint:" (obj_id as ptr, pointInLayer as NSPoint32) as NSPoint32
		    Return captureDevicePointOfInterestForPoint_(self, pointInLayer.Value32)
		  #elseif Target64Bit
		    declare function captureDevicePointOfInterestForPoint_ lib AVFoundationLib selector "captureDevicePointOfInterestForPoint:" (obj_id as ptr, pointInLayer as NSPoint64) as NSPoint64
		    Return captureDevicePointOfInterestForPoint_(self, pointInLayer.Value64)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureVideoPreviewLayer")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(session as AVCaptureSession)
		  declare function initWithSession_ lib AVFoundationLib selector "initWithSession:" (obj_id as ptr, session as ptr) as ptr
		  Super.Constructor( initWithSession_(Allocate(ClassRef), session) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LayerWithSession(session as AVCaptureSession) As AVFoundation.AVCaptureVideoPreviewLayer
		  declare function layerWithSession_ lib AVFoundationLib selector "layerWithSession:" (clsRef as ptr, session as ptr) as ptr
		  Return new AVCaptureVideoPreviewLayer(layerWithSession_(ClassRef, session))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LayerWithSessionWithNoConnection(session as AVCaptureSession) As AVFoundation.AVCaptureVideoPreviewLayer
		  declare function layerWithSessionWithNoConnection_ lib AVFoundationLib selector "layerWithSessionWithNoConnection:" (clsRef as ptr, session as ptr) as ptr
		  Return new AVCaptureVideoPreviewLayer(layerWithSessionWithNoConnection_(ClassRef, session))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetadataOutputRectOfInterestForRect(rectInLayerCoordinates as NSRect) As NSRect
		  #if Target32Bit
		    declare function metadataOutputRectOfInterestForRect_ lib AVFoundationLib selector "metadataOutputRectOfInterestForRect:" (obj_id as ptr, rectInLayerCoordinates as NSRect32) as NSRect32
		    Return metadataOutputRectOfInterestForRect_(self, rectInLayerCoordinates.Value32)
		  #elseif Target64Bit
		    declare function metadataOutputRectOfInterestForRect_ lib AVFoundationLib selector "metadataOutputRectOfInterestForRect:" (obj_id as ptr, rectInLayerCoordinates as NSRect64) as NSRect64
		    Return metadataOutputRectOfInterestForRect_(self, rectInLayerCoordinates.Value64)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PointForCaptureDevicePointOfInterest(captureDevicePointOfInterest as NSPoint) As NSPoint
		  #if Target32Bit
		    declare function pointForCaptureDevicePointOfInterest_ lib AVFoundationLib selector "pointForCaptureDevicePointOfInterest:" (obj_id as ptr, captureDevicePointOfInterest as NSPoint32) as NSPoint32
		    Return pointForCaptureDevicePointOfInterest_(self, captureDevicePointOfInterest.Value32)
		  #elseif Target64Bit
		    declare function pointForCaptureDevicePointOfInterest_ lib AVFoundationLib selector "pointForCaptureDevicePointOfInterest:" (obj_id as ptr, captureDevicePointOfInterest as NSPoint64) as NSPoint64
		    Return pointForCaptureDevicePointOfInterest_(self, captureDevicePointOfInterest.Value64)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RectForMetadataOutputRectOfInterest(rectInMetadataOutputCoordinates as NSRect) As NSRect
		  #if Target32Bit
		    declare function rectForMetadataOutputRectOfInterest_ lib AVFoundationLib selector "rectForMetadataOutputRectOfInterest:" (obj_id as ptr, rectInMetadataOutputCoordinates as NSRect32) as NSRect32
		    Return rectForMetadataOutputRectOfInterest_(self, rectInMetadataOutputCoordinates.Value32)
		  #Elseif Target64Bit
		    declare function rectForMetadataOutputRectOfInterest_ lib AVFoundationLib selector "rectForMetadataOutputRectOfInterest:" (obj_id as ptr, rectInMetadataOutputCoordinates as NSRect64) as NSRect64
		    Return rectForMetadataOutputRectOfInterest_(self, rectInMetadataOutputCoordinates.Value64)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSessionWithNoConnection(session as AVCaptureSession)
		  declare sub setSessionWithNoConnection_ lib AVFoundationLib selector "setSessionWithNoConnection:" (obj_id as ptr, session as ptr)
		  setSessionWithNoConnection_(self, session)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TransformedMetadataObjectForMetadataObject(metadataObject as AVMetadataObject) As AVMetadataObject
		  declare function transformedMetadataObjectForMetadataObject_ lib AVFoundationLib selector "transformedMetadataObjectForMetadataObject:" (obj_id as ptr, metadataObject as ptr) as ptr
		  Return new AVMetadataObject(transformedMetadataObjectForMetadataObject_(self, metadataObject))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function connection_ lib AVFoundationLib selector "connection" (obj_id as ptr) as ptr
			  Return new AVCaptureConnection(connection_(self))
			End Get
		#tag EndGetter
		connection As AVCaptureConnection
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function session_ lib AVFoundationLib selector "session" (obj_id as ptr) as ptr
			  Return new AVCaptureSession(session_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub session_ lib AVFoundationLib selector "setSession:" (obj_id as ptr, session as ptr)
			  session_(self, value)
			End Set
		#tag EndSetter
		session As AVCaptureSession
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoGravity_ lib AVFoundationLib selector "videoGravity" (obj_id as ptr) as CFStringRef
			  Return videoGravity_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoGravity_ lib AVFoundationLib selector "setVideoGravity:" (obj_id as ptr, videoGravity as CFStringRef)
			  videoGravity_(self, value)
			End Set
		#tag EndSetter
		videoGravity As Text
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
			Name="videoGravity"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
