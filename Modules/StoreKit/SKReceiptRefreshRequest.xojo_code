#tag Class
Protected Class SKReceiptRefreshRequest
Inherits StoreKit.SKRequest
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKReceiptRefreshRequest")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(properties as NSDictionary)
		  declare function initWithReceiptProperties_ lib StoreKitLib selector "initWithReceiptProperties:" (obj_id as ptr, properties as ptr) as ptr
		  Super.Constructor( initWithReceiptProperties_(Allocate(ClassRef), properties) )
		  
		  dim del as Ptr = Initialize(Allocate(TargetClass))
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(del) = xojo.core.WeakRef.Create(self)
		  
		  mDelegate = del
		  
		  needsExtraRelease = True
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
		Private Shared Sub impl_requestDidFail(pid as ptr, sel as ptr, request as ptr, err as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SKReceiptRefreshRequest(w.Value).HandleRequestDidFail(new Foundation.NSError(err))
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused request
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_requestDidFinish(pid as ptr, sel as ptr, request as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SKReceiptRefreshRequest(w.Value).HandleRequestDidFinish
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
		    methods.Append new TargetClassMethodHelper("requestDidFinish:", AddressOf impl_requestDidFinish, "v@:@")
		    methods.Append new TargetClassMethodHelper("request:didFailWithError:", AddressOf impl_requestDidFail, "v@:@@")
		    
		    targetID = BuildTargetClass("NSObject","SKReceiptRefreshRequestDel",methods)
		  end if
		  Return targetID
		  
		  
		End Function
	#tag EndMethod


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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function receiptProperties_ lib StoreKitLib selector "receiptProperties" (obj_id as ptr) as ptr
			  Return new NSDictionary(receiptProperties_(self))
			End Get
		#tag EndGetter
		receiptProperties As NSDictionary
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
