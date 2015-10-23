#tag Class
Protected Class GKChallenge
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKChallenge")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Decline()
		  declare sub decline_ lib GameKitLib selector "decline" (obj_id as ptr)
		  decline_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LoadReceivedChallengesWithCompletionHandler(completionHandler as NSArrayCompletionHandler)
		  declare sub loadReceivedChallengesWithCompletionHandler_ lib GameKitLib selector "loadReceivedChallengesWithCompletionHandler:" (clsRef as ptr, completionHandler as ptr)
		  dim handler as new GameKit.NSArrayCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  loadReceivedChallengesWithCompletionHandler_(ClassRef, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function completionDate_ lib GameKitLib selector "completionDate" (obj_id as ptr) as ptr
			  Return new NSDate(completionDate_(self))
			End Get
		#tag EndGetter
		completionDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function issueDate_ lib GameKitLib selector "issueDate" (obj_id as ptr) as ptr
			  Return new NSDate(issueDate_(self))
			End Get
		#tag EndGetter
		issueDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function issuingPlayer_ lib GameKitLib selector "issuingPlayer" (obj_id as ptr) as ptr
			  Return new GKPlayer(issuingPlayer_(self))
			End Get
		#tag EndGetter
		issuingPlayer As GKPlayer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function message_ lib GameKitLib selector "message" (obj_id as ptr) as CFStringRef
			  Return message_(self)
			End Get
		#tag EndGetter
		message As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function receivingPlayer_ lib GameKitLib selector "receivingPlayer" (obj_id as ptr) as ptr
			  Return new GKPlayer(receivingPlayer_(self))
			End Get
		#tag EndGetter
		receivingPlayer As GKPlayer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function state_ lib GameKitLib selector "state" (obj_id as ptr) as GKChallengeState
			  Return (state_(self))
			End Get
		#tag EndGetter
		state As GKChallengeState
	#tag EndComputedProperty


	#tag Enum, Name = GKChallengeState, Type = Integer, Flags = &h0
		Invalid = 0
		  Pending = 1
		  Completed = 2
		Declined = 3
	#tag EndEnum


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
			Name="state"
			Group="Behavior"
			Type="GKChallengeState"
			EditorType="Enum"
			#tag EnumValues
				"0 - Invalid"
				"1 - Pending"
				"2 - Completed"
				"3 - Declined"
			#tag EndEnumValues
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
