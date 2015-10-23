#tag Class
Protected Class GKMatchmaker
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddPlayersToMatchMatchRequestCompletionHandler(match as GKMatch, matchRequest as GKMatchRequest, completionHandler as NSErrorCompletionHandler)
		  declare sub addPlayersToMatch_ lib GameKitLib selector "addPlayersToMatch:matchRequest:completionHandler:" (obj_id as ptr, match as ptr, matchRequest as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  addPlayersToMatch_(self, match, matchRequest, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cancel()
		  declare sub cancel_ lib GameKitLib selector "cancel" (obj_id as ptr)
		  cancel_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelPendingInviteToPlayer(player as GKPlayer)
		  declare sub cancelPendingInviteToPlayer_ lib GameKitLib selector "cancelPendingInviteToPlayer:" (obj_id as ptr, player as ptr)
		  cancelPendingInviteToPlayer_(self, player)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKMatchmaker")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindMatchForRequestWithCompletionHandler(request as GKMatchRequest, completionHandler as GKMatchCompletionHandler)
		  declare sub findMatchForRequest_ lib GameKitLib selector "findMatchForRequest:withCompletionHandler:" (obj_id as ptr, request as ptr, completionHandler as ptr)
		  dim handler as new GKMatchCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  findMatchForRequest_(self, request, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindPlayersForHostedRequestWithCompletionHandler(request as GKMatchRequest, completionHandler as NSArrayCompletionHandler)
		  declare sub findPlayersForHostedRequest_ lib GameKitLib selector "findPlayersForHostedRequest:withCompletionHandler:" (obj_id as ptr, request as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  findPlayersForHostedRequest_(self, request, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FinishMatchmakingForMatch(match as GKMatch)
		  declare sub finishMatchmakingForMatch_ lib GameKitLib selector "finishMatchmakingForMatch:" (obj_id as ptr, match as ptr)
		  finishMatchmakingForMatch_(self, match)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MatchForInviteCompletionHandler(invite as GKInvite, completionHandler as GKMatchCompletionHandler)
		  declare sub matchForInvite_ lib GameKitLib selector "matchForInvite:completionHandler:" (obj_id as ptr, invite as ptr, completionHandler as ptr)
		  dim handler as new GameKit.GKMatchCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  matchForInvite_(self, invite, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QueryActivityWithCompletionHandler(completionHandler as IntegerCompletionHandler)
		  declare sub queryActivityWithCompletionHandler_ lib GameKitLib selector "queryActivityWithCompletionHandler:" (obj_id as ptr, completionHandler as Ptr)
		  dim handler as new IntegerCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  queryActivityWithCompletionHandler_(self, blk.Handle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QueryPlayerGroupActivityWithCompletionHandler(playerGroup as UInteger, completionHandler as IntegerCompletionHandler)
		  declare sub queryPlayerGroupActivity_ lib GameKitLib selector "queryPlayerGroupActivity:withCompletionHandler:" (obj_id as ptr, playerGroup as UInteger, completionHandler as Ptr)
		  dim handler as new IntegerCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  queryPlayerGroupActivity_(self, playerGroup, blk.Handle)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SharedMatchmaker() As GKMatchmaker
		  declare function sharedMatchmaker_ lib GameKitLib selector "sharedMatchmaker" (clsRef as ptr) as ptr
		  Return new GKMatchmaker(sharedMatchmaker_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartBrowsingForNearbyPlayersWithHandler(reachableHandler as GKPlayer)
		  declare sub startBrowsingForNearbyPlayersWithHandler_ lib GameKitLib selector "startBrowsingForNearbyPlayersWithHandler:" (obj_id as ptr, reachableHandler as ptr)
		  startBrowsingForNearbyPlayersWithHandler_(self, reachableHandler)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopBrowsingForNearbyPlayers()
		  declare sub stopBrowsingForNearbyPlayers_ lib GameKitLib selector "stopBrowsingForNearbyPlayers" (obj_id as ptr)
		  stopBrowsingForNearbyPlayers_(self)
		End Sub
	#tag EndMethod


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
