#tag Class
Protected Class AVAudioSessionPortDescription
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVAudioSessionPortDescription")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPreferredDataSource(dataSource as AVAudioSessionDataSourceDescription, byref outError as NSError) As Boolean
		  declare function setPreferredDataSource_ lib AVFoundationLib selector "setPreferredDataSource:error:" (obj_id as ptr, dataSource as ptr, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setPreferredDataSource_(self, dataSource, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function channels_ lib AVFoundationLib selector "channels" (obj_id as ptr) as ptr
			  Return new NSArray(channels_(self))
			End Get
		#tag EndGetter
		channels As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function dataSources_ lib AVFoundationLib selector "dataSources" (obj_id as ptr) as ptr
			  Return new NSArray(dataSources_(self))
			End Get
		#tag EndGetter
		dataSources As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function portName_ lib AVFoundationLib selector "portName" (obj_id as ptr) as CFStringRef
			  Return portName_(self)
			End Get
		#tag EndGetter
		portName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function portType_ lib AVFoundationLib selector "portType" (obj_id as ptr) as CFStringRef
			  Return portType_(self)
			End Get
		#tag EndGetter
		portType As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredDataSource_ lib AVFoundationLib selector "preferredDataSource" (obj_id as ptr) as ptr
			  Return new AVAudioSessionDataSourceDescription(preferredDataSource_(self))
			End Get
		#tag EndGetter
		preferredDataSource As AVAudioSessionDataSourceDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function selectedDataSource_ lib AVFoundationLib selector "selectedDataSource" (obj_id as ptr) as ptr
			  Return new AVAudioSessionDataSourceDescription(selectedDataSource_(self))
			End Get
		#tag EndGetter
		selectedDataSource As AVAudioSessionDataSourceDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function UID_ lib AVFoundationLib selector "UID" (obj_id as ptr) as CFStringRef
			  Return UID_(self)
			End Get
		#tag EndGetter
		UID As Text
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
			Name="portName"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="portType"
			Group="Behavior"
			Type="Text"
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
			Name="UID"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
