#tag Class
Protected Class RegExTests
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub BadPatternTest()
		  dim rx as new JKRegEx.RegEx
		  rx.SearchPattern = "(.((\"
		  
		  try
		    #pragma BreakOnExceptions false
		    dim match as JKRegEx.RegExMatch = rx.Search( rx.SearchPattern )
		    #pragma unused match
		    
		    Assert.Fail( "An exception should have been raised" )
		    #pragma BreakOnExceptions default
		    
		  catch err as RuntimeException
		    Assert.Pass
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTest()
		  dim rx as new JkRegEx.RegEx
		  rx.Options.CaseSensitive = true
		  rx.Options.DotMatchAll = true
		  
		  rx.SearchPattern = "."
		  
		  Assert.IsNotNil( rx )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MatchTest()
		  dim rx as new JKRegEx.RegEx
		  rx.SearchPattern = "\d"
		  
		  dim matches() as text
		  dim match as JKRegEx.RegExMatch = rx.Search( "123" )
		  while match isa JKRegEx.RegExMatch
		    matches.Append match.SubExpressionString( 0 )
		    match = rx.Search
		  wend
		  
		  Assert.IsTrue( matches.Ubound = 2 )
		  
		  for i as integer = 1 to 3
		    Assert.AreEqual( i.ToText, matches( i - 1 ), i.ToText )
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NoMatchTest()
		  dim rx as new JKRegEx.RegEx
		  rx.SearchPattern = "\D"
		  
		  Assert.IsNil( rx.Search( "123" ) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceAllTest()
		  dim rx as new JKRegEx.RegEx
		  rx.SearchPattern = "1"
		  rx.ReplacementPattern = "a"
		  
		  dim t as text
		  
		  t = rx.ReplaceAll( "123123" )
		  Assert.AreSame( "a23a23", t )
		  
		  rx.SearchPattern = "\d"
		  t = rx.ReplaceAll( "123123" )
		  Assert.AreSame( "aaaaaa", t )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceTest()
		  dim rx as new JKRegEx.RegEx
		  rx.SearchPattern = "\d"
		  rx.ReplacementPattern = "-"
		  
		  dim match as JKRegEx.RegExMatch = rx.Search( "a1b1c1d" )
		  while match isa JKRegEx.RegExMatch
		    Assert.AreEqual( "-", match.Replace )
		    match = rx.Search
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubExpressionTest()
		  dim rx as new JKRegEx.RegEx
		  rx.SearchPattern = ".((.(.)(.).).)"
		  
		  dim match as JKRegEx.RegExMatch = rx.Search( "0123456789" )
		  Assert.IsNotNil( match, "Match should not be nil" )
		  
		  if match isa JKRegEx.RegExMatch then
		    Assert.AreEqual( 5, match.SubExpressionCount, "Count should be 5" )
		    if Assert.Failed then
		      return
		    end if
		    
		    Assert.AreSame( "012345", match.SubExpressionString( 0 ) )
		    Assert.AreSame( "12345", match.SubExpressionString( 1 ) )
		    Assert.AreSame( "1234", match.SubExpressionString( 2 ) )
		    Assert.AreSame( "2", match.SubExpressionString( 3 ) )
		    Assert.AreSame( "3", match.SubExpressionString( 4 ) )
		    
		    Assert.AreEqual( 0, match.SubExpressionStart( 0 ) )
		    Assert.AreEqual( 1, match.SubExpressionStart( 1 ) )
		    Assert.AreEqual( 1, match.SubExpressionStart( 2 ) )
		    Assert.AreEqual( 2, match.SubExpressionStart( 3 ) )
		    Assert.AreEqual( 3, match.SubExpressionStart( 4 ) )
		  end if
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Group="Behavior"
			InitialValue="True"
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
			Name="PassedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
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
			Name="TestCount"
			Group="Behavior"
			Type="Integer"
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
