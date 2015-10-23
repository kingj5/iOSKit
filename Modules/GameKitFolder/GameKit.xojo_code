#tag Module
Protected Module GameKit
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub GKChallengeComposeCompletionBlock(viewController as ptr, didIssueChallenge as Boolean, sentPlayerIDsArray as ptr)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub GKMatchCompletionHandler(match as GameKit . GKMatch, err as Foundation . NSError)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub GKPlayerCompletionHandler(player as GameKit . GKPlayer, err as Foundation . NSError)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub GKTurnbasedExchangeCompletionHandler(exchange as GameKit . GKTurnBasedExchange, err as Foundation . NSError)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub GKTurnbasedMatchCompletionHandler(match as GameKit . GKTurnbasedMatch, err as Foundation . NSError)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub IntegerCompletionHandler(activity as integer, err as Foundation . NSError)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub iOSImageCompletionHandler(img as iOSImage, err as Foundation . NSError)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NSArrayCompletionHandler(arr as Foundation . NSArray, err as Foundation . NSError)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NSDataCompletionHandler(data as Foundation . NSData)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NSErrorCompletionHandler(err as Foundation . NSError)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub TextCompletionHandler(identifier as Text, err as Foundation . NSError)
	#tag EndDelegateDeclaration


	#tag Constant, Name = GameKitLib, Type = Text, Dynamic = False, Default = \"GameKit.framework", Scope = Public
	#tag EndConstant


	#tag Enum, Name = GKTurnBasedExchangeStatus, Type = Int8, Flags = &h0
		Unknown = 0
		  Active = 1
		  Complete = 2
		  Resolved = 3
		Cancelled = 4
	#tag EndEnum

	#tag Enum, Name = GKTurnBasedMatchOutcome, Type = Integer, Flags = &h0
		None = 0
		  Quit = 1
		  Won = 2
		  Lost = 3
		  Tied = 4
		  TimeExpired = 5
		  First = 6
		  Second = 7
		  Third = 8
		Fourth = 9
	#tag EndEnum

	#tag Enum, Name = GKTurnBasedMatchStatus, Type = Integer, Flags = &h0
		Unknown = 0
		  Open = 1
		  Ended = 2
		Matching = 3
	#tag EndEnum

	#tag Enum, Name = GKTurnBasedParticipantStatus, Type = Integer, Flags = &h0
		Unknown = 0
		  Invited = 1
		  Declined = 2
		  Matching = 3
		  Active = 4
		Done = 5
	#tag EndEnum


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
End Module
#tag EndModule
