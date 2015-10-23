#tag Class
Protected Class GKMatch
Inherits NSObject
	#tag Method, Flags = &h0
		Sub ChooseBestHostingPlayerWithCompletionHandler(completionHandler as GKPlayerCompletionHandler)
		  declare sub chooseBestHostingPlayerWithCompletionHandler_ lib GameKitLib selector "chooseBestHostingPlayerWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GKPlayerCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  chooseBestHostingPlayerWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKMatch")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  declare sub disconnect_ lib GameKitLib selector "disconnect" (obj_id as ptr)
		  disconnect_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RematchWithCompletionHandler(completionHandler as GKMatchCompletionHandler)
		  declare sub rematchWithCompletionHandler_ lib GameKitLib selector "rematchWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GKMatchCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  rematchWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendDataToAllPlayersWithDataModeError(data as NSData, mode as GKMatchSendDataMode, error as NSError) As Boolean
		  declare function sendDataToAllPlayers_ lib GameKitLib selector "sendDataToAllPlayers:withDataMode:error:" (obj_id as ptr, data as ptr, mode as GKMatchSendDataMode, error as ptr) as Boolean
		  if error <> nil then
		    Return sendDataToAllPlayers_(self, data, mode, error)
		  else
		    Return sendDataToAllPlayers_(self, data, mode, nil)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendDataToPlayersDataModeError(data as NSData, players as NSArray, mode as GKMatchSendDataMode, error as NSError) As Boolean
		  declare function sendData_ lib GameKitLib selector "sendData:toPlayers:dataMode:error:" (obj_id as ptr, data as ptr, players as ptr, mode as GKMatchSendDataMode, error as ptr) as Boolean
		  Return sendData_(self, data, players, mode, error)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VoiceChatWithName(name as CFStringRef) As GKVoiceChat
		  declare function voiceChatWithName_ lib GameKitLib selector "voiceChatWithName:" (obj_id as ptr, name as CFStringRef) as ptr
		  Return new GKVoiceChat(voiceChatWithName_(self, name))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function delegate_ lib GameKitLib selector "delegate" (obj_id as ptr) as ptr
			  Return (delegate_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub delegate_ lib GameKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
			  delegate_(self, value)
			End Set
		#tag EndSetter
		del As ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function expectedPlayerCount_ lib GameKitLib selector "expectedPlayerCount" (obj_id as ptr) as UInteger
			  Return expectedPlayerCount_(self)
			End Get
		#tag EndGetter
		expectedPlayerCount As UInteger
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


	#tag Enum, Name = GKMatchSendDataMode, Type = Integer, Flags = &h0
		Reliable = 0
		Unreliable = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="expectedPlayerCount"
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
