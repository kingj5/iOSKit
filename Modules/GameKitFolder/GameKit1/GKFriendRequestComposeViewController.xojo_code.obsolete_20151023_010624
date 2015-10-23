#tag Class
Protected Class GKFriendRequestComposeViewController
Inherits UIKit.UINavigationController
	#tag Method, Flags = &h0
		Sub AddRecipientPlayers(players as NSArray)
		  declare sub addRecipientPlayers_ lib GameKitLib selector "addRecipientPlayers:" (obj_id as ptr, players as ptr)
		  addRecipientPlayers_(self, players)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRecipientsWithEmailAddresses(emailAddresses as NSArray)
		  declare sub addRecipientsWithEmailAddresses_ lib GameKitLib selector "addRecipientsWithEmailAddresses:" (obj_id as ptr, emailAddresses as ptr)
		  addRecipientsWithEmailAddresses_(self, emailAddresses)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKFriendRequestComposeViewController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  dim selfRef as Ptr = Initialize(Allocate(TargetClass))
		  Super.Constructor(Initialize(Allocate(ClassRef)))
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(selfRef) = xojo.Core.WeakRef.Create(self)
		  
		  composeViewDelegate = selfRef
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlefriendRequestComposeViewControllerDidFinish(viewController as GKFriendRequestComposeViewController)
		  if observer <> nil then
		    observer.DidFinish(viewController)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_friendRequestComposeViewControllerDidFinish(pid as ptr, sel as ptr, viewController as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKFriendRequestComposeViewController(w.value).HandlefriendRequestComposeViewControllerDidFinish(new GKFriendRequestComposeViewController(viewController))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MaxNumberOfRecipients() As UInteger
		  declare function maxNumberOfRecipients_ lib GameKitLib selector "maxNumberOfRecipients" (clsRef as ptr) as UInteger
		  Return maxNumberOfRecipients_(ClassRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMessage(message as Text)
		  declare sub setMessage_ lib GameKitLib selector "setMessage:" (obj_id as ptr, message as CFStringRef)
		  setMessage_(self, message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("friendRequestComposeViewControllerDidFinish:", AddressOf impl_friendRequestComposeViewControllerDidFinish, "v:@")
		    targetID = BuildTargetClass("NSObject","MyGKFriendRequestComposeViewControllerDelegate",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  declare function composeViewDelegate_ lib GameKitLib selector "composeViewDelegate" (obj_id as ptr) as ptr
			  Return (composeViewDelegate_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub composeViewDelegate_ lib GameKitLib selector "setComposeViewDelegate:" (obj_id as ptr, composeViewDelegate as ptr)
			  composeViewDelegate_(self, value)
			End Set
		#tag EndSetter
		Private composeViewDelegate As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		observer As GKFriendRequestComposeViewControllerObserver
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
