#tag Class
Protected Class AVCaptureDeviceInput
Inherits AVFoundation.AVCaptureInput
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureDeviceInput")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(device as AVCaptureDevice, byref outError as NSError)
		  declare function initWithDevice_ lib AVFoundationLib selector "initWithDevice:error:" (obj_id as ptr, device as ptr, byref outError as ptr) as ptr
		  dim err as ptr
		  Super.Constructor( initWithDevice_(Allocate(ClassRef), device, err) )
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DeviceInputWithDeviceError(device as AVCaptureDevice, byref outError as NSError) As AVFoundation.AVCaptureDeviceInput
		  declare function deviceInputWithDevice_ lib AVFoundationLib selector "deviceInputWithDevice:error:" (clsRef as ptr, device as ptr, byref outError as ptr) as ptr
		  dim err as ptr
		  dim result as new AVCaptureDeviceInput(deviceInputWithDevice_(ClassRef, device, err))
		  
		  if err <> nil then
		    outError = new NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function device_ lib AVFoundationLib selector "device" (obj_id as ptr) as ptr
			  Return new AVCaptureDevice(device_(self))
			End Get
		#tag EndGetter
		device As AVCaptureDevice
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
