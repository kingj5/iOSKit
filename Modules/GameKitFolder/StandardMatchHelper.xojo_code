#tag Class
Protected Class StandardMatchHelper
Inherits NSObject
	#tag Method, Flags = &h1001
		Protected Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  dim selfRef as Ptr = Initialize(Allocate(TargetClass))
		  Super.Constructor(selfRef)
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(selfRef) = xojo.Core.WeakRef.Create(self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindMatch(withPlayers as Foundation.NSArray, inView as iOSView)
		  if not AuthenticationHelper.GetInstance.GameCenterEnabled then Return //game center must be enabled to use its features
		  
		  dim request as new GameKit.GKMatchRequest
		  request.recipients = withPlayers
		  
		  dim mmvc as new GameKit.GKMatchmakerViewController(request)
		  mmvc.matchmakerDelegate = self
		  
		  inView.PresentViewController(mmvc, True, nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindMatch(withInvite as GameKit.GKInvite, inView as iOSView)
		  if not AuthenticationHelper.GetInstance.GameCenterEnabled then Return //game center must be enabled to use its features
		  
		  dim mmvc as new GameKit.GKMatchmakerViewController(withInvite)
		  mmvc.matchmakerDelegate = self
		  
		  inView.PresentViewController(mmvc, True, nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindMatch(minPlayers as integer, maxPlayers as Integer, inView as iOSView)
		  if not AuthenticationHelper.GetInstance.GameCenterEnabled then Return //game center must be enabled to use its features
		  
		  dim request as new GameKit.GKMatchRequest
		  request.minPlayers = minPlayers
		  request.maxPlayers = maxPlayers
		  
		  dim mmvc as new GameKit.GKMatchmakerViewController(request)
		  mmvc.matchmakerDelegate = self
		  
		  inView.PresentViewController(mmvc, True, nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetInstance() As StandardMatchHelper
		  static helper as new StandardMatchHelper
		  Return helper
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlematchdidFailWithError(match as GKMatch, error as NSError)
		  if observer <> nil then
		    observer.MatchDidFailWithError(match, error)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlematchdidReceiveDatafromRemotePlayer(match as GKMatch, data as NSData, player as GKPlayer)
		  dim matchPtr1, matchPtr2 as ptr
		  matchPtr1 = self.match
		  matchPtr2 = match
		  if matchPtr1 <> matchPtr2 then 
		    Return
		  end if
		  
		  if observer <> nil then
		    observer.MatchDidReceiveData(match, data, player)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlematchmakerViewControllerdidFailWithError(viewController as GKMatchmakerViewController, error as NSError)
		  if observer <> nil then
		    observer.ViewControllerDidFailWithError(viewController, error)
		  end if
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(viewController, True, nil)
		  System.DebugLog error.localizedDescription
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlematchmakerViewControllerdidFindHostedPlayers(viewController as GKMatchmakerViewController, players as NSArray)
		  if observer <> nil then
		    observer.ViewControllerDidFindHostedPlayers(viewController, players)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlematchmakerViewControllerdidFindMatch(viewController as GKMatchmakerViewController, match as GKMatch)
		  if observer <> nil then
		    observer.ViewControllerDidFindMatch(viewController, match)
		  end if
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(viewController, True, nil)
		  
		  self.mmatch = match
		  match.del = self
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlematchmakerViewControllerhostedPlayerDidAccept(viewController as GKMatchmakerViewController, player as GKPlayer)
		  if observer <> nil then
		    observer.ViewControllerHostedPlayerDidAccept(viewController, player)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlematchmakerViewControllerWasCancelled(viewController as GKMatchmakerViewController)
		  if observer <> nil then
		    observer.ViewControllerWasCancelled(viewController)
		  end if
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(viewController, True, nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlematchplayerdidChangeConnectionState(match as GKMatch, player as GKPlayer, state as Integer)
		  if observer <> nil then
		    observer.MatchPlayerDidChangeConnectionState(match, player, state)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandlematchshouldReinviteDisconnectedPlayer(match as GKMatch, player as GKPlayer) As Boolean
		  if observer <> nil then
		    return observer.MatchShouldReinviteDisconnectedPlayer(match, player)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasMatch() As Boolean
		  Return match <> nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_matchdidFailWithError(pid as ptr, sel as ptr, match as ptr, error as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    StandardMatchHelper(w.value).HandlematchdidFailWithError(new GKMatch(match), new NSError(error))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_matchdidReceiveDatafromRemotePlayer(pid as ptr, sel as ptr, match as ptr, data as ptr, player as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    StandardMatchHelper(w.value).HandlematchdidReceiveDatafromRemotePlayer(new GKMatch(match), new NSData(data), new GKPlayer(player))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_matchmakerViewControllerdidFailWithError(pid as ptr, sel as ptr, viewController as ptr, error as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    StandardMatchHelper(w.value).HandlematchmakerViewControllerdidFailWithError(new GKMatchmakerViewController(viewController), new NSError(error))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_matchmakerViewControllerdidFindHostedPlayers(pid as ptr, sel as ptr, viewController as ptr, players as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    StandardMatchHelper(w.value).HandlematchmakerViewControllerdidFindHostedPlayers(new GKMatchmakerViewController(viewController), new NSArray(players))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_matchmakerViewControllerdidFindMatch(pid as ptr, sel as ptr, viewController as ptr, match as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    StandardMatchHelper(w.value).HandlematchmakerViewControllerdidFindMatch(new GKMatchmakerViewController(viewController), new GKMatch(match))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_matchmakerViewControllerhostedPlayerDidAccept(pid as ptr, sel as ptr, viewController as ptr, player as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    StandardMatchHelper(w.value).HandlematchmakerViewControllerhostedPlayerDidAccept(new GKMatchmakerViewController(viewController), new GKPlayer(player))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_matchmakerViewControllerWasCancelled(pid as ptr, sel as ptr, viewController as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    StandardMatchHelper(w.value).HandlematchmakerViewControllerWasCancelled(new GKMatchmakerViewController(viewController))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_matchplayerdidChangeConnectionState(pid as ptr, sel as ptr, match as ptr, player as ptr, state as Integer)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    StandardMatchHelper(w.value).HandlematchplayerdidChangeConnectionState(new GKMatch(match), new GKPlayer(player), state)
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_matchshouldReinviteDisconnectedPlayer(pid as ptr, sel as ptr, match as ptr, player as ptr) As Boolean
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    return StandardMatchHelper(w.value).HandlematchshouldReinviteDisconnectedPlayer(new GKMatch(match), new GKPlayer(player))
		  end if
		  
		  #Pragma Unused sel
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetObserver(observe as StandardMatchHelperObserver)
		  observer = observe
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    //GKMatchmakerViewControllerDelegate
		    methods.Append new TargetClassMethodHelper("matchmakerViewController:didFindMatch:", AddressOf impl_matchmakerViewControllerdidFindMatch, "v:@@")
		    methods.Append new TargetClassMethodHelper("matchmakerViewController:didFindHostedPlayers:", AddressOf impl_matchmakerViewControllerdidFindHostedPlayers, "v:@@")
		    methods.Append new TargetClassMethodHelper("matchmakerViewControllerWasCancelled:", AddressOf impl_matchmakerViewControllerWasCancelled, "v:@")
		    methods.Append new TargetClassMethodHelper("matchmakerViewController:didFailWithError:", AddressOf impl_matchmakerViewControllerdidFailWithError, "v:@@")
		    methods.Append new TargetClassMethodHelper("matchmakerViewController:hostedPlayerDidAccept:", AddressOf impl_matchmakerViewControllerhostedPlayerDidAccept, "v:@@")
		    
		    //GKMatchDelegate
		    methods.Append new TargetClassMethodHelper("match:didReceiveData:fromRemotePlayer:", AddressOf impl_matchdidReceiveDatafromRemotePlayer, "v:@@@")
		    methods.Append new TargetClassMethodHelper("match:player:didChangeConnectionState:", AddressOf impl_matchplayerdidChangeConnectionState, "v:@@i")
		    methods.Append new TargetClassMethodHelper("match:didFailWithError:", AddressOf impl_matchdidFailWithError, "v:@@")
		    methods.Append new TargetClassMethodHelper("match:shouldReinviteDisconnectedPlayer:", AddressOf impl_matchshouldReinviteDisconnectedPlayer, "B:@@")
		    targetID = BuildTargetClass("NSObject","MyStandardMatchHelper",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private gameCenterIsEnabled As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mmatch
			End Get
		#tag EndGetter
		match As GameKit.GKMatch
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mmatch As GameKit.GKMatch
	#tag EndProperty

	#tag Property, Flags = &h21
		Private observer As StandardMatchHelperObserver
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
