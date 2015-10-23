#tag Class
Protected Class GKTurnBasedMatch
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AcceptInviteWithCompletionHandler(completionHandler as GKTurnbasedMatchCompletionHandler)
		  declare sub acceptInviteWithCompletionHandler_ lib GameKitLib selector "acceptInviteWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GKTurnbasedMatchCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  acceptInviteWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKTurnBasedMatch")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeclineInviteWithCompletionHandler(completionHandler as NSErrorCompletionHandler)
		  declare sub declineInviteWithCompletionHandler_ lib GameKitLib selector "declineInviteWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  declineInviteWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndMatchInTurnWithMatchDataCompletionHandler(matchData as NSData, completionHandler as NSErrorCompletionHandler)
		  declare sub endMatchInTurnWithMatchData_ lib GameKitLib selector "endMatchInTurnWithMatchData:completionHandler:" (obj_id as ptr, matchData as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  endMatchInTurnWithMatchData_(self, matchData, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndMatchInTurnWithMatchDataScoresAchievementsCompletionHandler(matchData as NSData, scores as NSArray, achievements as NSArray, completionHandler as NSErrorCompletionHandler)
		  declare sub endMatchInTurnWithMatchData_ lib GameKitLib selector "endMatchInTurnWithMatchData:scores:achievements:completionHandler:" (obj_id as ptr, matchData as ptr, scores as ptr, achievements as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  endMatchInTurnWithMatchData_(self, matchData, scores, achievements, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndTurnWithNextParticipantsTurnTimeoutMatchDataCompletionHandler(nextParticipants as NSArray, timeout as double, matchData as NSData, completionHandler as NSErrorCompletionHandler)
		  declare sub endTurnWithNextParticipants_ lib GameKitLib selector "endTurnWithNextParticipants:turnTimeout:matchData:completionHandler:" (obj_id as ptr, nextParticipants as ptr, timeout as double, matchData as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  endTurnWithNextParticipants_(self, nextParticipants, timeout, matchData, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub FindMatchForRequestWithCompletionHandler(request as GKMatchRequest, completionHandler as GKTurnbasedMatchCompletionHandler)
		  declare sub findMatchForRequest_ lib GameKitLib selector "findMatchForRequest:withCompletionHandler:" (clsRef as ptr, request as ptr, completionHandler as ptr)
		  dim handler as new GKTurnbasedMatchCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  findMatchForRequest_(ClassRef, request, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadMatchDataWithCompletionHandler(completionHandler as NSDataCompletionHandler)
		  declare sub loadMatchDataWithCompletionHandler_ lib GameKitLib selector "loadMatchDataWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new NSDataCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadMatchDataWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LoadMatchesWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadMatchesWithCompletionHandler_ lib GameKitLib selector "loadMatchesWithCompletionHandler:" (clsRef as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadMatchesWithCompletionHandler_(ClassRef, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LoadMatchWithIDWithCompletionHandler(matchID as Text, completionHandler as GKTurnbasedMatchCompletionHandler)
		  declare sub loadMatchWithID_ lib GameKitLib selector "loadMatchWithID:withCompletionHandler:" (clsRef as ptr, matchID as CFStringRef, completionHandler as ptr)
		  dim handler as new GKTurnbasedMatchCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadMatchWithID_(ClassRef, matchID, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParticipantQuitInTurnWithOutcomeNextParticipantsTurnTimeoutMatchDataCompletionHandler(matchOutcome as GKTurnBasedMatchOutcome, nextParticipants as NSArray, timeout as double, matchData as NSData, completionHandler as NSErrorCompletionHandler)
		  declare sub participantQuitInTurnWithOutcome_ lib GameKitLib selector "participantQuitInTurnWithOutcome:nextParticipants:turnTimeout:matchData:completionHandler:" (obj_id as ptr, matchOutcome as GKTurnBasedMatchOutcome, nextParticipants as ptr, timeout as double, matchData as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  participantQuitInTurnWithOutcome_(self, matchOutcome, nextParticipants, timeout, matchData, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParticipantQuitOutOfTurnWithOutcomeWithCompletionHandler(matchOutcome as GKTurnBasedMatchOutcome, completionHandler as NSErrorCompletionHandler)
		  declare sub participantQuitOutOfTurnWithOutcome_ lib GameKitLib selector "participantQuitOutOfTurnWithOutcome:withCompletionHandler:" (obj_id as ptr, matchOutcome as GKTurnBasedMatchOutcome, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  participantQuitOutOfTurnWithOutcome_(self, matchOutcome, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RematchWithCompletionHandler(completionHandler as GKTurnbasedMatchCompletionHandler)
		  declare sub rematchWithCompletionHandler_ lib GameKitLib selector "rematchWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GKTurnbasedMatchCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  rematchWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveWithCompletionHandler(completionHandler as NSErrorCompletionHandler)
		  declare sub removeWithCompletionHandler_ lib GameKitLib selector "removeWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  removeWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveCurrentTurnWithMatchDataCompletionHandler(matchData as NSData, completionHandler as NSErrorCompletionHandler)
		  declare sub saveCurrentTurnWithMatchData_ lib GameKitLib selector "saveCurrentTurnWithMatchData:completionHandler:" (obj_id as ptr, matchData as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  saveCurrentTurnWithMatchData_(self, matchData, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveMergedMatchDataWithResolvedExchangesCompletionHandler(matchData as NSData, exchanges as NSArray, completionHandler as NSErrorCompletionHandler)
		  declare sub saveMergedMatchData_ lib GameKitLib selector "saveMergedMatchData:withResolvedExchanges:completionHandler:" (obj_id as ptr, matchData as ptr, exchanges as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  saveMergedMatchData_(self, matchData, exchanges, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendExchangeToParticipantsDataLocalizableMessageKeyArgumentsTimeoutCompletionHandler(participants as NSArray, data as NSData, key as CFStringRef, arguments as NSArray, timeout as double, completionHandler as GKTurnbasedExchangeCompletionHandler)
		  declare sub sendExchangeToParticipants_ lib GameKitLib selector "sendExchangeToParticipants:data:localizableMessageKey:arguments:timeout:completionHandler:" (obj_id as ptr, participants as ptr, data as ptr, key as CFStringRef, arguments as ptr, timeout as double, completionHandler as ptr)
		  dim handler as new GKTurnbasedExchangeCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  sendExchangeToParticipants_(self, participants, data, key, arguments, timeout, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendReminderToParticipantsLocalizableMessageKeyArgumentsCompletionHandler(participants as NSArray, key as CFStringRef, arguments as NSArray, completionHandler as NSErrorCompletionHandler)
		  declare sub sendReminderToParticipants_ lib GameKitLib selector "sendReminderToParticipants:localizableMessageKey:arguments:completionHandler:" (obj_id as ptr, participants as ptr, key as CFStringRef, arguments as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  sendReminderToParticipants_(self, participants, key, arguments, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLocalizableMessageWithKeyArguments(key as CFStringRef, arguments as NSArray)
		  declare sub setLocalizableMessageWithKey_ lib GameKitLib selector "setLocalizableMessageWithKey:arguments:" (obj_id as ptr, key as CFStringRef, arguments as ptr)
		  setLocalizableMessageWithKey_(self, key, arguments)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function activeExchanges_ lib GameKitLib selector "activeExchanges" (obj_id as ptr) as ptr
			  Return new NSArray(activeExchanges_(self))
			End Get
		#tag EndGetter
		activeExchanges As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function completedExchanges_ lib GameKitLib selector "completedExchanges" (obj_id as ptr) as ptr
			  Return new NSArray(completedExchanges_(self))
			End Get
		#tag EndGetter
		completedExchanges As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function creationDate_ lib GameKitLib selector "creationDate" (obj_id as ptr) as ptr
			  Return new NSDate(creationDate_(self))
			End Get
		#tag EndGetter
		creationDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function currentParticipant_ lib GameKitLib selector "currentParticipant" (obj_id as ptr) as ptr
			  Return new GKTurnBasedParticipant(currentParticipant_(self))
			End Get
		#tag EndGetter
		currentParticipant As GKTurnBasedParticipant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exchangeDataMaximumSize_ lib GameKitLib selector "exchangeDataMaximumSize" (obj_id as ptr) as UInteger
			  Return exchangeDataMaximumSize_(self)
			End Get
		#tag EndGetter
		exchangeDataMaximumSize As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exchangeMaxInitiatedExchangesPerPlayer_ lib GameKitLib selector "exchangeMaxInitiatedExchangesPerPlayer" (obj_id as ptr) as UInteger
			  Return exchangeMaxInitiatedExchangesPerPlayer_(self)
			End Get
		#tag EndGetter
		exchangeMaxInitiatedExchangesPerPlayer As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exchanges_ lib GameKitLib selector "exchanges" (obj_id as ptr) as ptr
			  Return new NSArray(exchanges_(self))
			End Get
		#tag EndGetter
		exchanges As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function matchData_ lib GameKitLib selector "matchData" (obj_id as ptr) as ptr
			  Return new NSData(matchData_(self))
			End Get
		#tag EndGetter
		matchData As NSData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function matchDataMaximumSize_ lib GameKitLib selector "matchDataMaximumSize" (obj_id as ptr) as UInteger
			  Return matchDataMaximumSize_(self)
			End Get
		#tag EndGetter
		matchDataMaximumSize As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function matchID_ lib GameKitLib selector "matchID" (obj_id as ptr) as CFStringRef
			  Return matchID_(self)
			End Get
		#tag EndGetter
		matchID As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function message_ lib GameKitLib selector "message" (obj_id as ptr) as CFStringRef
			  Return message_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub message_ lib GameKitLib selector "setMessage:" (obj_id as ptr, message as CFStringRef)
			  message_(self, value)
			End Set
		#tag EndSetter
		message As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function participants_ lib GameKitLib selector "participants" (obj_id as ptr) as ptr
			  Return new NSArray(participants_(self))
			End Get
		#tag EndGetter
		participants As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function status_ lib GameKitLib selector "status" (obj_id as ptr) as GKTurnBasedMatchStatus
			  Return (status_(self))
			End Get
		#tag EndGetter
		status As GKTurnBasedMatchStatus
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="exchangeDataMaximumSize"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="exchangeMaxInitiatedExchangesPerPlayer"
			Group="Behavior"
			Type="UInteger"
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
			Name="matchDataMaximumSize"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="matchID"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="message"
			Group="Behavior"
			Type="Text"
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
