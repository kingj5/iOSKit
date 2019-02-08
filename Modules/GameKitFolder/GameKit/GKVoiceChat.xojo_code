#tag Class
Protected Class GKVoiceChat
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKVoiceChat")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsVoIPAllowed() As Boolean
		  declare function isVoIPAllowed_ lib GameKitLib selector "isVoIPAllowed" (clsRef as ptr) as Boolean
		  Return isVoIPAllowed_(ClassRef)
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub PlayerVoiceChatStateDidChange(player as GameKit . GKPlayer, state as ChatState)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetPlayerMuted(player as GKPlayer, isMuted as Boolean)
		  declare sub setPlayer_ lib GameKitLib selector "setPlayer:muted:" (obj_id as ptr, player as ptr, isMuted as Boolean)
		  setPlayer_(self, player, isMuted)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  declare sub start_ lib GameKitLib selector "start" (obj_id as ptr)
		  start_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  declare sub stop_ lib GameKitLib selector "stop" (obj_id as ptr)
		  stop_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub voiceChatStateChanged(player as ptr, state as ChatState)
		  playerVoiceChatStateChangedHandler.Invoke(new GameKit.GKPlayer(player), state)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function active_ lib GameKitLib selector "isActive" (obj_id as ptr) as Boolean
			  Return active_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub active_ lib GameKitLib selector "setActive:" (obj_id as ptr, active as Boolean)
			  active_(self, value)
			End Set
		#tag EndSetter
		active As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mplayerVoiceChatStateChangedHandler As PlayerVoiceChatStateDidChange
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function name_ lib GameKitLib selector "name" (obj_id as ptr) as CFStringRef
			  Return name_(self)
			End Get
		#tag EndGetter
		name As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function players_ lib GameKitLib selector "players" (obj_id as ptr) as ptr
			  Return new NSArray(players_(self))
			End Get
		#tag EndGetter
		players As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mplayerVoiceChatStateChangedHandler
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mplayerVoiceChatStateChangedHandler = value
			  
			  
			  declare sub setPlayerVoiceChatStateDidChangeHandler lib GameKitLib selector _
			  "setPlayerVoiceChatStateDidChangeHandler:" (obj_id as ptr, handler as ptr)
			  if mplayerVoiceChatStateChangedHandler = nil then
			    setPlayerVoiceChatStateDidChangeHandler(self,nil)
			  else
			    dim blk as new iOSBlock(AddressOf voiceChatStateChanged)
			    setPlayerVoiceChatStateDidChangeHandler(self, blk.Handle)
			  end if
			End Set
		#tag EndSetter
		playerVoiceChatStateChangedHandler As PlayerVoiceChatStateDidChange
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function volume_ lib GameKitLib selector "volume" (obj_id as ptr) as Double
			  Return (volume_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub volume_ lib GameKitLib selector "setVolume:" (obj_id as ptr, volume as Double)
			  volume_(self, value)
			End Set
		#tag EndSetter
		volume As Double
	#tag EndComputedProperty


	#tag Enum, Name = ChatState, Type = Integer, Flags = &h0
		Connected
		  Disconnected
		  Speaking
		  Silent
		Connecting
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="active"
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
		#tag ViewProperty
			Name="volume"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
