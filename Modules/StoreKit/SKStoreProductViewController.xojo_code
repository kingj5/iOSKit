#tag Class
Protected Class SKStoreProductViewController
Inherits UIKIt.UIViewController
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor( Initialize(Allocate(NSClassFromString("SKStoreProductViewController"))) )
		  
		  dim del as ptr = Initialize(Allocate(TargetClass))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(del) = xojo.core.WeakRef.Create(self)
		  
		  declare sub setDelegate lib StoreKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
		  setDelegate(self, del)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleproductViewControllerDidFinish(viewController as SKStoreProductViewController)
		  if observer <> nil then
		    observer.DidFinish(viewController)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_productViewControllerDidFinish(pid as ptr, sel as ptr, viewController as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    SKStoreProductViewController(w.value).HandleproductViewControllerDidFinish(new SKStoreProductViewController (viewController))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProductsWithParameters(params as Foundation.NSDictionary, callback as LoadProductsCallback)
		  dim handler as new StoreKit.LoadProductsCompletionHandlerWrapper(callback)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  declare sub loadProduct lib StoreKitLib selector "loadProductWithParameters:completionBlock:" (obj_id as ptr, params as ptr, callback as ptr)
		  loadProduct(self,params,blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("productViewControllerDidFinish:", AddressOf impl_productViewControllerDidFinish, "v:@")
		    targetID = BuildTargetClass("NSObject","MySKStoreProductViewControllerDelegate",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		observer As StoreKit.SKStoreProductViewControllerObserver
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="automaticallyAdjustsScrollViewInsets"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="definesPresentationContext"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="editing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extendedLayoutIncludesOpaqueBars"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hidesBottomBarWhenPushed"
			Group="Behavior"
			Type="Boolean"
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
			Name="modalInPopover"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalPresentationCapturesStatusBarAppearance"
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
			Name="providesPresentationContextTransitionStyle"
			Group="Behavior"
			Type="Boolean"
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
