#tag Class
Protected Class SKMutablePayment
Inherits StoreKit.SKPayment
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKMutablePayment")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function productIdentifier_ lib StoreKitLib selector "productIdentifier" (obj_id as ptr) as CFStringRef
			  Return productIdentifier_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub productIdentifier_ lib StoreKitLib selector "setProductIdentifier:" (obj_id as ptr, productIdentifier as CFStringRef)
			  productIdentifier_(self, value)
			End Set
		#tag EndSetter
		productIdentifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function quantity_ lib StoreKitLib selector "quantity" (obj_id as ptr) as Integer
			  Return quantity_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub quantity_ lib StoreKitLib selector "setQuantity:" (obj_id as ptr, quantity as Integer)
			  quantity_(self, value)
			End Set
		#tag EndSetter
		quantity As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function requestData_ lib StoreKitLib selector "requestData" (obj_id as ptr) as ptr
			  Return new NSData(requestData_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub requestData_ lib StoreKitLib selector "setRequestData:" (obj_id as ptr, requestData as ptr)
			  requestData_(self, value)
			End Set
		#tag EndSetter
		requestData As NSData
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="applicationUsername"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="productIdentifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="quantity"
			Group="Behavior"
			Type="Integer"
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
