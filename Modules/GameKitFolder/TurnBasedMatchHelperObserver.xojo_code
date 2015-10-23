#tag Interface
Protected Interface TurnBasedMatchHelperObserver
	#tag Method, Flags = &h0
		Sub ViewControllerDidFailWithError(viewController as GameKit.GKTurnBasedMatchmakerViewController, error as Foundation.NSError)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerDidFindMatch(viewController as GameKit.GKTurnBasedMatchmakerViewController, match as GameKit.GKTurnBasedMatch)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerPlayerQuitForMatch(viewController as GameKit.GKTurnBasedMatchmakerViewController, match as GameKit.GKTurnBasedMatch)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerWasCancelled(viewController as GameKit.GKTurnBasedMatchmakerViewController)
		  
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
