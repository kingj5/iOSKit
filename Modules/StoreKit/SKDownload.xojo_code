#tag Class
Protected Class SKDownload
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("SKDownload")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function contentIdentifier_ lib StoreKitLib selector "contentIdentifier" (obj_id as ptr) as CFStringRef
			  Return contentIdentifier_(self)
			End Get
		#tag EndGetter
		contentIdentifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function contentLength_ lib StoreKitLib selector "contentLength" (obj_id as ptr) as Integer
			  Return (contentLength_(self))
			End Get
		#tag EndGetter
		contentLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function contentURL_ lib StoreKitLib selector "contentURL" (obj_id as ptr) as ptr
			  Return new NSURL(contentURL_(self))
			End Get
		#tag EndGetter
		contentURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function contentVersion_ lib StoreKitLib selector "contentVersion" (obj_id as ptr) as CFStringRef
			  Return contentVersion_(self)
			End Get
		#tag EndGetter
		contentVersion As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function downloadState_ lib StoreKitLib selector "downloadState" (obj_id as ptr) as SKDownloadState
			  Return downloadState_(self)
			End Get
		#tag EndGetter
		downloadState As SKDownloadState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function error_ lib StoreKitLib selector "error" (obj_id as ptr) as ptr
			  Return new NSError(error_(self))
			End Get
		#tag EndGetter
		error As NSError
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function progress_ lib StoreKitLib selector "progress" (obj_id as ptr) as Double
			  Return (progress_(self))
			End Get
		#tag EndGetter
		progress As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function timeRemaining_ lib StoreKitLib selector "timeRemaining" (obj_id as ptr) as Double
			  Return (timeRemaining_(self))
			End Get
		#tag EndGetter
		timeRemaining As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function transaction_ lib StoreKitLib selector "transaction" (obj_id as ptr) as ptr
			  Return new SKPaymentTransaction(transaction_(self))
			End Get
		#tag EndGetter
		transaction As SKPaymentTransaction
	#tag EndComputedProperty


	#tag Enum, Name = SKDownloadState, Type = Integer, Flags = &h0
		Waiting
		  Active
		  Paused
		  Finished
		  Failed
		Cancelled
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="contentIdentifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="contentLength"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="contentVersion"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="downloadState"
			Group="Behavior"
			Type="SKDownloadState"
			EditorType="Enum"
			#tag EnumValues
				"0 - Waiting"
				"1 - Active"
				"2 - Paused"
				"3 - Finished"
				"4 - Failed"
				"5 - Cancelled"
			#tag EndEnumValues
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
			Name="progress"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="timeRemaining"
			Group="Behavior"
			Type="Double"
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
