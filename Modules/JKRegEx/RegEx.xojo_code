#tag Class
Protected Class RegEx
	#tag Method, Flags = &h0
		Sub Constructor()
		  mOptions = new JKRegEx.RegExOptions
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mCreate()
		  if mRegex = Nil then
		    dim err as Foundation.NSError
		    mRegex = new JKRegEx.NSRegularExpression(SearchPattern, self.Options.Value, err)
		    if err <> nil then
		      dim r as new RuntimeException
		      r.Reason = err.localizedDescription
		      r.ErrorNumber = err.Code
		      raise r
		      mRegex = Nil
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mReset()
		  mRegex = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceAll(target as Text) As Text
		  mLastTarget = target
		  mLastTargetLen = target.Length
		  
		  if target = "" or ReplacementPattern = "" then Return target
		  
		  dim range as NSRange
		  range.location = 0
		  range.length = target.Length
		  
		  mCreate
		  
		  Return mRegex.StringByReplacingMatchesInStringOptionsRangeWithTemplate(target, self.Options.Value, range, ReplacementPattern)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search(startPosition as Integer = -1) As JKRegEx.RegExMatch
		  dim result as JKRegEx.RegExMatch
		  
		  if mLastTarget = "" or mRegex = nil then Return result
		  
		  if startPosition < 0 then //resume from last position
		    if mlastMatch = nil then
		      startPosition = 0
		    elseif mlastMatch.range.length = 0 then
		      startPosition = mLastMatch.Range.Location + 1
		    else
		      startPosition = mLastMatch.Range.Location + mLastMatch.Range.Length
		    end if
		  end if
		  
		  mlastMatch = nil
		  
		  dim range as NSRange
		  range.location = startPosition
		  range.length = mLastTargetLen - startPosition
		  
		  if range.length > 0 then
		    dim match as JKRegEx.NSTextCheckingResult = mRegex.FirstMatchInStringOptionsRange(mLastTarget, self.Options.Value, range)
		    if match <> nil and match.numberOfRanges <> 0 then
		      result = new JKRegEx.RegExMatch(match, mLastTarget, ReplacementPattern)
		      mlastMatch = match
		    end if
		  end if
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search(target as Text, startPosition as Integer = 0) As JKRegEx.RegExMatch
		  mlastMatch = nil
		  mLastTarget = target
		  mLastTargetLen = target.Length
		  
		  if target = "" then Return Nil
		  
		  mCreate
		  if startPosition < 0 then startPosition = 0
		  Return me.Search(startPosition)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mlastMatch As JKRegEx.NSTextCheckingResult
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastTarget As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastTargetLen As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOptions As JKRegEx.RegExOptions
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRegex As JKRegEx.NSRegularExpression
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSearchPattern As Text
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mOptions
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> nil then
			    mOptions = value
			  Else
			    mOptions = new JKRegEx.RegExOptions
			  end if
			End Set
		#tag EndSetter
		Options As JKRegEx.RegExOptions
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ReplacementPattern As Text
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSearchPattern
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSearchPattern = value
			  mReset
			End Set
		#tag EndSetter
		SearchPattern As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SearchStartPosition As Integer
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
			Name="ReplacementPattern"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchPattern"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchStartPosition"
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
