#tag Class
Private Class NSTextCheckingResult
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSTextCheckingResult")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RangeAtIndex(idx as UInteger) As NSRange
		  declare function rangeAtIndex_ lib FoundationLib selector "rangeAtIndex:" (obj_id as ptr, idx as UInteger) as NSRange
		  Return (rangeAtIndex_(self, idx))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResultByAdjustingRangesWithOffset(offset as Integer) As NSTextCheckingResult
		  declare function resultByAdjustingRangesWithOffset_ lib FoundationLib selector "resultByAdjustingRangesWithOffset:" (obj_id as ptr, offset as Integer) as ptr
		  Return new NSTextCheckingResult(resultByAdjustingRangesWithOffset_(self, offset))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function numberOfRanges_ lib FoundationLib selector "numberOfRanges" (obj_id as ptr) as UInteger
			  Return numberOfRanges_(self)
			End Get
		#tag EndGetter
		numberOfRanges As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function range_ lib FoundationLib selector "range" (obj_id as ptr) as NSRange
			  Return (range_(self))
			End Get
		#tag EndGetter
		range As NSRange
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function regularExpression_ lib FoundationLib selector "regularExpression" (obj_id as ptr) as ptr
			  Return new NSRegularExpression(regularExpression_(self))
			End Get
		#tag EndGetter
		regularExpression As NSRegularExpression
	#tag EndComputedProperty


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
