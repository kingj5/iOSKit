#tag Class
Class NSUUID
Inherits NSObject
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data as Text)
		  // Create a class
		  dim cl as ptr = NSClassFromString("NSUUID")
		  
		  declare function initWithUUIDString lib FoundationLib selector "initWithUUIDString:" (obj as ptr, s as CFStringRef) as ptr
		  dim obj as ptr = initWithUUIDString(allocate(cl),data)
		  super.Constructor(obj)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function UUIDString lib UIKitLib selector "UUIDString" (obj as ptr) as ptr
			  dim p as ptr = UUIDString(self.ID)
			  
			  dim nss as new NSString(p)
			  
			  dim txt as text = nss.UTF8String
			  
			  return txt
			End Get
		#tag EndGetter
		UUIDString As Text
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="UUIDString"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
