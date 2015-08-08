#tag Class
Class UIView
Inherits UIResponder
	#tag Method, Flags = &h1000
		Sub Constructor(rect as NSRect)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  #if Target32Bit
		    declare function initWithFrame lib UIKitLib selector "initWithFrame:" _
		    (clsRef as ptr, frame as NSRect32) as ptr
		    Super.Constructor(initWithFrame(Allocate(NSClassFromString("UIView")),rect.Value32))
		    
		  #Elseif Target64Bit
		    declare function initWithFrame lib UIKitLib selector "initWithFrame:" _
		    (clsRef as ptr, frame as NSRect64) as ptr
		    Super.Constructor(initWithFrame(Allocate(NSClassFromString("UIView")),rect.Value64))
		    
		  #Endif
		  
		  needsExtraRelease = True
		End Sub
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
