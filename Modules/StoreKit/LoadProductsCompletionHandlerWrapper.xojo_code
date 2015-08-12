#tag Class
Private Class LoadProductsCompletionHandlerWrapper
	#tag Method, Flags = &h0
		Sub Constructor(compHandler as LoadProductsCallback)
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
		Sub handler(success as boolean, err as ptr)
		  if err<>nil then
		    completionHandler.Invoke(success, new Foundation.NSError(err))
		  else
		    completionHandler.Invoke(success, nil)
		  end if
		  
		  
		  Remove(self)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub Remove(wrapper as StoreKit.LoadProductsCompletionHandlerWrapper)
		  compHandlers.Remove compHandlers.IndexOf(wrapper)
		  
		  wrapper = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub Save(wrapper as StoreKit.LoadProductsCompletionHandlerWrapper)
		  compHandlers.Append wrapper
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared compHandlers() As StoreKit.LoadProductsCompletionHandlerWrapper
	#tag EndProperty

	#tag Property, Flags = &h21
		Private completionHandler As LoadProductsCallback
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
