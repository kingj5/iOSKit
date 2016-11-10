#tag Class
Class UIDevice
Inherits NSObject
	#tag CompatibilityFlags = ( TargetIOS )
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  LoadLibraries()
		  // Calling the overridden superclass constructor.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor(obj as ptr)
		  LoadLibraries()
		  // Calling the overridden superclass constructor.
		  Super.Constructor(obj)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function currentDevice() As UIDevice
		  dim cls as ptr = NSClassFromString("UIDevice")
		  
		  declare function currentDevice_ lib UIKitLib selector "currentDevice" (c as Ptr) as Ptr
		  
		  dim inst2 as ptr = currentDevice_(cls)
		  
		  dim obj as new UIDevice(inst2)
		  
		  return obj
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadLibraries()
		  Declare Function dlopen Lib "/usr/lib/libSystem.dylib" ( name As CString, flags As Int32 ) As Ptr
		  call dlopen("/System/Library/Frameworks/UIKit.framework/UIKit",5)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function getIdentifier lib UIKitLib selector "identifierForVendor" (obj as ptr) as ptr
			  
			  dim v as ptr = getIdentifier(self.ID)
			  
			  dim n as new NSUUID(v)
			  
			  return n.UUIDString
			End Get
		#tag EndGetter
		identifierForVendor As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function getLocalizedModel lib UIKitLib selector "localizedModel" (obj as ptr) as ptr
			  dim p as ptr = getLocalizedModel(self.ID)
			  
			  dim nss as new NSString(p)
			  
			  dim txt as text = nss.UTF8String
			  
			  return txt
			End Get
		#tag EndGetter
		LocalizedModel As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function getModel lib UIKitLib selector "model" (obj as ptr) as ptr
			  dim p as ptr = getModel(self.ID)
			  
			  dim nss as new NSString(p)
			  
			  dim txt as text = nss.UTF8String
			  
			  return txt
			End Get
		#tag EndGetter
		Model As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function isMultitaskingSupported lib UIKitLib selector "getIsMultitaskingSupported" (obj as ptr) as Boolean
			  return isMultitaskingSupported(self.ID)
			End Get
		#tag EndGetter
		MultitaskingSupported As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function getName lib UIKitLib selector "name" (obj as ptr) as ptr
			  dim p as ptr = getName(self.ID)
			  
			  dim nss as new NSString(p)
			  
			  dim txt as text = nss.UTF8String
			  
			  return txt
			End Get
		#tag EndGetter
		Name As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function getSystemName lib UIKitLib selector "systemName" (obj as ptr) as ptr
			  dim p as ptr = getSystemName(self.ID)
			  
			  dim nss as new NSString(p)
			  
			  dim txt as text = nss.UTF8String
			  
			  return txt
			End Get
		#tag EndGetter
		SystemName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function getSystemVersion lib UIKitLib selector "systemVersion" (obj as ptr) as ptr
			  dim p as ptr = getSystemVersion(self.ID)
			  
			  dim nss as new NSString(p)
			  
			  dim txt as text = nss.UTF8String
			  
			  return txt
			End Get
		#tag EndGetter
		SystemVersion As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function getUserInterfaceIdiom lib UIKitLib selector "userInterfaceIdiom" (obj as ptr) as UIUserInterfaceIdiom
			  
			  return getUserInterfaceIdiom(self.ID)
			End Get
		#tag EndGetter
		UserInterfaceIdiom As UIUserInterfaceIdiom
	#tag EndComputedProperty


	#tag Enum, Name = UIUserInterfaceIdiom, Type = Integer, Flags = &h0
		Unspecified = -1
		  Phone
		Pad
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="identifierForVendor"
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
			Name="LocalizedModel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Model"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MultitaskingSupported"
			Group="Behavior"
			Type="Boolean"
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
			Name="SystemName"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SystemVersion"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserInterfaceIdiom"
			Group="Behavior"
			Type="UIUserInterfaceIdiom"
			EditorType="Enum"
			#tag EnumValues
				"-1 - Unspecified"
				"0 - Phone"
				"1 - Pad"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
