#tag Class
Class UINotificationFeedbackGenerator
Inherits UIFeedbackGenerator
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From UIFeedbackGenerator
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  
		  
		  Super.Constructor(initialize(Allocate(NSClassFromString("UINotificationFeedbackGenerator"))))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54726967676572732073656C656374696F6E20666565646261636B2E
		Sub NotificationOccurred(type As UINotificationFeedbackType)
		  
		  Declare Sub notificationOccurred_ Lib UIKitLib selector "notificationOccurred:" (obj_id As ptr, tp As UINotificationFeedbackType)
		  
		  notificationOccurred_(self.id, type)
		End Sub
	#tag EndMethod


	#tag Enum, Name = UINotificationFeedbackType, Type = Integer, Flags = &h0
		success = 0
		  warning
		error
	#tag EndEnum


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
