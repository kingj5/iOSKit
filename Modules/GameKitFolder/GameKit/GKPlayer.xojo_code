#tag Class
Protected Class GKPlayer
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKPlayer")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPhotoForSizeWithCompletionHandler(size as GKPhotoSize, completionHandler as iOSImageCompletionHandler)
		  declare sub loadPhotoForSize_ lib GameKitLib selector "loadPhotoForSize:withCompletionHandler:" (obj_id as ptr, size as GKPhotoSize, completionHandler as ptr)
		  dim handler as new GameKit.UIImageCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.Handler)
		  loadPhotoForSize_(self, size, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LoadPlayersForIdentifiersWithCompletionHandler(identifiers as NSArray, completionHandler as NSArrayCompletionHandler)
		  declare sub loadPlayersForIdentifiers_ lib GameKitLib selector "loadPlayersForIdentifiers:withCompletionHandler:" (clsRef as ptr, identifiers as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadPlayersForIdentifiers_(ClassRef, identifiers, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function alias_ lib GameKitLib selector "alias" (obj_id as ptr) as CFStringRef
			  Return alias_(self)
			End Get
		#tag EndGetter
		alias As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function displayName_ lib GameKitLib selector "displayName" (obj_id as ptr) as CFStringRef
			  Return displayName_(self)
			End Get
		#tag EndGetter
		displayName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function playerID_ lib GameKitLib selector "playerID" (obj_id as ptr) as CFStringRef
			  Return playerID_(self)
			End Get
		#tag EndGetter
		playerID As Text
	#tag EndComputedProperty


	#tag Enum, Name = GKPhotoSize, Type = Integer, Flags = &h0
		Small = 0
		Normal = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="alias"
			Group="Behavior"
			Type="Text"
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
	#tag EndViewBehavior
End Class
#tag EndClass
