#tag Class
Protected Class GKSavedGame
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKSavedGame")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDataWithCompletionHandler(handler as NSDataCompletionHandler)
		  declare sub loadDataWithCompletionHandler_ lib GameKitLib selector "loadDataWithCompletionHandler:" (obj_id as ptr, handler as ptr)
		  dim wrapper as new NSDataCompletionHandlerWrapper(handler)
		  dim blk as new iOSBlock(AddressOf wrapper.handler)
		  loadDataWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function deviceName_ lib GameKitLib selector "deviceName" (obj_id as ptr) as CFStringRef
			  Return deviceName_(self)
			End Get
		#tag EndGetter
		deviceName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function modificationDate_ lib GameKitLib selector "modificationDate" (obj_id as ptr) as ptr
			  Return new NSDate(modificationDate_(self))
			End Get
		#tag EndGetter
		modificationDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function name_ lib GameKitLib selector "name" (obj_id as ptr) as CFStringRef
			  Return name_(self)
			End Get
		#tag EndGetter
		name As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="deviceName"
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
			Name="name"
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
