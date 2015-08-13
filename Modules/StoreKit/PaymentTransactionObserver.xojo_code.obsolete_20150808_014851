#tag Class
Protected Class PaymentTransactionObserver
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  dim selfRef as ptr = Initialize(Allocate(TargetClass))
		  
		  Super.Constructor(selfRef)
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(selfRef) = xojo.core.WeakRef.Create(self)
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRemovedTransactions(queue as StoreKit.SKPaymentQueue, transactions as Foundation.NSArray)
		  dim transacts() as StoreKit.SKPaymentTransaction
		  dim ct as Integer = transactions.Count
		  for i as Integer = 0 to ct-1
		    transacts.Append new StoreKit.SKPaymentTransaction(transactions.Value(i))
		  next
		  RaiseEvent RemovedTransactions(queue,transacts)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRestoreTransactionsCompleted(queue as StoreKit.SKPaymentQueue)
		  RaiseEvent RestoreTransactionsCompleted(queue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRestoreTransactionsFailed(queue as StoreKit.SKPaymentQueue, err as Foundation.NSError)
		  RaiseEvent RestoreTransactionsFailed(queue,err)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleUpdatedDownloads(queue as StoreKit.SKPaymentQueue, downloads as Foundation.NSArray)
		  dim download() as StoreKit.SKDownload
		  dim ct as Integer = downloads.Count
		  for i as Integer = 0 to ct-1
		    download.Append new StoreKit.SKDownload(downloads.Value(i))
		  next
		  RaiseEvent UpdatedDownloads(queue,download)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleUpdatedTransactions(queue as StoreKit.SKPaymentQueue, transactions as Foundation.NSArray)
		  dim transacts() as StoreKit.SKPaymentTransaction
		  dim ct as Integer = transactions.Count
		  for i as Integer = 0 to ct-1
		    transacts.Append new StoreKit.SKPaymentTransaction(transactions.Value(i))
		  next
		  RaiseEvent UpdatedTransactions(queue,transacts)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_removedTransations(pid as ptr, sel as ptr, queue as ptr, transactions as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    PaymentTransactionObserver(w.Value).HandleRemovedTransactions(new StoreKit.SKPaymentQueue(queue), new Foundation.NSArray(transactions))
		  end if
		  
		  #Pragma unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_restoreTransactionsCompleted(pid as ptr, sel as ptr, queue as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    PaymentTransactionObserver(w.Value).HandleRestoreTransactionsCompleted(new StoreKit.SKPaymentQueue(queue))
		  end if
		  
		  #Pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_restoreTransactionsFailed(pid as ptr, sel as ptr, queue as ptr, err as ptr)
		  dim error as Foundation.NSError
		  if err <> nil then
		    error = new Foundation.NSError(err)
		  end if
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    PaymentTransactionObserver(w.Value).HandleRestoreTransactionsFailed(new StoreKit.SKPaymentQueue(queue), error)
		  end if
		  
		  #Pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_updatedDownloads(pid as ptr, sel as ptr, queue as ptr, downloads as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    PaymentTransactionObserver(w.Value).HandleUpdatedDownloads(new StoreKit.SKPaymentQueue(queue), new Foundation.NSArray(downloads))
		  end if
		  
		  #Pragma unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_updatedTransations(pid as ptr, sel as ptr, queue as ptr, transactions as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    PaymentTransactionObserver(w.Value).HandleUpdatedTransactions(new StoreKit.SKPaymentQueue(queue), new Foundation.NSArray(transactions))
		  end if
		  #Pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("paymentQueue:updatedTransactions:", AddressOf impl_updatedTransations, "v@:@@")
		    methods.Append new TargetClassMethodHelper("paymentQueue:removedTransactions:", AddressOf impl_removedTransations, "v@:@@")
		    methods.Append new TargetClassMethodHelper("paymentQueue:restoreCompletedTransactionsFailedWithError:", AddressOf impl_restoreTransactionsFailed, "v@:@@")
		    methods.Append new TargetClassMethodHelper("paymentQueueRestoreCompletedTransactionsFinished:", AddressOf impl_restoreTransactionsCompleted, "v@:@")
		    methods.Append new TargetClassMethodHelper("paymentQueue:updatedDownloads:", AddressOf impl_updatedDownloads, "v@:@@")
		    
		    targetID = BuildTargetClass("NSObject","PaymentTransactionObserverDel",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RemovedTransactions(queue as StoreKit.SKPaymentQueue, transactions() as StoreKit.SKPaymentTransaction)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RestoreTransactionsCompleted(queue as StoreKit.SKPaymentQueue)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RestoreTransactionsFailed(queue as StoreKit.SKPaymentQueue, err as Foundation.NSError)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UpdatedDownloads(queue as StoreKit.SKPaymentQueue, downloads() as StoreKit.SKDownload)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UpdatedTransactions(queue as StoreKit.SKPaymentQueue, transactions() as StoreKit.SKPaymentTransaction)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty


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
