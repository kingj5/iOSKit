#tag Interface
Protected Interface StandardMatchHelperObserver
	#tag Method, Flags = &h0
		Sub MatchDidFailWithError(match as GameKit.GKMatch, err as Foundation.NSError)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MatchDidReceiveData(match as GameKit.GKMatch, data as NSData, player as GameKit.GKPlayer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MatchPlayerDidChangeConnectionState(match as GameKit.GKMatch, player as GameKit.GKPlayer, state as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatchShouldReinviteDisconnectedPlayer(match as GameKit.GKMatch, player as GameKit.GKPlayer) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerDidFailWithError(viewController as GameKit.GKMatchmakerViewController, error as NSError)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerDidFindHostedPlayers(viewController as GameKit.GKMatchmakerViewController, players as NSArray)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerDidFindMatch(viewController as GameKit.GKMatchmakerViewController, match as GameKit.GKMatch)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerHostedPlayerDidAccept(viewController as GameKit.GKMatchmakerViewController, player as GameKit.GKPlayer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerWasCancelled(viewController as GameKit.GKMatchmakerViewController)
		  
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
End Interface
#tag EndInterface
