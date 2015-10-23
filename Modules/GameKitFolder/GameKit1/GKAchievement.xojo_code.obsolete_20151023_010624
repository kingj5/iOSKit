#tag Class
Protected Class GKAchievement
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
		  static ref as ptr = NSClassFromString("GKAchievement")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(identifier as CFStringRef)
		  declare function initWithIdentifier_ lib GameKitLib selector "initWithIdentifier:" (obj_id as ptr, identifier as CFStringRef) as ptr
		  Super.Constructor( initWithIdentifier_(Allocate(ClassRef), identifier) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(identifier as CFStringRef, player as GKPlayer)
		  declare function initWithIdentifier_ lib GameKitLib selector "initWithIdentifier:player:" (obj_id as ptr, identifier as CFStringRef, player as ptr) as ptr
		  Super.Constructor( initWithIdentifier_(Allocate(ClassRef), identifier, player) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LoadAchievementsWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadAchievementsWithCompletionHandler_ lib GameKitLib selector "loadAchievementsWithCompletionHandler:" (clsRef as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadAchievementsWithCompletionHandler_(ClassRef, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ReportAchievementsWithCompletionHandler(achievements as NSArray, completionHandler as NSErrorCompletionHandler)
		  declare sub reportAchievements_ lib GameKitLib selector "reportAchievements:withCompletionHandler:" (clsRef as ptr, achievements as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  reportAchievements_(ClassRef, achievements, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ReportAchievementsWithEligibleChallengesWithCompletionHandler(achievements as NSArray, challenges as NSArray, completionHandler as NSErrorCompletionHandler)
		  declare sub reportAchievements_ lib GameKitLib selector "reportAchievements:withEligibleChallenges:withCompletionHandler:" (clsRef as ptr, achievements as ptr, challenges as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  reportAchievements_(ClassRef, achievements, challenges, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ResetAchievementsWithCompletionHandler(completionHandler as NSErrorCompletionHandler)
		  declare sub resetAchievementsWithCompletionHandler_ lib GameKitLib selector "resetAchievementsWithCompletionHandler:" (clsRef as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  resetAchievementsWithCompletionHandler_(ClassRef, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectChallengeablePlayersWithCompletionHandlerChallengePlayersToCompleteAchievement(players as NSArray, completionHandler as NSArrayCompletionHandler)
		  declare sub selectChallengeablePlayers_ lib GameKitLib selector "selectChallengeablePlayers:withCompletionHandler:" (obj_id as ptr, players as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  selectChallengeablePlayers_(self, players, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function completed_ lib GameKitLib selector "isCompleted" (obj_id as ptr) as Boolean
			  Return completed_(self)
			End Get
		#tag EndGetter
		completed As Boolean
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
			  declare function lastReportedDate_ lib GameKitLib selector "lastReportedDate" (obj_id as ptr) as ptr
			  Return new NSDate(lastReportedDate_(self))
			End Get
		#tag EndGetter
		lastReportedDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function percentComplete_ lib GameKitLib selector "percentComplete" (obj_id as ptr) as Double
			  Return percentComplete_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub percentComplete_ lib GameKitLib selector "setPercentComplete:" (obj_id as ptr, percentComplete as Double)
			  percentComplete_(self, value)
			End Set
		#tag EndSetter
		percentComplete As Double
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
			  declare function showsCompletionBanner_ lib GameKitLib selector "showsCompletionBanner" (obj_id as ptr) as Boolean
			  Return showsCompletionBanner_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub showsCompletionBanner_ lib GameKitLib selector "setShowsCompletionBanner:" (obj_id as ptr, showsCompletionBanner as Boolean)
			  showsCompletionBanner_(self, value)
			End Set
		#tag EndSetter
		showsCompletionBanner As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="completed"
			Group="Behavior"
			Type="Boolean"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="percentComplete"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="showsCompletionBanner"
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
