#tag Class
Private Class UIAlertActionCompletionHandlerWrapper
	#tag Method, Flags = &h0
		Sub Constructor(compHandler as UIAlertActionCompletionHandler)
		  completionHandler = compHandler
		  
		  Save(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  completionHandler = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub handler(action as ptr)
		  if action<>nil then
		    completionHandler.Invoke(new UIAlertAction(action))
		  else
		    completionHandler.Invoke(nil)
		  end if
		  
		  
		  Remove(self)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub Remove(wrapper as UIAlertActionCompletionHandlerWrapper)
		  compHandlers.Remove compHandlers.IndexOf(wrapper)
		  
		  wrapper = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub Save(wrapper as UIAlertActionCompletionHandlerWrapper)
		  compHandlers.Append wrapper
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared compHandlers() As UIAlertActionCompletionHandlerWrapper
	#tag EndProperty

	#tag Property, Flags = &h21
		Private completionHandler As UIAlertActionCompletionHandler
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
