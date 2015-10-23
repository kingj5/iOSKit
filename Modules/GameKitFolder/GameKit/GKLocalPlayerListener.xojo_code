#tag Class
Protected Class GKLocalPlayerListener
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Constructor()
		  dim selfRef as Ptr = Initialize(Allocate(TargetClass))
		  Super.Constructor(selfRef)
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(selfRef) = xojo.Core.WeakRef.Create(self)
		  
		  needsExtraRelease = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerdidAcceptInvite(player as GKPlayer, invite as GKInvite)
		  RaiseEvent PlayerDidAcceptInvite(player, invite)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerdidCompleteChallengeissuedByFriend(player as GKPlayer, challenge as GKChallenge, friendPlayer as GKPlayer)
		  RaiseEvent DidCompleteChallenge(player, challenge, friendPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerdidReceiveChallenge(player as GKPlayer, challenge as GKChallenge)
		  RaiseEvent DidReceiveChallenge(player, challenge)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerdidRequestMatchWithOtherPlayers(player as GKPlayer, playersToInvite as NSArray)
		  RaiseEvent PlayerDidRequestMatchWithOtherPlayers(player, playersToInvite)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerdidRequestMatchWithRecipients(player as GKPlayer, recipientPlayers as NSArray)
		  RaiseEvent PlayerDidRequestMatchWithRecipients(player, recipientPlayers)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerissuedChallengeWasCompletedbyFriend(player as GKPlayer, challenge as GKChallenge, friendPlayer as GKPlayer)
		  RaiseEvent IssuedChallengeWasCompleted(player, challenge, friendPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayermatchEnded(player as GKPlayer, match as GKTurnBasedMatch)
		  RaiseEvent MatchEnded(player, match)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerreceivedExchangeCancellationforMatch(player as GKPlayer, exchange as GKTurnBasedExchange, match as GKTurnBasedMatch)
		  RaiseEvent PlayerReceivedExchangeCancellation(player, exchange, match)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerreceivedExchangeRepliesforCompletedExchangeforMatch(player as GKPlayer, replies as NSArray, exchange as GKTurnBasedExchange, match as GKTurnBasedMatch)
		  RaiseEvent PlayerReceivedExchangeReplies(player, replies, exchange, match)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerreceivedExchangeRequestforMatch(player as GKPlayer, exchange as GKTurnBasedExchange, match as GKTurnBasedMatch)
		  RaiseEvent PlayerReceivedExchangeRequest(player, exchange, match)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerreceivedTurnEventForMatchdidBecomeActive(player as GKPlayer, match as GKTurnBasedMatch, didBecomeActive as Boolean)
		  RaiseEvent PlayerReceivedTurnEvent(player, match, didBecomeActive)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleplayerwantsToPlayChallenge(player as GKPlayer, challenge as GKChallenge)
		  RaiseEvent WantsToPlayChallange(player, challenge)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerdidAcceptInvite(pid as ptr, sel as ptr, player as ptr, invite as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerdidAcceptInvite(new GKPlayer(player), new GKInvite(invite))
		  end if
		  
		  #Pragma Warning "performOnMainThread?"
		  'declare function alloc_ lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  'declare function init_ lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  'declare sub setValue_ lib FoundationLib selector "setValue:forKey:" (obj_id as ptr, value as ptr, key as CFStringRef)
		  'dim dict as Ptr = init_(alloc_(NSClassFromString("NSMutableDictionary")))
		  'setValue_(dict, player, "player")
		  'setValue_(dict, invite, "invite")
		  'performOnMainThread(pid,sel,dict)
		  
		  #Pragma Unused sel
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerdidCompleteChallengeissuedByFriend(pid as ptr, sel as ptr, player as ptr, challenge as ptr, friendPlayer as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerdidCompleteChallengeissuedByFriend(new GKPlayer(player), new GKChallenge(challenge), new GKPlayer(friendPlayer))
		  end if
		  
		  #Pragma Unused sel
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerdidReceiveChallenge(pid as ptr, sel as ptr, player as ptr, challenge as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerdidReceiveChallenge(new GKPlayer(player), new GKChallenge(challenge))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerdidRequestMatchWithOtherPlayers(pid as ptr, sel as ptr, player as ptr, playersToInvite as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerdidRequestMatchWithOtherPlayers(new GKPlayer(player), new NSArray(playersToInvite))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerdidRequestMatchWithRecipients(pid as ptr, sel as ptr, player as ptr, recipientPlayers as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerdidRequestMatchWithRecipients(new GKPlayer(player), new NSArray(recipientPlayers))
		  end if
		  
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerissuedChallengeWasCompletedbyFriend(pid as ptr, sel as ptr, player as ptr, challenge as ptr, friendPlayer as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerissuedChallengeWasCompletedbyFriend(new GKPlayer(player), new GKChallenge(challenge), new GKPlayer(friendPlayer))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playermatchEnded(pid as ptr, sel as ptr, player as ptr, match as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayermatchEnded(new GKPlayer(player), new GKTurnBasedMatch(match))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerreceivedExchangeCancellationforMatch(pid as ptr, sel as ptr, player as ptr, exchange as ptr, match as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerreceivedExchangeCancellationforMatch(new GKPlayer(player), new GKTurnBasedExchange(exchange), new GKTurnBasedMatch(match))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerreceivedExchangeRepliesforCompletedExchangeforMatch(pid as ptr, sel as ptr, player as ptr, replies as ptr, exchange as ptr, match as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerreceivedExchangeRepliesforCompletedExchangeforMatch(new GKPlayer(player), new NSArray(replies), new GKTurnBasedExchange(exchange), new GKTurnBasedMatch(match))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerreceivedExchangeRequestforMatch(pid as ptr, sel as ptr, player as ptr, exchange as ptr, match as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerreceivedExchangeRequestforMatch(new GKPlayer(player), new GKTurnBasedExchange(exchange), new GKTurnBasedMatch(match))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerreceivedTurnEventForMatchdidBecomeActive(pid as ptr, sel as ptr, player as ptr, match as ptr, didBecomeActive as Boolean)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerreceivedTurnEventForMatchdidBecomeActive(new GKPlayer(player), new GKTurnBasedMatch(match), didBecomeActive)
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_playerwantsToPlayChallenge(pid as ptr, sel as ptr, player as ptr, challenge as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKLocalPlayerListener(w.value).HandleplayerwantsToPlayChallenge(new GKPlayer(player), new GKChallenge(challenge))
		  end if
		  
		  #Pragma Unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub performOnMainThread(pid as ptr, sel as Ptr, dict as Ptr)
		  #Pragma StackOverflowChecking false
		  #Pragma DisableBackgroundTasks
		  
		  declare sub performSelectorOnMainThread_ lib FoundationLib selector "performSelectorOnMainThread:withObject:waitUntilDone:" (obj_id as ptr, aSelector as ptr, arg as ptr, wait as Boolean)
		  performSelectorOnMainThread_(pid,sel,dict,False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    //GKChallenegeListener protocol
		    methods.Append new TargetClassMethodHelper("player:didReceiveChallenge:", AddressOf impl_playerdidReceiveChallenge, "v:@@")
		    methods.Append new TargetClassMethodHelper("player:wantsToPlayChallenge:", AddressOf impl_playerwantsToPlayChallenge, "v:@@")
		    methods.Append new TargetClassMethodHelper("player:didCompleteChallenge:issuedByFriend:", AddressOf impl_playerdidCompleteChallengeissuedByFriend, "v:@@@")
		    methods.Append new TargetClassMethodHelper("player:issuedChallengeWasCompleted:byFriend:", AddressOf impl_playerissuedChallengeWasCompletedbyFriend, "v:@@@")
		    
		    //GKInviteEventListener
		    methods.Append new TargetClassMethodHelper("player:didAcceptInvite:", AddressOf impl_playerdidAcceptInvite, "v:@@")
		    methods.Append new TargetClassMethodHelper("player:didRequestMatchWithRecipients:", AddressOf impl_playerdidRequestMatchWithRecipients, "v:@@")
		    
		    //GKTurnBasedEventListener
		    methods.Append new TargetClassMethodHelper("player:receivedExchangeCancellation:forMatch:", AddressOf impl_playerreceivedExchangeCancellationforMatch, "v:@@@")
		    methods.Append new TargetClassMethodHelper("player:receivedExchangeReplies:forCompletedExchange:forMatch:", AddressOf impl_playerreceivedExchangeRepliesforCompletedExchangeforMatch, "v:@@@@")
		    methods.Append new TargetClassMethodHelper("player:receivedExchangeRequest:forMatch:", AddressOf impl_playerreceivedExchangeRequestforMatch, "v:@@@")
		    methods.Append new TargetClassMethodHelper("player:didRequestMatchWithOtherPlayers:", AddressOf impl_playerdidRequestMatchWithOtherPlayers, "v:@@")
		    methods.Append new TargetClassMethodHelper("player:matchEnded:", AddressOf impl_playermatchEnded, "v:@@")
		    methods.Append new TargetClassMethodHelper("player:receivedTurnEventForMatch:didBecomeActive:", AddressOf impl_playerreceivedTurnEventForMatchdidBecomeActive, "v:@@B")
		    targetID = BuildTargetClass("NSObject","MyGKLocalPlayerListenerObj",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidCompleteChallenge(player as GKPlayer, challenge as GKChallenge, friendPlayer as GKPlayer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidReceiveChallenge(player as GKPlayer, challenge as GKChallenge)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event IssuedChallengeWasCompleted(player as GKPlayer, challenge as GKChallenge, friendPlayer as GKPlayer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MatchEnded(player as GKPlayer, match as GKTurnBasedMatch)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlayerDidAcceptInvite(player as GKPlayer, invite as GKInvite)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlayerDidRequestMatchWithOtherPlayers(player as GKPlayer, playersToInvite as NSArray)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlayerDidRequestMatchWithRecipients(player as GKPlayer, recipientPlayers as NSArray)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlayerReceivedExchangeCancellation(player as GKPlayer, exchange as GKTurnBasedExchange, match as GKTurnBasedMatch)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlayerReceivedExchangeReplies(player as GKPlayer, replies as NSArray, exchange as GKTurnBasedExchange, match as GKTurnBasedMatch)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlayerReceivedExchangeRequest(player as GKPlayer, exchange as GKTurnBasedExchange, match as GKTurnBasedMatch)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlayerReceivedTurnEvent(player as GKPlayer, match as GKTurnBasedMatch, didBecomeActive as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WantsToPlayChallange(player as GKPlayer, challenge as GKChallenge)
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
