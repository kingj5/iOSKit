#tag Class
Protected Class AVCaptureOutput
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureOutput")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConnectionWithMediaType(mediaType as CFStringRef) As AVCaptureConnection
		  declare function connectionWithMediaType_ lib AVFoundationLib selector "connectionWithMediaType:" (obj_id as ptr, mediaType as CFStringRef) as ptr
		  Return new AVCaptureConnection(connectionWithMediaType_(self, mediaType))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetadataOutputRectOfInterestForRect(rectInOutputCoordinates as NSRect) As NSRect
		  #if Target32Bit
		    declare function metadataOutputRectOfInterestForRect_ lib AVFoundationLib selector "metadataOutputRectOfInterestForRect:" (obj_id as ptr, rectInOutputCoordinates as NSRect32) as NSRect32
		    Return metadataOutputRectOfInterestForRect_(self, rectInOutputCoordinates.Value32)
		  #Elseif Target64Bit
		    declare function metadataOutputRectOfInterestForRect_ lib AVFoundationLib selector "metadataOutputRectOfInterestForRect:" (obj_id as ptr, rectInOutputCoordinates as NSRect64) as NSRect64
		    Return metadataOutputRectOfInterestForRect_(self, rectInOutputCoordinates.Value64)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RectForMetadataOutputRectOfInterest(rectInMetadataOutputCoordinates as NSRect) As NSRect
		  #if Target32Bit
		    declare function rectForMetadataOutputRectOfInterest_ lib AVFoundationLib selector "rectForMetadataOutputRectOfInterest:" (obj_id as ptr, rectInMetadataOutputCoordinates as NSRect32) as NSRect32
		    Return rectForMetadataOutputRectOfInterest_(self, rectInMetadataOutputCoordinates.Value32)
		  #elseif Target64Bit
		    declare function rectForMetadataOutputRectOfInterest_ lib AVFoundationLib selector "rectForMetadataOutputRectOfInterest:" (obj_id as ptr, rectInMetadataOutputCoordinates as NSRect64) as NSRect64
		    Return rectForMetadataOutputRectOfInterest_(self, rectInMetadataOutputCoordinates.Value64)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TransformedMetadataObjectForMetadataObjectConnection(metadataObject as AVMetadataObject, connection as AVCaptureConnection) As AVMetadataObject
		  declare function transformedMetadataObjectForMetadataObject_ lib AVFoundationLib selector "transformedMetadataObjectForMetadataObject:connection:" (obj_id as ptr, metadataObject as ptr, connection as ptr) as ptr
		  Return new AVMetadataObject(transformedMetadataObjectForMetadataObject_(self, metadataObject, connection))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function connections_ lib AVFoundationLib selector "connections" (obj_id as ptr) as ptr
			  Return new NSArray(connections_(self))
			End Get
		#tag EndGetter
		connections As NSArray
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
