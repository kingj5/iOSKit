#tag Class
Protected Class WKNavigationDelegate
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(TargetClass)))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(self.id) = self
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleError(err as ptr)
		  declare function code_ lib FoundationLib selector "code" (obj_id as ptr) as Integer
		  declare function localizedMessage lib FoundationLib selector "localizedDescription" (obj_id as ptr) as CFStringRef
		  
		  dim code as Integer = code_(err)
		  dim msg as Text = localizedMessage(err)
		  
		  RaiseEvent Error(code,msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFinishLoad(navigation as ptr)
		  try
		    RaiseEvent DocumentComplete(navigation)
		    
		  Catch
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleShouldLoad(url As Text, userAction As Boolean) As Boolean
		  
		  Try
		    Return Not CancelLoad(url, userAction)
		    
		  Catch
		    
		  end try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleStartLoad(navigation as ptr)
		  try
		    
		    RaiseEvent DocumentBegin(navigation)
		    
		  Catch
		    
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_error(pid as ptr, sel as ptr, view as ptr, navigation as ptr, err as ptr)
		  #Pragma Unused sel
		  #Pragma Unused view
		  #Pragma Unused navigation
		  
		  WKNavigationDelegate(dispatch.Value(pid)).HandleError(err)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_FinishLoad(pid as ptr, sel as ptr, view as ptr, navigation as ptr)
		  #Pragma Unused sel
		  #Pragma Unused view
		  
		  WKNavigationDelegate(dispatch.Value(pid)).HandleFinishLoad(navigation)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_ShouldLoad(pid as ptr, sel as ptr, webView as ptr, navigationAction as ptr, decisionHandler as Ptr)
		  #Pragma Unused sel
		  #Pragma Unused webView
		  
		  
		  
		  Declare Function request_ Lib FoundationLib selector "request" (obj_id As ptr) As ptr
		  
		  Dim req As ptr = request_(navigationAction)
		  
		  
		  
		  declare function URL_ lib FoundationLib selector "URL" (obj_id as ptr) as ptr
		  
		  dim nsurlref as ptr = URL_(req)
		  
		  declare Function absoluteString lib FoundationLib selector "absoluteString" (obj_id as ptr) as CFStringRef
		  Dim url As Text = absoluteString(nsurlref)
		  
		  Declare Function navigationType_ Lib FoundationLib selector "navigationType" (obj_id As ptr) As WKNavigationType
		  Dim navtype As WKNavigationType = navigationtype_(navigationAction)
		  
		  
		  Dim shouldLoad As Boolean
		  shouldLoad = WKNavigationDelegate(dispatch.Value(pid)).HandleShouldLoad(url, navtype=WKNavigationType.linkActivated)
		  
		  
		  
		  Dim fp As NavDecisionHandler = New NavDecisionHandler(decisionHandler.Block_layout.invoke)
		  fp.Invoke(decisionHandler, If(shouldLoad, WKNavigationActionPolicy.allow, WKNavigationActionPolicy.cancel))
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_startLoad(pid as ptr, sel as ptr, view as ptr, navigation as ptr)
		  #Pragma Unused sel
		  #Pragma Unused view
		  
		  WKNavigationDelegate(dispatch.Value(pid)).HandleStartLoad(navigation)
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub NavDecisionHandler(obj As Ptr, policy As WKNavigationActionPolicy)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Sub NavigationAllow(Byref value As WKNavigationActionPolicy)
		  
		  value = WKNavigationActionPolicy.allow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub NavigationCancel(Byref value As WKNavigationActionPolicy)
		  value = WKNavigationActionPolicy.cancel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  // From https://developer.apple.com/documentation/webkit/wknavigationdelegate?language=objc
		  
		  Static targetID As ptr
		  if targetID = nil then
		    using Extensions
		    dim methods() as UIKit.TargetClassMethodHelper
		    methods.Append new UIKit.TargetClassMethodHelper("webView:decidePolicyForNavigationAction:decisionHandler:", AddressOf impl_ShouldLoad, "v@:@@@")
		    methods.Append new UIKit.TargetClassMethodHelper("webView:didStartProvisionalNavigation:", AddressOf impl_startLoad, "v@:@@")
		    methods.Append new UIKit.TargetClassMethodHelper("webView:didFinishNavigation:", AddressOf impl_FinishLoad, "v@:@@")
		    
		    methods.Append new UIKit.TargetClassMethodHelper("webView:didFailProvisionalNavigation:withError:", AddressOf impl_error, "v@:@@@")
		    methods.Append new UIKit.TargetClassMethodHelper("webView:didFailNavigation:withError:", AddressOf impl_error, "v@:@@@")
		    
		    
		    'methods.Append new UIKit.TargetClassMethodHelper("webViewDidFinishLoad:", AddressOf impl_FinishLoad, "v@:@")
		    'methods.Append new UIKit.TargetClassMethodHelper("webView:didFailLoadWithError:", AddressOf impl_error, "v@:@@")
		    
		    
		    
		    targetID = BuildTargetClass("NSObject","MyWKNavigationDelegate", methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CancelLoad(url as Text, userAction As Boolean) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DocumentBegin(navigation As ptr)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DocumentComplete(navigation as ptr)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(errorCode as integer, errorMessage as Text)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty


	#tag Structure, Name = Block_Layout, Flags = &h1
		isa_ as Ptr
		  flags as int32
		  reserved as int32
		  invoke as ptr
		descriptor as ptr
	#tag EndStructure


	#tag Enum, Name = WKNavigationActionPolicy, Type = Integer, Flags = &h0
		cancel = 0
		allow
	#tag EndEnum

	#tag Enum, Name = WKNavigationType, Type = Integer, Flags = &h0
		linkActivated
		  formSubmitted
		  backForward
		  reload
		  formResubmitted
		other
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
