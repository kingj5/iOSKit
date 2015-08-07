#tag Class
Private Class NSRegularExpression
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSRegularExpression")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pattern as CFStringRef, options as UInt32, byref error as NSError)
		  declare function initWithPattern_ lib FoundationLib selector "initWithPattern:options:error:" (obj_id as ptr, pattern as CFStringRef, options as UInt32, error as ptr) as ptr
		  dim err as ptr
		  Super.Constructor( initWithPattern_(Allocate(ClassRef), pattern, options, err) )
		  
		  if err <> nil then
		    error = new NSError(err)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FirstMatchInStringOptionsRange(string as CFStringRef, options as UInt32, range as NSRange) As NSTextCheckingResult
		  declare function firstMatchInString_ lib FoundationLib selector "firstMatchInString:options:range:" (obj_id as ptr, string as CFStringRef, options as UInt32, range as NSRange) as ptr
		  dim r as ptr = firstMatchInString_(self, string, options, range)
		  if r <> nil then
		    Return new NSTextCheckingResult(r)
		  else
		    Return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatchesInStringOptionsRange(string as CFStringRef, options as UInt32, range as NSRange) As NSArray
		  declare function matchesInString_ lib FoundationLib selector "matchesInString:options:range:" (obj_id as ptr, string as CFStringRef, options as UInt32, range as NSRange) as ptr
		  Return new NSArray(matchesInString_(self, string, options, range))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfMatchesInStringOptionsRange(string as CFStringRef, options as UInt32, range as NSRange) As UInteger
		  declare function numberOfMatchesInString_ lib FoundationLib selector "numberOfMatchesInString:options:range:" (obj_id as ptr, string as CFStringRef, options as UInt32, range as NSRange) as UInteger
		  Return numberOfMatchesInString_(self, string, options, range)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RangeOfFirstMatchInStringOptionsRange(string as CFStringRef, options as UInt32, range as NSRange) As NSRange
		  declare function rangeOfFirstMatchInString_ lib FoundationLib selector "rangeOfFirstMatchInString:options:range:" (obj_id as ptr, string as CFStringRef, options as UInt32, range as NSRange) as NSRange
		  Return (rangeOfFirstMatchInString_(self, string, options, range))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplacementStringForResultInStringOffsetTemplate(result as NSTextCheckingResult, string as CFStringRef, offset as Integer, template as CFStringRef) As Text
		  declare function replacementStringForResult_ lib FoundationLib selector "replacementStringForResult:inString:offset:template:" (obj_id as ptr, result as ptr, string as CFStringRef, offset as Integer, template as CFStringRef) as CFStringRef
		  Return replacementStringForResult_(self, result, string, offset, template)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringByReplacingMatchesInStringOptionsRangeWithTemplate(string as CFStringRef, options as UInt32, range as NSRange, template as CFStringRef) As Text
		  declare function stringByReplacingMatchesInString_ lib FoundationLib selector "stringByReplacingMatchesInString:options:range:withTemplate:" (obj_id as ptr, string as CFStringRef, options as UInt32, range as NSRange, template as CFStringRef) as CFStringRef
		  Return stringByReplacingMatchesInString_(self, string, options, range, template)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function numberOfCaptureGroups_ lib FoundationLib selector "numberOfCaptureGroups" (obj_id as ptr) as UInteger
			  Return numberOfCaptureGroups_(self)
			End Get
		#tag EndGetter
		numberOfCaptureGroups As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function options_ lib FoundationLib selector "options" (obj_id as ptr) as UInt32
			  Return (options_(self))
			End Get
		#tag EndGetter
		options As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function pattern_ lib FoundationLib selector "pattern" (obj_id as ptr) as CFStringRef
			  Return pattern_(self)
			End Get
		#tag EndGetter
		pattern As CFStringRef
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
