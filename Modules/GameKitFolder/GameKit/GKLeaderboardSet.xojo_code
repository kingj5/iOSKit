#tag Class
Protected Class GKLeaderboardSet
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKLeaderboardSet")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadImageWithCompletionHandler(completionHandler as iOSImageCompletionHandler)
		  declare sub loadImageWithCompletionHandler_ lib GameKitLib selector "loadImageWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GameKit.UIImageCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.Handler)
		  loadImageWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LoadLeaderboardSetsWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadLeaderboardSetsWithCompletionHandler_ lib GameKitLib selector "loadLeaderboardSetsWithCompletionHandler:" (clsRef as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadLeaderboardSetsWithCompletionHandler_(ClassRef, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadLeaderboardsWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadLeaderboardsWithCompletionHandler_ lib GameKitLib selector "loadLeaderboardsWithCompletionHandler:" (obj_id as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadLeaderboardsWithCompletionHandler_(self, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function groupIdentifier_ lib GameKitLib selector "groupIdentifier" (obj_id as ptr) as CFStringRef
			  Return groupIdentifier_(self)
			End Get
		#tag EndGetter
		groupIdentifier As Text
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
			  declare function title_ lib GameKitLib selector "title" (obj_id as ptr) as CFStringRef
			  Return title_(self)
			End Get
		#tag EndGetter
		title As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="groupIdentifier"
			Group="Behavior"
			Type="Text"
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
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="title"
			Group="Behavior"
			Type="Text"
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
