#tag Class
Protected Class GKLocalPlayer
Inherits GameKit.GKPlayer
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKLocalPlayer")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteSavedGamesWithNameCompletionHandler(name as CFStringRef, handler as NSError)
		  declare sub deleteSavedGamesWithName_ lib GameKitLib selector "deleteSavedGamesWithName:completionHandler:" (obj_id as ptr, name as CFStringRef, handler as ptr)
		  deleteSavedGamesWithName_(self, name, handler)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FetchSavedGamesWithCompletionHandler(handler as NSArray)
		  declare sub fetchSavedGamesWithCompletionHandler_ lib GameKitLib selector "fetchSavedGamesWithCompletionHandler:" (obj_id as ptr, handler as ptr)
		  fetchSavedGamesWithCompletionHandler_(self, handler)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Incomplete = "If you would like me to complete this method callback please send me a PM" )  Sub GenerateIdentityVerificationSignatureWithCompletionHandler(completionHandler as ptr)
		  declare sub generateIdentityVerificationSignatureWithCompletionHandler_ lib GameKitLib selector "generateIdentityVerificationSignatureWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  generateIdentityVerificationSignatureWithCompletionHandler_(self, completionHandler)
		  
		  #Pragma warning "incomplete, do not use"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDefaultLeaderboardIdentifierWithCompletionHandler(completionHandler as TextCompletionHandler)
		  declare sub loadDefaultLeaderboardIdentifierWithCompletionHandler_ lib GameKitLib selector "loadDefaultLeaderboardIdentifierWithCompletionHandler:" (obj_id as ptr, completionHandler as Ptr)
		  dim handler as new TextCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadDefaultLeaderboardIdentifierWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadFriendPlayersWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadFriendPlayersWithCompletionHandler_ lib GameKitLib selector "loadFriendPlayersWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadFriendPlayersWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LocalPlayer() As GKLocalPlayer
		  declare function localPlayer_ lib GameKitLib selector "localPlayer" (clsRef as ptr) as ptr
		  Return new GKLocalPlayer(localPlayer_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterListener(listener as GKLocalPlayerListener)
		  declare sub registerListener_ lib GameKitLib selector "registerListener:" (obj_id as ptr, listener as ptr)
		  registerListener_(self, listener)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResolveConflictingSavedGamesWithDataCompletionHandler(conflictingSavedGames as NSArray, data as NSData, handler as NSArray)
		  declare sub resolveConflictingSavedGames_ lib GameKitLib selector "resolveConflictingSavedGames:withData:completionHandler:" (obj_id as ptr, conflictingSavedGames as ptr, data as ptr, handler as ptr)
		  resolveConflictingSavedGames_(self, conflictingSavedGames, data, handler)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveGameDataWithNameCompletionHandler(data as NSData, name as CFStringRef, handler as GKSavedGame)
		  declare sub saveGameData_ lib GameKitLib selector "saveGameData:withName:completionHandler:" (obj_id as ptr, data as ptr, name as CFStringRef, handler as ptr)
		  saveGameData_(self, data, name, handler)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDefaultLeaderboardIdentifierCompletionHandler(leaderboardIdentifier as CFStringRef, completionHandler as GameKit.NSErrorCompletionHandler)
		  declare sub setDefaultLeaderboardIdentifier_ lib GameKitLib selector "setDefaultLeaderboardIdentifier:completionHandler:" (obj_id as ptr, leaderboardIdentifier as CFStringRef, completionHandler as ptr)
		  dim wrapper as new GameKit.NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf wrapper.Handler)
		  setDefaultLeaderboardIdentifier_(self, leaderboardIdentifier, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterAllListeners()
		  declare sub unregisterAllListeners_ lib GameKitLib selector "unregisterAllListeners" (obj_id as ptr)
		  unregisterAllListeners_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterListener(listener as GKLocalPlayerListener)
		  declare sub unregisterListener_ lib GameKitLib selector "unregisterListener:" (obj_id as ptr, listener as ptr)
		  unregisterListener_(self, listener)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function authenticated_ lib GameKitLib selector "isAuthenticated" (obj_id as ptr) as Boolean
			  Return authenticated_(self)
			End Get
		#tag EndGetter
		authenticated As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function error_ lib GameKitLib selector "error" (obj_id as ptr) as Ptr
			  Return new NSError(error_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub error_ lib GameKitLib selector "setError:" (obj_id as ptr, error as ptr)
			  error_(self, value)
			End Set
		#tag EndSetter
		error As NSError
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function underage_ lib GameKitLib selector "isUnderage" (obj_id as ptr) as Boolean
			  Return underage_(self)
			End Get
		#tag EndGetter
		underage As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="alias"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="authenticated"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="displayName"
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
			Name="playerID"
			Group="Behavior"
			Type="Text"
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
			Name="underage"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
