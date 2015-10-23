#tag Class
Protected Class GKAchievementDescription
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKAchievementDescription")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IncompleteAchievementImage() As iOSImage
		  declare function incompleteAchievementImage_ lib GameKitLib selector "incompleteAchievementImage" (clsRef as ptr) as ptr
		  Return iOSImage.FromHandle(incompleteAchievementImage_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LoadAchievementDescriptionsWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadAchievementDescriptionsWithCompletionHandler_ lib GameKitLib selector "loadAchievementDescriptionsWithCompletionHandler:" (clsRef as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadAchievementDescriptionsWithCompletionHandler_(ClassRef, blk.Handle) 
		End Sub
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
		 Shared Function PlaceholderCompletedAchievementImage() As iOSImage
		  declare function placeholderCompletedAchievementImage_ lib GameKitLib selector "placeholderCompletedAchievementImage" (clsRef as ptr) as ptr
		  Return iOSImage.FromHandle(placeholderCompletedAchievementImage_(ClassRef))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function achievedDescription_ lib GameKitLib selector "achievedDescription" (obj_id as ptr) as CFStringRef
			  Return achievedDescription_(self)
			End Get
		#tag EndGetter
		achievedDescription As Text
	#tag EndComputedProperty

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
			  declare function hidden_ lib GameKitLib selector "isHidden" (obj_id as ptr) as Boolean
			  Return hidden_(self)
			End Get
		#tag EndGetter
		hidden As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function identifier_ lib GameKitLib selector "identifier" (obj_id as ptr) as CFStringRef
			  Return identifier_(self)
			End Get
		#tag EndGetter
		identifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maximumPoints_ lib GameKitLib selector "maximumPoints" (obj_id as ptr) as Integer
			  Return maximumPoints_(self)
			End Get
		#tag EndGetter
		maximumPoints As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function replayable_ lib GameKitLib selector "isReplayable" (obj_id as ptr) as Boolean
			  Return replayable_(self)
			End Get
		#tag EndGetter
		replayable As Boolean
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function unachievedDescription_ lib GameKitLib selector "unachievedDescription" (obj_id as ptr) as CFStringRef
			  Return unachievedDescription_(self)
			End Get
		#tag EndGetter
		unachievedDescription As CFStringRef
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="achievedDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="groupIdentifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hidden"
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
			Name="maximumPoints"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="replayable"
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
