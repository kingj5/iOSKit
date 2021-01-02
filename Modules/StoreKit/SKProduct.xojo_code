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
			  
			  declare function priceLocale_ lib StoreKitLib selector "priceLocale" (obj_id as ptr) as ptr
			  declare function identifier_ lib FoundationLib selector "identifier" (ref as ptr) as CFStringRef
			  
			  dim localePtr As Ptr = priceLocale_(self)
			  
			  Dim identifier As Text = identifier_(localePtr)
			  
			  Return new xojo.core.Locale(identifier)
			  
			End Get
		#tag EndGetter
		PriceLocale As xojo.core.locale
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
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="downloadContentVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="localizedDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="localizedTitle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
			Name="price"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="productIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
