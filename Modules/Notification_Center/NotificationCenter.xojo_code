#tag Class
Class NotificationCenter
	#tag Method, Flags = &h0
		Sub addObserver(observer as object, callback as NotificationCallBack, notificationName as text, sender as object)
		  if callback = nil then
		    break ' The callback for a notification must not be nil
		    
		    Return
		  end if
		  dim nr as new NotificationRelation(observer,callback,notificationName,sender)
		  relations.Append nr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MainCenter() As NotificationCenter
		  static mcenter as NotificationCenter
		  if mcenter = nil then
		    mcenter = new NotificationCenter
		  end if
		  Return mcenter
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NotificationCallBack(aNotification as Notification)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub PostNotification(aNotification as Notification)
		  if aNotification = nil then
		    Break 'A posted notification cannot be nil.
		    Return
		  end if
		  for i as Integer = 0 to relations.Ubound
		    If relations(i).WantsNotification(aNotification) then
		      relations(i).SendNotification(aNotification)
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostNotification(name as text, sender as object)
		  PostNotification(name,sender,nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostNotification(name as text, sender as object, userInfo as xojo.Core.Dictionary)
		  PostNotification(new Notification(name, sender, userInfo))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeObserver(observer as Object)
		  removeObserver(observer,"",nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeObserver(observer as object, notificationName as text, sender as object)
		  dim tmpRelation as NotificationRelation
		  for i as Integer = relations.Ubound DownTo 0
		    tmpRelation = relations(i)
		    if tmpRelation.Observer = observer then
		      //observer is correct
		      if notificationName = "" then
		        //all notifications
		        if tmpRelation.sender = sender or sender = nil then
		          //sender matches
		          relations.Remove i
		        end if
		      ElseIf tmpRelation.NotificationName = notificationName then
		        //notificationName matches
		        if tmpRelation.sender = sender or sender = nil then
		          //sender matches
		          relations.Remove i
		        end if
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private relations() As NotificationRelation
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
