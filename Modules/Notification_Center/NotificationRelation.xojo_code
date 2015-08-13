#tag Class
Private Class NotificationRelation
	#tag Method, Flags = &h0
		Sub Constructor(observer as object, callback as NotificationCenter.NotificationCallBack, notificationName as text, sender as object)
		  self.Observer = observer
		  self.CallBack = callback
		  self.NotificationName = notificationName
		  self.Sender = sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendNotification(anotification as Notification)
		  CallBack.Invoke(aNotification)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WantsNotification(aNotification as Notification) As Boolean
		  dim wants as Boolean = False
		  if NotificationName = "" and sender = nil then  
		    //accepts all notifications from all sources
		    wants = True
		  end if
		  if NotificationName = aNotification.Name and (sender = aNotification.Sender or Sender = nil) then
		    //accepts notifications with this name from all senders or the sender is the accepted sender
		    wants = True
		  end if
		  if Sender = aNotification.Sender and NotificationName = "" then
		    //accepts all notifications from this sender
		    wants = true
		  end if
		  Return wants
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CallBack As NotificationCenter.NotificationCallBack
	#tag EndProperty

	#tag Property, Flags = &h0
		NotificationName As text
	#tag EndProperty

	#tag Property, Flags = &h0
		Observer As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		Sender As Object
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
			Name="NotificationName"
			Group="Behavior"
			Type="text"
			EditorType="MultiLineEditor"
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
