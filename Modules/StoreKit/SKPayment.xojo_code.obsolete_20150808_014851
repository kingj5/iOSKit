#tag Class
Protected Class SKPayment
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKPayment")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PaymentWithProduct(product as SKProduct) As SKPayment
		  declare function paymentWithProduct_ lib StoreKitLib selector "paymentWithProduct:" (clsRef as ptr, product as ptr) as ptr
		  Return new SKPayment(paymentWithProduct_(ClassRef, product))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function applicationUsername_ lib StoreKitLib selector "applicationUsername" (obj_id as ptr) as CFStringRef
			  Return applicationUsername_(self)
			End Get
		#tag EndGetter
		applicationUsername As Text
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function quantity_ lib StoreKitLib selector "quantity" (obj_id as ptr) as Integer
			  Return quantity_(self)
			End Get
		#tag EndGetter
		quantity As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function requestData_ lib StoreKitLib selector "requestData" (obj_id as ptr) as ptr
			  Return new NSData(requestData_(self))
			End Get
		#tag EndGetter
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
