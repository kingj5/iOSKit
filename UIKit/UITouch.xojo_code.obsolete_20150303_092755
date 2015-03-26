#tag Class
Class UITouch
Inherits NSObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  'Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function locationInView(view as UIView) As NSPoint
		  #If Target32Bit
		    declare function locationInView lib UIKitLib selector "locationInView:" (obj_id as ptr,view as ptr) as NSPoint32
		  #Elseif Target64Bit
		    declare function locationInView lib UIKitLib selector "locationInView:" (obj_id as ptr,view as ptr) as NSPoint64
		  #Endif
		  if view <> nil then
		    return locationInView(self,view)
		  else
		    return locationInView(self,nil)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function locationInWindow() As NSPoint
		  Return self.locationInView(nil)
		End Function
	#tag EndMethod


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
