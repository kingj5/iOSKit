#tag Class
Protected Class TurnBasedMatchHelper
Inherits NSObject
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  dim selfRef as Ptr = Initialize(Allocate(TargetClass))
		  Super.Constructor(selfRef)
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(selfRef) = xojo.Core.WeakRef.Create(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindMatch(minPlayers as integer, maxPlayers as Integer, inView as iOSView)
		  if not AuthenticationHelper.GetInstance.GameCenterEnabled then Return //game center must be enabled to use its features
		  
		  dim request as new GameKit.GKMatchRequest
		  request.minPlayers = minPlayers
		  request.maxPlayers = maxPlayers
		  
		  dim mmvc as new GameKit.GKTurnBasedMatchmakerViewController(request)
		  mmvc.turnBasedMatchmakerDelegate = self
		  mmvc.showExistingMatches = True
		  
		  inView.PresentViewController(mmvc, True, nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetInstance() As TurnBasedMatchHelper
		  static helper as new TurnBasedMatchHelper
		  Return helper
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleturnBasedMatchmakerViewControllerdidFailWithError(viewController as GKTurnBasedMatchmakerViewController, error as NSError)
		  if observer <> nil then
		    observer.ViewControllerDidFailWithError(viewController, error)
		  end if
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(viewController, True, nil)
		  System.DebugLog error.localizedDescription
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleturnBasedMatchmakerViewControllerdidFindMatch(viewController as GKTurnBasedMatchmakerViewController, match as GKTurnBasedMatch)
		  if observer <> nil then
		    observer.ViewControllerDidFindMatch(viewController, match)
		  end if
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(viewController, True, nil)
		  
		  mmatch = match
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleturnBasedMatchmakerViewControllerplayerQuitForMatch(viewController as GKTurnBasedMatchmakerViewController, match as GKTurnBasedMatch)
		  if observer <> nil then
		    observer.ViewControllerPlayerQuitForMatch(viewController, match)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleturnBasedMatchmakerViewControllerWasCancelled(viewController as GKTurnBasedMatchmakerViewController)
		  if observer <> nil then
		    observer.ViewControllerWasCancelled(viewController)
		  end if
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(viewController, True, nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasMatch() As Boolean
		  Return (CurrentMatch <> nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_turnBasedMatchmakerViewControllerdidFailWithError(pid as ptr, sel as ptr, viewController as ptr, error as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    TurnBasedMatchHelper(w.value).HandleturnBasedMatchmakerViewControllerdidFailWithError(new GKTurnBasedMatchmakerViewController(viewController), new NSError(error))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_turnBasedMatchmakerViewControllerdidFindMatch(pid as ptr, sel as ptr, viewController as ptr, match as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    TurnBasedMatchHelper(w.value).HandleturnBasedMatchmakerViewControllerdidFindMatch(new GKTurnBasedMatchmakerViewController(viewController), new GKTurnBasedMatch(match))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_turnBasedMatchmakerViewControllerplayerQuitForMatch(pid as ptr, sel as ptr, viewController as ptr, match as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    TurnBasedMatchHelper(w.value).HandleturnBasedMatchmakerViewControllerplayerQuitForMatch(new GKTurnBasedMatchmakerViewController(viewController), new GKTurnBasedMatch(match))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_turnBasedMatchmakerViewControllerWasCancelled(pid as ptr, sel as ptr, viewController as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    TurnBasedMatchHelper(w.value).HandleturnBasedMatchmakerViewControllerWasCancelled(new GKTurnBasedMatchmakerViewController(viewController))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetObserver(observe as TurnBasedMatchHelperObserver)
		  observer = observe
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    
		    //TurnBasedMatchmakerViewController
		    methods.Append new TargetClassMethodHelper("turnBasedMatchmakerViewController:didFindMatch:", AddressOf impl_turnBasedMatchmakerViewControllerdidFindMatch, "v:@@")
		    methods.Append new TargetClassMethodHelper("turnBasedMatchmakerViewController:playerQuitForMatch:", AddressOf impl_turnBasedMatchmakerViewControllerplayerQuitForMatch, "v:@@")
		    methods.Append new TargetClassMethodHelper("turnBasedMatchmakerViewController:didFailWithError:", AddressOf impl_turnBasedMatchmakerViewControllerdidFailWithError, "v:@@")
		    methods.Append new TargetClassMethodHelper("turnBasedMatchmakerViewControllerWasCancelled:", AddressOf impl_turnBasedMatchmakerViewControllerWasCancelled, "v:@")
		    targetID = BuildTargetClass("NSObject","MyGKTurnBasedMatchmakerViewControllerDelegate",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mmatch
			End Get
		#tag EndGetter
		CurrentMatch As GKTurnBasedMatch
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mmatch As GKTurnBasedMatch
	#tag EndProperty

	#tag Property, Flags = &h21
		Private observer As TurnBasedMatchHelperObserver
	#tag EndProperty


	#tag Using, Name = GameKit
	#tag EndUsing


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
