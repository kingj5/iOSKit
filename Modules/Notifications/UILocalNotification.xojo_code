#tag Class
Protected Class UILocalNotification
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UILocalNotification")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  super.Constructor(Initialize(Allocate(NSClassFromString("UILocalNotification"))))
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function alertAction_ lib UIKitLib selector "alertAction" (obj_id as ptr) as CFStringRef
			  Return alertAction_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub alertAction_ lib UIKitLib selector "setAlertAction:" (obj_id as ptr, alertAction as CFStringRef)
			  alertAction_(self, value)
			End Set
		#tag EndSetter
		alertAction As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function alertBody_ lib UIKitLib selector "alertBody" (obj_id as ptr) as CFStringRef
			  Return alertBody_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub alertBody_ lib UIKitLib selector "setAlertBody:" (obj_id as ptr, alertBody as CFStringRef)
			  alertBody_(self, value)
			End Set
		#tag EndSetter
		alertBody As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function alertLaunchImage_ lib UIKitLib selector "alertLaunchImage" (obj_id as ptr) as CFStringRef
			  Return alertLaunchImage_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub alertLaunchImage_ lib UIKitLib selector "setAlertLaunchImage:" (obj_id as ptr, alertLaunchImage as CFStringRef)
			  alertLaunchImage_(self, value)
			End Set
		#tag EndSetter
		alertLaunchImage As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function applicationIconBadgeNumber_ lib UIKitLib selector "applicationIconBadgeNumber" (obj_id as ptr) as Integer
			  Return applicationIconBadgeNumber_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub applicationIconBadgeNumber_ lib UIKitLib selector "setApplicationIconBadgeNumber:" (obj_id as ptr, applicationIconBadgeNumber as Integer)
			  applicationIconBadgeNumber_(self, value)
			End Set
		#tag EndSetter
		applicationIconBadgeNumber As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function category_ lib UIKitLib selector "category" (obj_id as ptr) as CFStringRef
			  Return category_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub category_ lib UIKitLib selector "setCategory:" (obj_id as ptr, category as CFStringRef)
			  category_(self, value)
			End Set
		#tag EndSetter
		category As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function fireDate_ lib UIKitLib selector "fireDate" (obj_id as ptr) as ptr
			  dim d as new NSDate(fireDate_(self))
			  dim result as xojo.Core.Date = d
			  Return result
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub fireDate_ lib UIKitLib selector "setFireDate:" (obj_id as ptr, fireDate as ptr)
			  fireDate_(self, new NSDate(value))
			End Set
		#tag EndSetter
		fireDate As xojo.core.Date
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hasAction_ lib UIKitLib selector "hasAction" (obj_id as ptr) as Boolean
			  Return hasAction_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub hasAction_ lib UIKitLib selector "setHasAction:" (obj_id as ptr, hasAction as Boolean)
			  hasAction_(self, value)
			End Set
		#tag EndSetter
		hasAction As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function soundName_ lib UIKitLib selector "soundName" (obj_id as ptr) as CFStringRef
			  Return soundName_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub soundName_ lib UIKitLib selector "setSoundName:" (obj_id as ptr, soundName as CFStringRef)
			  soundName_(self, value)
			End Set
		#tag EndSetter
		soundName As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function userInfo_ lib UIKitLib selector "userInfo" (obj_id as ptr) as ptr
			  Return new NSDictionary(userInfo_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub userInfo_ lib UIKitLib selector "setUserInfo:" (obj_id as ptr, userInfo as ptr)
			  userInfo_(self, value)
			End Set
		#tag EndSetter
		userInfo As NSDictionary
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="applicationIconBadgeNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasAction"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
