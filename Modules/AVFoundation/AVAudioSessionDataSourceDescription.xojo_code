#tag Class
Protected Class AVAudioSessionDataSourceDescription
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVAudioSessionDataSourceDescription")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPreferredPolarPattern(pattern as Text, byref outError as NSError) As Boolean
		  declare function setPreferredPolarPattern_ lib AVFoundationLib selector "setPreferredPolarPattern:error:" (obj_id as ptr, pattern as CFStringRef, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setPreferredPolarPattern_(self, pattern, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Note
			//NSNumber
		#tag EndNote
		#tag Getter
			Get
			  declare function dataSourceID_ lib AVFoundationLib selector "dataSourceID" (obj_id as ptr) as ptr
			  Return (dataSourceID_(self))
			End Get
		#tag EndGetter
		dataSourceID As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function dataSourceName_ lib AVFoundationLib selector "dataSourceName" (obj_id as ptr) as CFStringRef
			  Return dataSourceName_(self)
			End Get
		#tag EndGetter
		dataSourceName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function location_ lib AVFoundationLib selector "location" (obj_id as ptr) as CFStringRef
			  Return location_(self)
			End Get
		#tag EndGetter
		location As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function orientation_ lib AVFoundationLib selector "orientation" (obj_id as ptr) as CFStringRef
			  Return orientation_(self)
			End Get
		#tag EndGetter
		orientation As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredPolarPattern_ lib AVFoundationLib selector "preferredPolarPattern" (obj_id as ptr) as CFStringRef
			  Return preferredPolarPattern_(self)
			End Get
		#tag EndGetter
		preferredPolarPattern As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function selectedPolarPattern_ lib AVFoundationLib selector "selectedPolarPattern" (obj_id as ptr) as CFStringRef
			  Return selectedPolarPattern_(self)
			End Get
		#tag EndGetter
		selectedPolarPattern As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function supportedPolarPatterns_ lib AVFoundationLib selector "supportedPolarPatterns" (obj_id as ptr) as ptr
			  Return new NSArray(supportedPolarPatterns_(self))
			End Get
		#tag EndGetter
		supportedPolarPatterns As NSArray
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="dataSourceName"
			Group="Behavior"
			Type="Text"
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
			Name="location"
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
			Name="orientation"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="preferredPolarPattern"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="selectedPolarPattern"
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
	#tag EndViewBehavior
End Class
#tag EndClass
