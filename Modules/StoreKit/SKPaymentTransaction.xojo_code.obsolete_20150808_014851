#tag Class
Protected Class SKPaymentTransaction
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKPaymentTransaction")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function downloads_ lib StoreKitLib selector "downloads" (obj_id as ptr) as ptr
			  Return new NSArray(downloads_(self))
			End Get
		#tag EndGetter
		downloads As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function error_ lib StoreKitLib selector "error" (obj_id as ptr) as ptr
			  Return new NSError(error_(self))
			End Get
		#tag EndGetter
		error As NSError
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function originalTransaction_ lib StoreKitLib selector "originalTransaction" (obj_id as ptr) as ptr
			  Return new SKPaymentTransaction(originalTransaction_(self))
			End Get
		#tag EndGetter
		originalTransaction As SKPaymentTransaction
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function payment_ lib StoreKitLib selector "payment" (obj_id as ptr) as ptr
			  Return new SKPayment(payment_(self))
			End Get
		#tag EndGetter
		payment As SKPayment
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function transactionDate_ lib StoreKitLib selector "transactionDate" (obj_id as ptr) as ptr
			  dim result as new NSDate(transactionDate_(self))
			  Return result
			End Get
		#tag EndGetter
		transactionDate As xojo.Core.Date
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function transactionIdentifier_ lib StoreKitLib selector "transactionIdentifier" (obj_id as ptr) as CFStringRef
			  Return transactionIdentifier_(self)
			End Get
		#tag EndGetter
		transactionIdentifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function transactionState_ lib StoreKitLib selector "transactionState" (obj_id as ptr) as SKPaymentTransactionState
			  Return transactionState_(self)
			End Get
		#tag EndGetter
		transactionState As SKPaymentTransactionState
	#tag EndComputedProperty


	#tag Enum, Name = SKPaymentTransactionState, Type = Integer, Flags = &h0
		Purchasing
		  Purchased
		  Failed
		  Restored
		Deferred
	#tag EndEnum


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
			Name="transactionIdentifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="transactionState"
			Group="Behavior"
			Type="SKPaymentTransactionState"
			EditorType="Enum"
			#tag EnumValues
				"0 - Purchasing"
				"1 - Purchased"
				"2 - Failed"
				"3 - Restored"
				"4 - Deferred"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
