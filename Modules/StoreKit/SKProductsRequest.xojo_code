#tag Class
Protected Class SKProductsRequest
Inherits StoreKit.SKRequest
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKProductsRequest")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(productIdentifiers as NSSet)
		  declare function initWithProductIdentifiers_ lib StoreKitLib selector "initWithProductIdentifiers:" (obj_id as ptr, productIdentifiers as ptr) as ptr
		  Super.Constructor( initWithProductIdentifiers_(Allocate(ClassRef), productIdentifiers) )
		  
		  dim target as ptr = Initialize(Allocate(TargetClass))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(Target) = xojo.core.WeakRef.Create(self)
		  
		  self.mDelegate = Target
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidReceiveResponse(response as StoreKit.SKProductsResponse)
		  RaiseEvent DidReceiveResponse(response)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRequestDidFail(err as Foundation.NSError)
		  RaiseEvent RequestDidFail(err)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRequestDidFinish()
		  RaiseEvent RequestDidFinish
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didReceiveResponse(pid as ptr, sel as ptr, request as ptr, response as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SKProductsRequest(w.Value).HandleDidReceiveResponse(new StoreKit.SKProductsResponse(response))
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused request
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_requestDidFail(pid as ptr, sel as ptr, request as ptr, err as ptr)
		  dim error as Foundation.NSError
		  if err<>nil then
		    error = new Foundation.NSError(err)
		  end if
		  
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SKProductsRequest(w.Value).HandleRequestDidFail(error)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused request
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_requestDidFinish(pid as ptr, sel as ptr, request as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SKProductsRequest(w.Value).HandleRequestDidFinish
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused request
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("productsRequest:didReceiveResponse:", AddressOf impl_didReceiveResponse, "v@:@@")
		    methods.Append new TargetClassMethodHelper("requestDidFinish:", AddressOf impl_requestDidFinish, "v@:@")
		    methods.Append new TargetClassMethodHelper("request:didFailWithError:", AddressOf impl_requestDidFail, "v@:@@")
		    
		    targetID = BuildTargetClass("NSObject","SKProductsRequestDel",methods)
		  end if
		  Return targetID
		  
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidReceiveResponse(response as StoreKit.SKProductsResponse)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RequestDidFail(err as Foundation.NSError)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RequestDidFinish()
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function delegate_ lib StoreKitLib selector "delegate" (obj_id as ptr) as ptr
			  Return delegate_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub delegate_ lib StoreKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
			  delegate_(self, value)
			End Set
		#tag EndSetter
		mDelegate As Ptr
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
