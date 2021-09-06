#tag Class
Class NSMutableAttributedString
Inherits NSAttributedString
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSMutableAttributedString")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize(Allocate(ClassRef)))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Shared Function CreateWithString(aString as Text) As NSMutableAttributedString
		  
		  Dim strRef As New NSString(aString)
		  
		  
		  declare Function initWithString lib FoundationLib selector "initWithString:" (obj as ptr, value as ptr) as ptr
		  
		  Return new NSMutableAttributedString(initWithString(Allocate(ClassRef), strRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttributes(attrib As Foundation.NSDictionary, range As Foundation.NSRange)
		  
		  declare sub setAttributes lib FoundationLib selector "setAttributes:range:" (obj as ptr, attr as ptr, rng as Foundation.NSRange)
		  
		  setAttributes(self.id, attrib, range)
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
