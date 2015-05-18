#tag Class
Protected Class SKPaymentQueue
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddPayment(payment as SKPayment)
		  declare sub addPayment_ lib StoreKitLib selector "addPayment:" (obj_id as ptr, payment as ptr)
		  addPayment_(self, payment)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTransactionObserver(observer as StoreKit.PaymentTransactionObserver)
		  declare sub addTransactionObserver_ lib StoreKitLib selector "addTransactionObserver:" (obj_id as ptr, observer as ptr)
		  addTransactionObserver_(self, observer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelDownloads(downloads as NSArray)
		  declare sub cancelDownloads_ lib StoreKitLib selector "cancelDownloads:" (obj_id as ptr, downloads as ptr)
		  cancelDownloads_(self, downloads)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CanMakePayments() As Boolean
		  declare function canMakePayments_ lib StoreKitLib selector "canMakePayments" (clsRef as ptr) as Boolean
		  Return canMakePayments_(ClassRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKPaymentQueue")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DefaultQueue() As SKPaymentQueue
		  declare function defaultQueue_ lib StoreKitLib selector "defaultQueue" (clsRef as ptr) as ptr
		  Return new SKPaymentQueue(defaultQueue_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FinishTransaction(transaction as SKPaymentTransaction)
		  declare sub finishTransaction_ lib StoreKitLib selector "finishTransaction:" (obj_id as ptr, transaction as ptr)
		  finishTransaction_(self, transaction)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PauseDownloads(downloads as NSArray)
		  declare sub pauseDownloads_ lib StoreKitLib selector "pauseDownloads:" (obj_id as ptr, downloads as ptr)
		  pauseDownloads_(self, downloads)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveTransactionObserver(observer as StoreKit.PaymentTransactionObserver)
		  declare sub removeTransactionObserver_ lib StoreKitLib selector "removeTransactionObserver:" (obj_id as ptr, observer as ptr)
		  removeTransactionObserver_(self, observer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreCompletedTransactions()
		  declare sub restoreCompletedTransactions_ lib StoreKitLib selector "restoreCompletedTransactions" (obj_id as ptr)
		  restoreCompletedTransactions_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreCompletedTransactionsWithApplicationUsername(username as CFStringRef)
		  declare sub restoreCompletedTransactionsWithApplicationUsername_ lib StoreKitLib selector "restoreCompletedTransactionsWithApplicationUsername:" (obj_id as ptr, username as CFStringRef)
		  restoreCompletedTransactionsWithApplicationUsername_(self, username)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResumeDownloads(downloads as NSArray)
		  declare sub resumeDownloads_ lib StoreKitLib selector "resumeDownloads:" (obj_id as ptr, downloads as ptr)
		  resumeDownloads_(self, downloads)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartDownloads(downloads as NSArray)
		  declare sub startDownloads_ lib StoreKitLib selector "startDownloads:" (obj_id as ptr, downloads as ptr)
		  startDownloads_(self, downloads)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function transactions_ lib StoreKitLib selector "transactions" (obj_id as ptr) as ptr
			  Return new NSArray(transactions_(self))
			End Get
		#tag EndGetter
		transactions As NSArray
	#tag EndComputedProperty


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
	#tag EndViewBehavior
End Class
#tag EndClass
