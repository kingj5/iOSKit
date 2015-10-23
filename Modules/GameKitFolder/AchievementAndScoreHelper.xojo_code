#tag Class
Protected Class AchievementAndScoreHelper
Implements GameKit.GKGameCenterViewControllerObserver
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DidFinish(sender as GameKit.GKGameCenterViewController)
		  // Part of the GameKit.GKGameCenterViewControllerObserver interface.
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(mParentView.ViewControllerHandle, True, nil)
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayLeaderboard(inView as iOSView, leaderboardID as Text = "")
		  dim gameCenterController as new GameKit.GKGameCenterViewController
		  gameCenterController.observer = self
		  if leaderboardID <> "" then
		    gameCenterController.leaderboardIdentifier = leaderboardID
		  end if
		  gameCenterController.viewState = GameKit.GKGameCenterViewController.GKGameCenterViewControllerState.Leaderboards
		  
		  gameCenterController.PresentViewControllerAnimatedCompletion(inView.ViewControllerHandle, True, nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetInstance() As AchievementAndScoreHelper
		  static instance as new AchievementAndScoreHelper
		  Return instance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReportAchievement(identifier as Text, percentComplete as Double, compHandler as NSErrorCompletionHandler)
		  dim achievement as new GameKit.GKAchievement(identifier)
		  achievement.percentComplete = percentComplete
		  if percentComplete >= 100.0 then
		    achievement.showsCompletionBanner = True
		  end if
		  
		  dim arr as Foundation.NSArray = Foundation.NSArray.CreateWithObject(achievement)
		  GameKit.GKAchievement.ReportAchievementsWithCompletionHandler(arr, compHandler)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReportScore(aScore as Int64, leaderboardID as Text, compHandler as NSErrorCompletionHandler)
		  dim score as new GameKit.GKScore(leaderboardID)
		  score.value = aScore
		  score.context = 0
		  
		  dim arr as Foundation.NSArray = Foundation.NSArray.CreateWithObject(score)
		  GameKit.GKScore.ReportScoresWithCompletionHandler(arr, compHandler)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mParentView As iOSView
	#tag EndProperty


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
End Class
#tag EndClass
