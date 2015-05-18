#tag Class
Protected Class GenericView
Inherits iOSUserControl
	#tag Event
		Function CreateView() As UInteger
		  #if Target32Bit
		    declare function initWithFrame lib FoundationLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect32) as ptr
		  #Elseif Target64Bit
		    declare function initWithFrame lib FoundationLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect64) as ptr
		  #Endif
		  
		  Declare Function alloc Lib FoundationLib selector "alloc" (classRef As Ptr) As Ptr
		  
		  Dim frame as new NSRect
		  frame.origin.x = 0.0
		  frame.origin.y = 0.0
		  frame.rsize.w = 100
		  frame.rsize.h = 100
		  
		  
		  #if Target32Bit
		    dim selfRef as ptr = initWithFrame(alloc(NSClassFromString("UIView")), frame.Value32)
		  #Elseif Target64Bit
		    dim selfRef as ptr = initWithFrame(alloc(NSClassFromString("UIView")), frame.Value64)
		  #Endif
		  
		  Return UInteger(selfRef)
		End Function
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityHint"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			Type="Double"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
