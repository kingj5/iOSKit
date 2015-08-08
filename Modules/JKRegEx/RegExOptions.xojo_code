#tag Class
Protected Class RegExOptions
	#tag Method, Flags = &h0
		Attributes( Hidden )  Function Value() As UInt32
		  dim result as UInt32
		  
		  if not CaseSensitive then
		    result = result or caseInsensitive
		  end if
		  if DotMatchAll then
		    result = result or dotMatchesLineSeparators
		  end if
		  if IgnoreWhitespace then
		    result = result or allowCommentsAndWhitespace
		  end if
		  if TreatAsLiteral then
		    result = result or ignoreMetachars
		  end if
		  if not TreatTargetAsOneLine then
		    result = result or anchorsMatchLines
		  end if
		  if UnicodeWordBoundaries then
		    result = result or useUnicodeWordBoundaries
		  end if
		  if UnixLineSeparators then
		    result = result or useUnixLineSpearators
		  end if
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CaseSensitive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		DotMatchAll As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		IgnoreWhitespace As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TreatAsLiteral As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TreatTargetAsOneLine As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		UnicodeWordBoundaries As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		UnixLineSeparators As Boolean
	#tag EndProperty


	#tag Constant, Name = allowCommentsAndWhitespace, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = anchorsMatchLines, Type = Double, Dynamic = False, Default = \"16", Scope = Private
	#tag EndConstant

	#tag Constant, Name = caseInsensitive, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = dotMatchesLineSeparators, Type = Double, Dynamic = False, Default = \"8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ignoreMetachars, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = useUnicodeWordBoundaries, Type = Double, Dynamic = False, Default = \"64", Scope = Private
	#tag EndConstant

	#tag Constant, Name = useUnixLineSpearators, Type = Double, Dynamic = False, Default = \"32", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CaseSensitive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DotMatchAll"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoreWhitespace"
			Group="Behavior"
			Type="Boolean"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TreatAsLiteral"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TreatTargetAsOneLine"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UnicodeWordBoundaries"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UnixLineSeparators"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
