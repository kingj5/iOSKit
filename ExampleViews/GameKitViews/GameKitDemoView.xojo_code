#tag IOSView
Begin iosView GameKitDemoView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   "2"
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "GameKit Demo"
   Top             =   0
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   Label1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Choose a game type:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 176, , True
      AutoLayout      =   Button1, 3, <Parent>, 3, False, +1.00, 1, 1, 83, , True
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, , True
      Caption         =   "Standard Head to Head"
      Enabled         =   True
      Height          =   30.0
      Left            =   72
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   83
      Visible         =   True
      Width           =   176.0
   End
   Begin iOSButton Button2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button2, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Button2, 3, <Parent>, 3, False, +1.00, 1, 1, 148, , True
      AutoLayout      =   Button2, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Button2, 8, , 0, False, +1.00, 1, 1, 30, , True
      Caption         =   "Turn Based"
      Enabled         =   False
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   148
      Visible         =   False
      Width           =   100.0
   End
   Begin GameKit.GKLocalPlayerListener GKLocalPlayerListener1
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   1
      Top             =   0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Close()
		  'stop receiving notifications about gamekit
		  NotificationCenter.MainCenter.removeObserver(self)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  //register for the authenticate Notification - if the player is not authenticated a view controller will have to be presented for the user to log in
		  NotificationCenter.MainCenter.addObserver(self, AddressOf TryAuthenticate, AuthenticationHelper.GameKitNeedsToAuthenticateNotification, nil)
		  
		  NotificationCenter.MainCenter.addObserver(self, AddressOf DidAuthenticate, AuthenticationHelper.GameKitSucessfullyAuthenticatedNotification, nil)
		  
		  //start the authentication process
		  //this method must be called in order for GameKit to begin the authentication process
		  //you must set the notifications up first
		  call AuthenticationHelper.GetInstance
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub DidAuthenticate(aNotification as Notification)
		  GameKit.GKLocalPlayer.LocalPlayer.UnregisterAllListeners
		  GameKit.GKLocalPlayer.LocalPlayer.RegisterListener(GKLocalPlayerListener1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TryAuthenticate(aNotification as Notification)
		  dim helper as AuthenticationHelper = AuthenticationHelper.GetInstance
		  if helper.NeedsToAuthenticate then
		    helper.PresentAuthenticationViewController(self)
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Using, Name = GameKit
	#tag EndUsing


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Action()
		  self.PushTo(new StandardGame)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button2
	#tag Event
		Sub Action()
		  'self.PushTo(new TurnBasedGame)
		  'this example is in progress
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GKLocalPlayerListener1
	#tag Event
		Sub PlayerDidAcceptInvite(player as GKPlayer, invite as GKInvite)
		  System.DebugLog "accept invite"
		  Break
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlayerDidRequestMatchWithOtherPlayers(player as GKPlayer, playersToInvite as NSArray)
		  System.DebugLog "request with others"
		  Break
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlayerDidRequestMatchWithRecipients(player as GKPlayer, recipientPlayers as NSArray)
		  System.DebugLog "request with recipients"
		  Break
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
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="NavigationBarVisible"
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
		Name="TabIcon"
		Group="Behavior"
		Type="iOSImage"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
