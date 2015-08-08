#tag Class
Class NSError
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As ptr
		  static ref as ptr = NSClassFromString("NSError")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(domain as Text, code as Integer, userInfo as Foundation.NSDictionary)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  declare function initWithDomain_ lib FoundationLib selector "initWithDomain:code:userInfo:" (obj_id as ptr, _
		  domain as CFStringRef, code as Integer, userInfo as Ptr) as Ptr
		  Super.Constructor( initWithDomain_(Allocate(classRef), domain, code, userInfo) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function errorWithDomain(domain as Text, code as Integer, userInfo as Foundation.NSDictionary) As NSError
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  declare function errorWithDomain_ lib FoundationLib selector "errorWithDomain:code:userInfo:" (obj_id as ptr, _
		  domain as CFStringRef, code as Integer, userInfo as Ptr) as Ptr
		  return new NSError( errorWithDomain_(ClassRef, domain, code, userInfo) )
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function code_ lib FoundationLib selector "code" (obj_id as ptr) as Integer
			  Return code_(self)
			End Get
		#tag EndGetter
		Code As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function Domain_ lib FoundationLib selector "domain" (obj_id as ptr) as CFStringRef
			  Return domain_(self)
			End Get
		#tag EndGetter
		Domain As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function localizedDescription lib FoundationLib selector "localizedDescription" (obj_id as ptr) as CFStringRef
			  Return localizedDescription(self)
			End Get
		#tag EndGetter
		localizedDescription As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function userInfo_ lib FoundationLib selector "userInfo" (obj_id as ptr) as ptr
			  Return new NSDictionary(userInfo_(self))
			End Get
		#tag EndGetter
		userInfo As Foundation.NSDictionary
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Code"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Domain"
			Group="Behavior"
			Type="Text"
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
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="localizedDescription"
			Group="Behavior"
			Type="Text"
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
