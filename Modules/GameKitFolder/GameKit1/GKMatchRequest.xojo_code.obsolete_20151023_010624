#tag Class
Protected Class GKMatchRequest
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKMatchRequest")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(ClassRef)))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MaxPlayersAllowedForMatchOfType(matchType as GKMatchType) As UInteger
		  declare function maxPlayersAllowedForMatchOfType_ lib GameKitLib selector "maxPlayersAllowedForMatchOfType:" (clsRef as ptr, matchType as GKMatchType) as UInteger
		  Return maxPlayersAllowedForMatchOfType_(ClassRef, matchType)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function defaultNumberOfPlayers_ lib GameKitLib selector "defaultNumberOfPlayers" (obj_id as ptr) as UInteger
			  Return defaultNumberOfPlayers_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub defaultNumberOfPlayers_ lib GameKitLib selector "setDefaultNumberOfPlayers:" (obj_id as ptr, defaultNumberOfPlayers as UInteger)
			  defaultNumberOfPlayers_(self, value)
			End Set
		#tag EndSetter
		defaultNumberOfPlayers As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inviteMessage_ lib GameKitLib selector "inviteMessage" (obj_id as ptr) as CFStringRef
			  Return inviteMessage_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub inviteMessage_ lib GameKitLib selector "setInviteMessage:" (obj_id as ptr, inviteMessage as CFStringRef)
			  inviteMessage_(self, value)
			End Set
		#tag EndSetter
		inviteMessage As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maxPlayers_ lib GameKitLib selector "maxPlayers" (obj_id as ptr) as UInteger
			  Return maxPlayers_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub maxPlayers_ lib GameKitLib selector "setMaxPlayers:" (obj_id as ptr, maxPlayers as UInteger)
			  maxPlayers_(self, value)
			End Set
		#tag EndSetter
		maxPlayers As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function minPlayers_ lib GameKitLib selector "minPlayers" (obj_id as ptr) as UInteger
			  Return minPlayers_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub minPlayers_ lib GameKitLib selector "setMinPlayers:" (obj_id as ptr, minPlayers as UInteger)
			  minPlayers_(self, value)
			End Set
		#tag EndSetter
		minPlayers As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function playerAttributes_ lib GameKitLib selector "playerAttributes" (obj_id as ptr) as UInt32
			  Return (playerAttributes_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub playerAttributes_ lib GameKitLib selector "setPlayerAttributes:" (obj_id as ptr, playerAttributes as UInt32)
			  playerAttributes_(self, value)
			End Set
		#tag EndSetter
		playerAttributes As uint32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function playerGroup_ lib GameKitLib selector "playerGroup" (obj_id as ptr) as UInteger
			  Return playerGroup_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub playerGroup_ lib GameKitLib selector "setPlayerGroup:" (obj_id as ptr, playerGroup as UInteger)
			  playerGroup_(self, value)
			End Set
		#tag EndSetter
		playerGroup As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function recipients_ lib GameKitLib selector "recipients" (obj_id as ptr) as ptr
			  Return new NSArray(recipients_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub recipients_ lib GameKitLib selector "setRecipients:" (obj_id as ptr, recipients as ptr)
			  recipients_(self, value)
			End Set
		#tag EndSetter
		recipients As NSArray
	#tag EndComputedProperty


	#tag Enum, Name = GKMatchType, Type = Integer, Flags = &h0
		PeerToPeer = 0
		  Hosted = 1
		TurnBased = 2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="defaultNumberOfPlayers"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="inviteMessage"
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
			Name="maxPlayers"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="minPlayers"
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
			Name="playerAttributes"
			Group="Behavior"
			Type="uint32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="playerGroup"
			Group="Behavior"
			Type="UInteger"
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
