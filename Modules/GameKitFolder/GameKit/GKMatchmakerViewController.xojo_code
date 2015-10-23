#tag Class
Protected Class GKMatchmakerViewController
Inherits UIKit.UINavigationController
	#tag Method, Flags = &h0
		Sub AddPlayersToMatch(match as GKMatch)
		  declare sub addPlayersToMatch_ lib GameKitLib selector "addPlayersToMatch:" (obj_id as ptr, match as ptr)
		  addPlayersToMatch_(self, match)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKMatchmakerViewController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(invite as GKInvite)
		  declare function initWithInvite_ lib GameKitLib selector "initWithInvite:" (obj_id as ptr, invite as ptr) as ptr
		  Super.Constructor( initWithInvite_(Allocate(ClassRef), invite) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(request as GKMatchRequest)
		  declare function initWithMatchRequest_ lib GameKitLib selector "initWithMatchRequest:" (obj_id as ptr, request as ptr) as ptr
		  Super.Constructor( initWithMatchRequest_(Allocate(ClassRef), request) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHostedPlayerDidConnect(player as GKPlayer, connected as Boolean)
		  declare sub setHostedPlayer_ lib GameKitLib selector "setHostedPlayer:didConnect:" (obj_id as ptr, player as ptr, connected as Boolean)
		  setHostedPlayer_(self, player, connected)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hosted_ lib GameKitLib selector "isHosted" (obj_id as ptr) as Boolean
			  Return hosted_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub hosted_ lib GameKitLib selector "setHosted:" (obj_id as ptr, hosted as Boolean)
			  hosted_(self, value)
			End Set
		#tag EndSetter
		hosted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function matchmakerDelegate_ lib GameKitLib selector "matchmakerDelegate" (obj_id as ptr) as ptr
			  Return (matchmakerDelegate_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub matchmakerDelegate_ lib GameKitLib selector "setMatchmakerDelegate:" (obj_id as ptr, matchmakerDelegate as ptr)
			  matchmakerDelegate_(self, value)
			End Set
		#tag EndSetter
		matchmakerDelegate As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function matchRequest_ lib GameKitLib selector "matchRequest" (obj_id as ptr) as ptr
			  Return new GKMatchRequest(matchRequest_(self))
			End Get
		#tag EndGetter
		matchRequest As GKMatchRequest
	#tag EndComputedProperty


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
			Name="hosted"
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
