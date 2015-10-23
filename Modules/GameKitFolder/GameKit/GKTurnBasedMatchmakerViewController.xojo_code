#tag Class
Protected Class GKTurnBasedMatchmakerViewController
Inherits UIKit.UINavigationController
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKTurnBasedMatchmakerViewController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(request as GKMatchRequest)
		  declare function initWithMatchRequest_ lib GameKitLib selector "initWithMatchRequest:" (obj_id as ptr, request as ptr) as ptr
		  Super.Constructor( initWithMatchRequest_(Allocate(ClassRef), request) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function showExistingMatches_ lib GameKitLib selector "showExistingMatches" (obj_id as ptr) as Boolean
			  Return showExistingMatches_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub showExistingMatches_ lib GameKitLib selector "setShowExistingMatches:" (obj_id as ptr, showExistingMatches as Boolean)
			  showExistingMatches_(self, value)
			End Set
		#tag EndSetter
		showExistingMatches As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function turnBasedMatchmakerDelegate_ lib GameKitLib selector "turnBasedMatchmakerDelegate" (obj_id as ptr) as ptr
			  Return (turnBasedMatchmakerDelegate_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub turnBasedMatchmakerDelegate_ lib GameKitLib selector "setTurnBasedMatchmakerDelegate:" (obj_id as ptr, turnBasedMatchmakerDelegate as ptr)
			  turnBasedMatchmakerDelegate_(self, value)
			End Set
		#tag EndSetter
		turnBasedMatchmakerDelegate As Ptr
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
			Name="showExistingMatches"
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
