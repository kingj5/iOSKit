#tag Class
Protected Class RegExMatch
	#tag Method, Flags = &h0
		Sub Constructor(match as JKRegEx.NSTextCheckingResult, target as Text, replacePattern as Text)
		  textResult = match
		  mtarget = target
		  mreplacementPattern = replacePattern
		  
		  mSubExpressionCount = match.numberOfRanges
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace() As Text
		  Return me.Replace(mreplacementPattern)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace(pattern as Text) As Text
		  dim regexp as JKRegEx.NSRegularExpression = textResult.regularExpression
		  
		  dim source as Text = self.SubExpressionString(0)
		  
		  dim range as NSRange
		  range.location = 0
		  range.length = source.Length
		  
		  Return regexp.StringByReplacingMatchesInStringOptionsRangeWithTemplate( source, regexp.options, range, pattern)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubExpressionStart(index as Integer) As Integer
		  Return textResult.RangeAtIndex(index).location
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubExpressionString(index as Integer) As Text
		  dim range as NSRange = textResult.RangeAtIndex(index)
		  dim result as Text = mtarget.Mid(range.location, range.length)
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mreplacementPattern As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubExpressionCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtarget As Text
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSubExpressionCount
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			End Set
		#tag EndSetter
		SubExpressionCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private textResult As JKRegEx.NSTextCheckingResult
	#tag EndProperty


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
			Name="SubExpressionCount"
			Group="Behavior"
			Type="Integer"
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
