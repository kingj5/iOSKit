#tag Class
Protected Class GKLeaderboard
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKLeaderboard")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  declare function init_ lib GameKitLib selector "init" (obj_id as ptr) as ptr
		  Super.Constructor( init_(Allocate(ClassRef)) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(players as NSArray)
		  declare function initWithPlayers_ lib GameKitLib selector "initWithPlayers:" (obj_id as ptr, players as ptr) as ptr
		  Super.Constructor( initWithPlayers_(Allocate(ClassRef), players) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadImageWithCompletionHandler(completionHandler as iOSImageCompletionHandler)
		  declare sub loadImageWithCompletionHandler_ lib GameKitLib selector "loadImageWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GameKit.UIImageCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.Handler)
		  loadImageWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LoadLeaderboardsWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadLeaderboardsWithCompletionHandler_ lib GameKitLib selector "loadLeaderboardsWithCompletionHandler:" (clsRef as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadLeaderboardsWithCompletionHandler_(ClassRef, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadScoresWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadScoresWithCompletionHandler_ lib GameKitLib selector "loadScoresWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadScoresWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function groupIdentifier_ lib GameKitLib selector "groupIdentifier" (obj_id as ptr) as CFStringRef
			  Return groupIdentifier_(self)
			End Get
		#tag EndGetter
		groupIdentifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function identifier_ lib GameKitLib selector "identifier" (obj_id as ptr) as CFStringRef
			  Return identifier_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub identifier_ lib GameKitLib selector "setIdentifier:" (obj_id as ptr, identifier as CFStringRef)
			  identifier_(self, value)
			End Set
		#tag EndSetter
		identifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function loading_ lib GameKitLib selector "isLoading" (obj_id as ptr) as Boolean
			  Return loading_(self)
			End Get
		#tag EndGetter
		loading As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function localPlayerScore_ lib GameKitLib selector "localPlayerScore" (obj_id as ptr) as ptr
			  Return new GKScore(localPlayerScore_(self))
			End Get
		#tag EndGetter
		localPlayerScore As GKScore
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maxRange_ lib GameKitLib selector "maxRange" (obj_id as ptr) as UInteger
			  Return maxRange_(self)
			End Get
		#tag EndGetter
		maxRange As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function playerScope_ lib GameKitLib selector "playerScope" (obj_id as ptr) as GKLeaderboardPlayerScope
			  Return (playerScope_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub playerScope_ lib GameKitLib selector "setPlayerScope:" (obj_id as ptr, playerScope as GKLeaderboardPlayerScope)
			  playerScope_(self, value)
			End Set
		#tag EndSetter
		playerScope As GKLeaderboardPlayerScope
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function range_ lib GameKitLib selector "range" (obj_id as ptr) as NSRange
			  Return (range_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub range_ lib GameKitLib selector "setRange:" (obj_id as ptr, range as NSRange)
			  range_(self, value)
			End Set
		#tag EndSetter
		range As NSRange
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function scores_ lib GameKitLib selector "scores" (obj_id as ptr) as ptr
			  Return new NSArray(scores_(self))
			End Get
		#tag EndGetter
		scores As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function timeScope_ lib GameKitLib selector "timeScope" (obj_id as ptr) as GKLeaderboardTimeScope
			  Return (timeScope_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub timeScope_ lib GameKitLib selector "setTimeScope:" (obj_id as ptr, timeScope as GKLeaderboardTimeScope)
			  timeScope_(self, value)
			End Set
		#tag EndSetter
		timeScope As GKLeaderboardTimeScope
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function title_ lib GameKitLib selector "title" (obj_id as ptr) as CFStringRef
			  Return title_(self)
			End Get
		#tag EndGetter
		title As Text
	#tag EndComputedProperty


	#tag Enum, Name = GKLeaderboardPlayerScope, Type = Integer, Flags = &h0
		Global_ = 0
		FriendsOnly = 1
	#tag EndEnum

	#tag Enum, Name = GKLeaderboardTimeScope, Type = Integer, Flags = &h0
		Today = 0
		  Week = 1
		Alltime = 2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="groupIdentifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="identifier"
			Group="Behavior"
			Type="Text"
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
			Name="loading"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="maxRange"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="playerScope"
			Group="Behavior"
			Type="GKLeaderboardPlayerScope"
			EditorType="Enum"
			#tag EnumValues
				"0 - Global_"
				"1 - FriendsOnly"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="timeScope"
			Group="Behavior"
			Type="GKLeaderboardTimeScope"
			EditorType="Enum"
			#tag EnumValues
				"0 - Today"
				"1 - Week"
				"2 - Alltime"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="title"
			Group="Behavior"
			Type="Text"
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
