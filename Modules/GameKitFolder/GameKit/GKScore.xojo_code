#tag Class
Protected Class GKScore
Inherits NSObject
	#tag Method, Flags = &h0
		Function ChallengeComposeControllerWithMessagePlayersCompletionHandler(message as CFStringRef, players as NSArray, completionHandler as GKChallengeComposeCompletionBlock) As UIViewController
		  declare function challengeComposeControllerWithMessage_ lib GameKitLib selector "challengeComposeControllerWithMessage:players:completionHandler:" (obj_id as ptr, message as CFStringRef, players as ptr, completionHandler as ptr) as ptr
		  dim blk as new iOSBlock(completionHandler)
		  Return new UIViewController(challengeComposeControllerWithMessage_(self, message, players, blk.Handle))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKScore")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(leaderboardID as Text)
		  declare function initWithLeaderboardIdentifier_ lib GameKitLib selector "initWithLeaderboardIdentifier:" (obj_id as ptr, initializer as CFStringRef) as ptr
		  Super.Constructor( initWithLeaderboardIdentifier_(Allocate(ClassRef), leaderboardID) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(identifier as Text, player as GKPlayer)
		  declare function initWithLeaderboardIdentifier_ lib GameKitLib selector "initWithLeaderboardIdentifier:player:" (obj_id as ptr, identifier as CFStringRef, player as ptr) as ptr
		  Super.Constructor( initWithLeaderboardIdentifier_(Allocate(ClassRef), identifier, player) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ReportScoresWithCompletionHandler(scores as NSArray, completionHandler as NSErrorCompletionHandler)
		  declare sub reportScores_ lib GameKitLib selector "reportScores:withCompletionHandler:" (clsRef as ptr, scores as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  reportScores_(ClassRef, scores, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ReportScoresWithEligibleChallengesWithCompletionHandler(scores as NSArray, challenges as NSArray, completionHandler as NSErrorCompletionHandler)
		  declare sub reportScores_ lib GameKitLib selector "reportScores:withEligibleChallenges:withCompletionHandler:" (clsRef as ptr, scores as ptr, challenges as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  reportScores_(ClassRef, scores, challenges, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function context_ lib GameKitLib selector "context" (obj_id as ptr) as UInt64
			  Return (context_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub context_ lib GameKitLib selector "setContext:" (obj_id as ptr, context as UInt64)
			  context_(self, value)
			End Set
		#tag EndSetter
		context As uint64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function date_ lib GameKitLib selector "date" (obj_id as ptr) as ptr
			  Return new NSDate(date_(self))
			End Get
		#tag EndGetter
		date As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function formattedValue_ lib GameKitLib selector "formattedValue" (obj_id as ptr) as CFStringRef
			  Return formattedValue_(self)
			End Get
		#tag EndGetter
		formattedValue As Text
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function player_ lib GameKitLib selector "player" (obj_id as ptr) as ptr
			  Return new GKPlayer(player_(self))
			End Get
		#tag EndGetter
		player As GKPlayer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function rank_ lib GameKitLib selector "rank" (obj_id as ptr) as Integer
			  Return rank_(self)
			End Get
		#tag EndGetter
		rank As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function shouldSetDefaultLeaderboard_ lib GameKitLib selector "shouldSetDefaultLeaderboard" (obj_id as ptr) as Boolean
			  Return shouldSetDefaultLeaderboard_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub shouldSetDefaultLeaderboard_ lib GameKitLib selector "setShouldSetDefaultLeaderboard:" (obj_id as ptr, shouldSetDefaultLeaderboard as Boolean)
			  shouldSetDefaultLeaderboard_(self, value)
			End Set
		#tag EndSetter
		shouldSetDefaultLeaderboard As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function value_ lib GameKitLib selector "value" (obj_id as ptr) as Int64
			  Return (value_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub value_ lib GameKitLib selector "setValue:" (obj_id as ptr, value as Int64)
			  value_(self, value)
			End Set
		#tag EndSetter
		value As int64
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="context"
			Group="Behavior"
			Type="uint64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="formattedValue"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rank"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="shouldSetDefaultLeaderboard"
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
			Name="value"
			Group="Behavior"
			Type="int64"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
