#tag Class
Protected Class SKProduct
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKProduct")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function downloadable_ lib StoreKitLib selector "isDownloadable" (obj_id as ptr) as Boolean
			  Return downloadable_(self)
			End Get
		#tag EndGetter
		downloadable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function downloadContentLengths_ lib StoreKitLib selector "downloadContentLengths" (obj_id as ptr) as ptr
			  Return new NSArray(downloadContentLengths_(self))
			End Get
		#tag EndGetter
		downloadContentLengths As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function downloadContentVersion_ lib StoreKitLib selector "downloadContentVersion" (obj_id as ptr) as CFStringRef
			  Return downloadContentVersion_(self)
			End Get
		#tag EndGetter
		downloadContentVersion As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function localizedDescription_ lib StoreKitLib selector "localizedDescription" (obj_id as ptr) as CFStringRef
			  Return localizedDescription_(self)
			End Get
		#tag EndGetter
		localizedDescription As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function localizedTitle_ lib StoreKitLib selector "localizedTitle" (obj_id as ptr) as CFStringRef
			  Return localizedTitle_(self)
			End Get
		#tag EndGetter
		localizedTitle As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function price_ lib StoreKitLib selector "price" (obj_id as ptr) as ptr
			  declare function doubleValue lib StoreKitLib selector "doubleValue" (obj_id as ptr) as Double
			  Return doubleValue(price_(self))
			End Get
		#tag EndGetter
		price As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function productIdentifier_ lib StoreKitLib selector "productIdentifier" (obj_id as ptr) as CFStringRef
			  Return productIdentifier_(self)
			End Get
		#tag EndGetter
		productIdentifier As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="downloadable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="downloadContentVersion"
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
			Name="localizedDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="localizedTitle"
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
			Name="price"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="productIdentifier"
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
