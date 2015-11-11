#tag Class
Protected Class UIUserNotificationSettings
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIUserNotificationSettings")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SettingsForTypesCategories(allowedUserNotificationTypes as integer, actionSettings as Foundation.NSSet) As UIUserNotificationSettings
		  declare function settingsForTypes_ lib UIKitLib selector "settingsForTypes:categories:" (clsRef as ptr, allowedUserNotificationTypes as Integer, actionSettings as ptr) as ptr
		  if actionSettings <> nil then
		    Return new UIUserNotificationSettings(settingsForTypes_(ClassRef, allowedUserNotificationTypes, actionSettings))
		  else
		    Return new UIUserNotificationSettings(settingsForTypes_(ClassRef, allowedUserNotificationTypes, nil))
		  end if
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function categories_ lib UIKitLib selector "categories" (obj_id as ptr) as ptr
			  Return new Foundation.NSSet(categories_(self))
			End Get
		#tag EndGetter
		categories As Foundation.NSSet
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare Function types lib UIKitLib selector "types" (obj_id as Ptr) as Integer
			  Return Types(self)
			End Get
		#tag EndGetter
		types As Integer
	#tag EndComputedProperty


	#tag Constant, Name = NotificationTypeAlert, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NotificationTypeBadge, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NotificationTypeNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NotificationTypeSound, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


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
			Name="types"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
