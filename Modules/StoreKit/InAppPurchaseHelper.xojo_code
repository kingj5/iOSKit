#tag Class
Protected Class InAppPurchaseHelper
Inherits StoreKit.PaymentTransactionObserver
	#tag Event
		Sub UpdatedTransactions(queue as StoreKit.SKPaymentQueue, transactions() as StoreKit.SKPaymentTransaction)
		  for each t as StoreKit.SKPaymentTransaction in transactions
		    select case t.transactionState
		    case StoreKit.SKPaymentTransaction.SKPaymentTransactionState.Purchased
		      completeTransaction(t)
		    case StoreKit.SKPaymentTransaction.SKPaymentTransactionState.Failed
		      failedTransaction(t)
		    case StoreKit.SKPaymentTransaction.SKPaymentTransactionState.Restored
		      restoreTransaction(t)
		    end select
		  next
		  
		  
		  #Pragma Unused queue
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BuyProduct(product as StoreKit.SKProduct)
		  dim payment as StoreKit.SKPayment = StoreKit.SKPayment.PaymentWithProduct(product)
		  StoreKit.SKPaymentQueue.DefaultQueue.addPayment(payment)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CleanUpAndNilRequest()
		  RemoveHandler productsRequest.DidReceiveResponse, AddressOf HandleDidReceiveResponse
		  RemoveHandler productsRequest.RequestDidFail, AddressOf HandleDidFail
		  productsRequest = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompleteTransaction(t as StoreKit.SKPaymentTransaction)
		  ProvideContentForProductID(t.payment.productIdentifier)
		  StoreKit.SKPaymentQueue.DefaultQueue.finishTransaction(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor(productIds as Foundation.NSSet)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From PaymentTransactionObserver
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor
		  
		  productIdentifiers = productIds
		  
		  purchasedProductIdentifiers = Foundation.NSMutableSet.Set
		  
		  dim productIDsArray as Foundation.NSArray = productIdentifiers.allObjects
		  dim count as UInteger = productIDsArray.count
		  for i as Integer = 0 to count - 1
		    dim productID as new Foundation.NSString(productIDsArray.Value(i))
		    dim productPurchased as Boolean = Foundation.NSUserDefaults.StandardUserDefaults.BoolForKey(productID.StringValue)
		    if productPurchased then
		      purchasedProductIdentifiers.AddObject productID
		    end if
		  next
		  
		  StoreKit.SKPaymentQueue.DefaultQueue.AddTransactionObserver(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub failedTransaction(t as StoreKit.SKPaymentTransaction)
		  System.DebugLog "Transaction failed: " + t.error.localizedDescription
		  StoreKit.SKPaymentQueue.DefaultQueue.finishTransaction(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetInstance() As StoreKit.InAppPurchaseHelper
		  static instance as StoreKit.InAppPurchaseHelper
		  
		  if instance = nil then
		    dim set as new Foundation.NSMutableSet
		    for each t as Text in productIDArray
		      set.AddObject( new NSString(t) )
		    next
		    instance = new InAppPurchaseHelper(set)
		  end if
		  Return instance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HandleDidFail(sender as StoreKit.SKProductsRequest, err as Foundation.NSError)
		  CleanUpAndNilRequest
		  
		  completionHandler.Invoke(False, nil)
		  
		  #Pragma unused sender
		  #Pragma unused err
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HandleDidReceiveResponse(sender as StoreKit.SKProductsRequest, response as StoreKit.SKProductsResponse)
		  CleanUpAndNilRequest
		  
		  dim products as Foundation.NSArray = response.products
		  
		  completionHandler.Invoke(True, products)
		  
		  
		  #Pragma unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isProductPurchased(identifier as Text) As Boolean
		  Return purchasedProductIdentifiers.ContainsObject(new NSString(identifier))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProvideContentForProductID(ID as Foundation.NSString)
		  purchasedProductIdentifiers.AddObject ID
		  Foundation.NSUserDefaults.StandardUserDefaults.SetBoolForKey(True, id.StringValue)
		  call Foundation.NSUserDefaults.StandardUserDefaults.Synchronize
		  
		  dim userInfo as new xojo.Core.Dictionary
		  userInfo.Value("productID") = ID.StringValue
		  
		  Notification_Center.NotificationCenter.MainCenter.PostNotification(_
		  new Notification_Center.Notification(SKProvideContentForProductNotification, self, userInfo))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestProductsWithCompletionHandler(compHandler as RequestProductsCompletionHandler)
		  completionHandler = compHandler
		  
		  productsRequest = new StoreKit.SKProductsRequest(productIdentifiers)
		  
		  AddHandler productsRequest.DidReceiveResponse, AddressOf HandleDidReceiveResponse
		  AddHandler productsRequest.RequestDidFail, AddressOf HandleDidFail
		  
		  productsRequest.Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreCompletedTransactions()
		  StoreKit.SKPaymentQueue.DefaultQueue.RestoreCompletedTransactions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RestoreTransaction(t as StoreKit.SKPaymentTransaction)
		  ProvideContentForProductID(t.originalTransaction.payment.productIdentifier)
		  StoreKit.SKPaymentQueue.DefaultQueue.finishTransaction(t)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private completionHandler As RequestProductsCompletionHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared productIDArray() As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private productIdentifiers As Foundation.NSSet
	#tag EndProperty

	#tag Property, Flags = &h21
		Private productsRequest As StoreKit.SKProductsRequest
	#tag EndProperty

	#tag Property, Flags = &h21
		Private purchasedProductIdentifiers As Foundation.NSMutableSet
	#tag EndProperty


	#tag Constant, Name = SKProvideContentForProductNotification, Type = Text, Dynamic = False, Default = \"skprovidecontent", Scope = Public
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
	#tag EndViewBehavior
End Class
#tag EndClass
