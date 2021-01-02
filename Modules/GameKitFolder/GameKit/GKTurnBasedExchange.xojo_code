#tag Class
Protected Class GKTurnBasedExchange
Inherits NSObject
	#tag Method, Flags = &h0
		Sub CancelWithLocalizableMessageKeyArgumentsCompletionHandler(key as CFStringRef, arguments as NSArray, completionHandler as NSErrorCompletionHandler)
		  declare sub cancelWithLocalizableMessageKey_ lib GameKitLib selector "cancelWithLocalizableMessageKey:arguments:completionHandler:" (obj_id as ptr, key as CFStringRef, arguments as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  cancelWithLocalizableMessageKey_(self, key, arguments, blk.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKTurnBasedExchange")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplyWithLocalizableMessageKeyArgumentsDataCompletionHandler(key as CFStringRef, arguments as NSArray, data as NSData, completionHandler as NSErrorCompletionHandler)
		  declare sub replyWithLocalizableMessageKey_ lib GameKitLib selector "replyWithLocalizableMessageKey:arguments:data:completionHandler:" (obj_id as ptr, key as CFStringRef, arguments as ptr, data as ptr, completionHandler as ptr)
		  dim handler as new NSErrorCompletionHandlerWrapper(completionHandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  replyWithLocalizableMessageKey_(self, key, arguments, data, blk.Handle)
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
			  declare function data_ lib GameKitLib selector "data" (obj_id as ptr) as ptr
			  Return new NSData(data_(self))
			End Get
		#tag EndGetter
		data As NSData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exchangeID_ lib GameKitLib selector "exchangeID" (obj_id as ptr) as CFStringRef
			  Return exchangeID_(self)
			End Get
		#tag EndGetter
		exchangeID As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function message_ lib GameKitLib selector "message" (obj_id as ptr) as CFStringRef
			  Return message_(self)
			End Get
		#tag EndGetter
		message As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function recipients_ lib GameKitLib selector "recipients" (obj_id as ptr) as ptr
			  Return new NSArray(recipients_(self))
			End Get
		#tag EndGetter
		recipients As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function replies_ lib GameKitLib selector "replies" (obj_id as ptr) as ptr
			  Return new NSArray(replies_(self))
			End Get
		#tag EndGetter
		replies As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sendDate_ lib GameKitLib selector "sendDate" (obj_id as ptr) as ptr
			  Return new NSDate(sendDate_(self))
			End Get
		#tag EndGetter
		sendDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sender_ lib GameKitLib selector "sender" (obj_id as ptr) as ptr
			  Return new GKTurnBasedParticipant(sender_(self))
			End Get
		#tag EndGetter
		sender As GKTurnBasedParticipant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function status_ lib GameKitLib selector "status" (obj_id as ptr) as GKTurnBasedExchangeStatus
			  Return (status_(self))
			End Get
		#tag EndGetter
		status As GKTurnBasedExchangeStatus
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function timeoutDate_ lib GameKitLib selector "timeoutDate" (obj_id as ptr) as ptr
			  Return new NSDate(timeoutDate_(self))
			End Get
		#tag EndGetter
		timeoutDate As NSDate
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="exchangeID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
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
			Name="message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="status"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="GKTurnBasedExchangeStatus"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - Active"
				"2 - Complete"
				"3 - Resolved"
				"4 - Cancelled"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
