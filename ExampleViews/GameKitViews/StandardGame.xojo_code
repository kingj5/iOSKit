#tag IOSView
Begin iosView StandardGame Implements StandardMatchHelperObserver
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Standard Game"
   Top             =   0
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Button1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, , True
      Caption         =   "Find Match"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 8, <Parent>, 7, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 3, Button1, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      Height          =   320.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   111
      Visible         =   True
      Width           =   320.0
   End
   Begin xojo.Core.Timer Timer1
      Left            =   0
      LockedInPosition=   False
      Mode            =   2
      PanelIndex      =   -1
      Parent          =   ""
      Period          =   10
      Scope           =   0
      Tolerance       =   0
      Top             =   0
   End
   Begin GameKit.GKLocalPlayerListener GKLocalPlayerListener1
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   1
      Top             =   0
   End
   Begin iOSButton Button2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button2, 2, Button1, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Button2, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Button2, 4, <Parent>, 4, False, +1.00, 2, 1, -*kStdGapCtlToViewV, , True
      AutoLayout      =   Button2, 1, Button1, 1, False, +1.00, 1, 1, 0, , True
      Caption         =   "Start Chat"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   518
      Visible         =   True
      Width           =   100.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  //make ourself the observer so that we know what is happening with the game
		  StandardMatchHelper.GetInstance.SetObserver(self)
		  
		  
		  GameKit.GKLocalPlayer.LocalPlayer.UnregisterAllListeners
		  GameKit.GKLocalPlayer.LocalPlayer.RegisterListener(GKLocalPlayerListener1)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function DeSerializePoint(data as Foundation.NSData) As xojo.Core.Point
		  dim mb as MemoryBlock = data.DataMB
		  dim x, y, s as Int32
		  s = mb.Int32Value(8)
		  x = mb.Int32Value(0)/s*self.Size.Width
		  y = mb.Int32Value(4)/s*self.Size.Width
		  dim result as new xojo.Core.Point(x,y)
		  
		  Return result
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MatchDidFailWithError(match as GameKit.GKMatch, err as Foundation.NSError)
		  // Part of the StandardMatchHelperObserver interface.
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MatchDidReceiveData(match as GameKit.GKMatch, data as NSData, player as GameKit.GKPlayer)
		  // Part of the StandardMatchHelperObserver interface.
		  
		  dim pt as xojo.Core.Point = DeSerializePoint(data)
		  if pt.X < 0 then
		    otherPoint = nil
		  Else
		    otherPoint = pt
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MatchPlayerDidChangeConnectionState(match as GameKit.GKMatch, player as GameKit.GKPlayer, state as Integer)
		  // Part of the StandardMatchHelperObserver interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatchShouldReinviteDisconnectedPlayer(match as GameKit.GKMatch, player as GameKit.GKPlayer) As Boolean
		  // Part of the StandardMatchHelperObserver interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PlayerChatStateChanged(player as GameKit.GKPlayer, state as GameKit.GKVoiceChat.ChatState)
		  if state = GameKit.GKVoiceChat.ChatState.Connected then
		    GameKit.GKNotificationBanner.ShowBannerWithTitleMessageCompletionHandler(player.displayName + " joined the chat","",nil)
		  elseif state = GameKit.GKVoiceChat.ChatState.Disconnected then
		    GameKit.GKNotificationBanner.ShowBannerWithTitleMessageCompletionHandler(player.displayName + " left the chat","",nil)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SendPoint(pos as xojo.Core.Point)
		  if StandardMatchHelper.GetInstance.HasMatch then
		    dim data as Foundation.NSData = SerializePoint(pos)
		    call StandardMatchHelper.GetInstance.match.SendDataToAllPlayersWithDataModeError(data, GameKit.GKMatch.GKMatchSendDataMode.Reliable, nil)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SerializePoint(pt as xojo.Core.Point) As Foundation.NSData
		  
		  dim mb as new MutableMemoryBlock(12)
		  mb.Int32Value(0) = pt.X //x value of point
		  mb.Int32Value(4) = pt.Y //y value of point
		  mb.Int32Value(8) = self.Size.Width //width of screen for scaling
		  dim result as new Foundation.NSData(mb, mb.Size)
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerDidFailWithError(viewController as GameKit.GKMatchmakerViewController, error as NSError)
		  // Part of the StandardMatchHelperObserver interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerDidFindHostedPlayers(viewController as GameKit.GKMatchmakerViewController, players as NSArray)
		  // Part of the StandardMatchHelperObserver interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerDidFindMatch(viewController as GameKit.GKMatchmakerViewController, match as GameKit.GKMatch)
		  // Part of the StandardMatchHelperObserver interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerHostedPlayerDidAccept(viewController as GameKit.GKMatchmakerViewController, player as GameKit.GKPlayer)
		  // Part of the StandardMatchHelperObserver interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewControllerWasCancelled(viewController as GameKit.GKMatchmakerViewController)
		  // Part of the StandardMatchHelperObserver interface.
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		chat As GameKit.GKVoiceChat
	#tag EndProperty

	#tag Property, Flags = &h0
		myPoint As xojo.Core.Point
	#tag EndProperty

	#tag Property, Flags = &h0
		otherPoint As Xojo.core.point
	#tag EndProperty


	#tag Constant, Name = OvalSize, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant


	#tag Using, Name = GameKit
	#tag EndUsing


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  
		  if AuthenticationHelper.GetInstance.GameCenterEnabled then
		    StandardMatchHelper.GetInstance.FindMatch(2,2,self)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As iOSGraphics)
		  g.FillColor = Color.Black
		  g.FillRect 0,0, g.Width, g.Height
		  
		  if myPoint <> nil then
		    g.FillColor = Color.Red
		    g.FillOval myPoint.X-OvalSize/2, myPoint.Y-OvalSize/2, OvalSize, OvalSize
		  end if
		  
		  if otherPoint <> nil then
		    g.FillColor = Color.Yellow
		    g.FillOval otherPoint.X-OvalSize/2, otherPoint.Y-OvalSize/2, OvalSize, OvalSize
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointerDown(pos As Xojo.Core.Point, eventInfo As iOSEventInfo)
		  myPoint = pos
		  
		  SendPoint(pos)
		  
		  me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointerUp(pos As Xojo.Core.Point, eventInfo As iOSEventInfo)
		  myPoint = nil
		  
		  SendPoint(new xojo.Core.Point(-1,-1))
		  
		  me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointerDrag(pos As Xojo.Core.Point, eventInfo As iOSEventInfo)
		  myPoint = pos
		  SendPoint(pos)
		  
		  me.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  Canvas1.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GKLocalPlayerListener1
	#tag Event
		Sub PlayerDidAcceptInvite(player as GKPlayer, invite as GKInvite)
		  StandardMatchHelper.GetInstance.FindMatch(invite, self)
		  
		  System.DebugLog "player accepted invite"
		  
		  Break
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlayerDidRequestMatchWithOtherPlayers(player as GKPlayer, playersToInvite as NSArray)
		  //for turn based games - wont trigger in this view
		  
		  System.DebugLog "player requested match with other players"
		  
		  Break
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlayerDidRequestMatchWithRecipients(player as GKPlayer, recipientPlayers as NSArray)
		  //for standard match games
		  StandardMatchHelper.GetInstance.FindMatch(recipientPlayers, self)
		  
		  System.DebugLog "player requested match with recipients"
		  
		  Break
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button2
	#tag Event
		Sub Action()
		  //for some reason I can't get this to work, if you manage to, please let me know where I went wrong so the example can be updated
		  
		  'if not GameKit.GKVoiceChat.IsVoIPAllowed then 
		  'MsgBox "Voice chat not allowed"
		  'Return
		  'end if
		  '
		  'if StandardMatchHelper.GetInstance.match = nil then Return //we dont have an opponent yet
		  '
		  'if me.Caption = "Start Chat" then
		  'dim session as AVFoundation.AVAudioSession = AVFoundation.AVAudioSession.SharedInstance
		  'dim tmpErr as Foundation.NSError
		  'call session.SetCategory(AVFoundation.AVStringConstant("AVAudioSessionCategoryPlayAndRecord"), tmpErr)
		  'call session.SetActive(True, tmpErr)
		  '
		  'chat = StandardMatchHelper.GetInstance.match.VoiceChatWithName("defaultChat")
		  'chat.playerVoiceChatStateChangedHandler = AddressOf PlayerChatStateChanged
		  'chat.volume = 1.0
		  'chat.active = True
		  'chat.Start
		  '
		  'me.Caption = "Stop Chat"
		  'else
		  'chat.active = False
		  'chat.Stop
		  'me.Caption = "Start Chat"
		  'end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="LargeTitleMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
