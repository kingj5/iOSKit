#tag Class
Protected Class RegExTests
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub CreateTest()
		  dim rx as new JkRegEx.RegEx
		  rx.Options.CaseSensitive = true
		  rx.Options.DotMatchAll = true
		  
		  rx.SearchPattern = "."
		End Sub
	#tag EndMethod


End Class
#tag EndClass
