#tag Class
Class Notification
	#tag Method, Flags = &h0
		Sub Constructor(notificationName as Text, sender as Object)
		  self.Constructor(notificationName,sender,nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(notificationName as Text, sender as object, userInfoDict as xojo.Core.Dictionary)
		  self.Name = notificationName
		  self.Sender = sender
		  self.UserInfo = userInfoDict
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSender As xojo.Core.WeakRef
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As Text
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSender.Value
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSender = xojo.Core.WeakRef.Create(value)
			End Set
		#tag EndSetter
		Sender As Object
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		UserInfo As xojo.Core.Dictionary
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
