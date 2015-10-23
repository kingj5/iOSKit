#tag Class
Protected Class GKGameCenterViewController
Inherits UIKit.UINavigationController
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKGameCenterViewController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor(Initialize(Allocate(ClassRef)))
		  
		  dim selfRef as Ptr = Initialize(Allocate(TargetClass))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(selfRef) = xojo.Core.WeakRef.Create(self)
		  
		  gameCenterDelegate = selfRef
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlegameCenterViewControllerDidFinish(gameCenterViewController as GKGameCenterViewController)
		  if observer <> nil then
		    observer.DidFinish(gameCenterViewController)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_gameCenterViewControllerDidFinish(pid as ptr, sel as ptr, gameCenterViewController as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    GKGameCenterViewController(w.value).HandlegameCenterViewControllerDidFinish(new GKGameCenterViewController(gameCenterViewController))
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("gameCenterViewControllerDidFinish:", AddressOf impl_gameCenterViewControllerDidFinish, "v:@")
		    targetID = BuildTargetClass("NSObject","MyGKGameCenterViewControllerDelegate",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  declare function gameCenterDelegate_ lib GameKitLib selector "gameCenterDelegate" (obj_id as ptr) as ptr
			  Return (gameCenterDelegate_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub gameCenterDelegate_ lib GameKitLib selector "setGameCenterDelegate:" (obj_id as ptr, gameCenterDelegate as ptr)
			  gameCenterDelegate_(self, value)
			End Set
		#tag EndSetter
		Private gameCenterDelegate As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function leaderboardIdentifier_ lib GameKitLib selector "leaderboardIdentifier" (obj_id as ptr) as CFStringRef
			  Return leaderboardIdentifier_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub leaderboardIdentifier_ lib GameKitLib selector "setLeaderboardIdentifier:" (obj_id as ptr, leaderboardIdentifier as CFStringRef)
			  leaderboardIdentifier_(self, value)
			End Set
		#tag EndSetter
		leaderboardIdentifier As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		observer As GKGameCenterViewControllerObserver
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function viewState_ lib GameKitLib selector "viewState" (obj_id as ptr) as GKGameCenterViewControllerState
			  Return (viewState_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub viewState_ lib GameKitLib selector "setViewState:" (obj_id as ptr, viewState as GKGameCenterViewControllerState)
			  viewState_(self, value)
			End Set
		#tag EndSetter
		viewState As GKGameCenterViewControllerState
	#tag EndComputedProperty


	#tag Enum, Name = GKGameCenterViewControllerState, Type = Integer, Flags = &h0
		Default = -1
		  Leaderboards = 0
		  Achievements = 1
		Challenges = 2
	#tag EndEnum


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
			Name="leaderboardIdentifier"
			Group="Behavior"
			Type="Text"
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
		#tag ViewProperty
			Name="viewState"
			Group="Behavior"
			Type="GKGameCenterViewControllerState"
			EditorType="Enum"
			#tag EnumValues
				"-1 - Default"
				"0 - Leaderboards"
				"1 - Achievements"
				"2 - Challenges"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
