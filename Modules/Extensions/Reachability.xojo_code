#tag Class
Protected Class Reachability
	#tag Method, Flags = &h0
		Sub Constructor()
		  declare function SCNetworkReachabilityCreateWithName lib "SystemConfiguration" (allocator as ptr, str as CString) as ptr
		  dim t as Text = "captive.apple.com"
		  dim ReachabilityRef as Ptr = SCNetworkReachabilityCreateWithName(Nil, t.ToCString(xojo.Core.TextEncoding.UTF8))
		  
		  dim reachableFlags as UInt32
		  declare function SCNetworkReachabilityGetFlags lib "SystemConfiguration" (target as ptr, byref flags as UInt32) as Boolean
		  dim success as Boolean = SCNetworkReachabilityGetFlags(ReachabilityRef, reachableFlags)
		  if success then
		    ParseFlags(reachableFlags)
		  end if
		  Declare Sub CFRelease Lib "CoreFoundation" ( CFTypeRef As Ptr )
		  CFRelease( ReachabilityRef )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseFlags(flags as UInt32)
		  'dim cellularFlag as Boolean = if((flags and IsWWAN) <> 0,True,False)
		  dim reachableFlag as Boolean = if((flags and Reachable) <> 0,True,False)
		  'dim transientflag as Boolean = if((flags and TransientConnection) <> 0,True,False)
		  dim connectionRequiredFlag as Boolean = if((flags and ConnectionRequired) <> 0,True,False)
		  dim connectionOnTrafficFlag as Boolean = if((flags and ConnectionOnTraffic) <> 0,True,False)
		  dim interventionRequiredFlag as Boolean = if((flags and InterventionRequired) <> 0,True,False)
		  dim connectionOnDemandFlag as Boolean = if((flags and ConnectionOnDemand) <> 0,True,False)
		  'dim localAddressFlag as Boolean = if((flags and IsLocalAddress) <> 0,True,False)
		  'dim directFlag as Boolean = if((flags and IsDirect) <> 0,True,False)
		  
		  isNotReachable = (reachableFlag = False)
		  isReachableViaCellular = False
		  isReachable = False
		  isReachableViaWifi = False
		  if isNotReachable then
		    Return
		  end if
		  
		  isReachableViaWifi = (connectionRequiredFlag = False)
		  
		  if connectionOnDemandFlag or connectionOnTrafficFlag then
		    isReachableViaWifi = (interventionRequiredFlag = False)
		  end if
		  isReachableViaCellular = if((flags and IsWWAN) = IsWWAN, True, False)
		  
		  if isReachableViaCellular then
		    isReachableViaWifi = False
		  end if
		  
		  isReachable = (isReachableViaWifi or isReachableViaCellular)
		  isNotReachable = (isReachableViaWifi = False and isReachableViaCellular = False)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		isNotReachable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isReachable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isReachableViaCellular As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isReachableViaWifi As Boolean
	#tag EndProperty


	#tag Constant, Name = ConnectionOnDemand, Type = Double, Dynamic = False, Default = \"32", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ConnectionOnTraffic, Type = Double, Dynamic = False, Default = \"8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ConnectionRequired, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = InterventionRequired, Type = Double, Dynamic = False, Default = \"16", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IsDirect, Type = Double, Dynamic = False, Default = \"131072", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IsLocalAddress, Type = Double, Dynamic = False, Default = \"65536", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IsWWAN, Type = Double, Dynamic = False, Default = \"262144", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Reachable, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TransientConnection, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isNotReachable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isReachable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isReachableViaCellular"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isReachableViaWifi"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
