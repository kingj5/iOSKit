#tag Class
Protected Class UIPrintInfo
Inherits Foundation.NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("UIPrintInfo")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictionaryRepresentation() As NSDictionary
		  declare function dictionaryRepresentation_ lib FoundationLib selector "dictionaryRepresentation" (obj_id as ptr) as ptr
		  Return new NSDictionary(dictionaryRepresentation_(self))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetInstance() As UIPrintInfo
		  
		  Declare function printInfo lib "UIKit" Selector "printInfo" (obj as ptr) as ptr
		  
		  Return new UIPrintInfo(printInfo(ClassRef))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Declare function jobName_ lib "UIKit" selector "jobName" (obj as ptr) as CFStringRef
			  
			  return jobName_(self)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Declare sub setJobName lib "UIKit" selector "setJobName:" (obj as ptr, name as CFStringRef)
			  
			  setJobName(self, value)
			End Set
		#tag EndSetter
		jobName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Declare function printerID_ lib "UIKit" selector "printerID" (obj as ptr) as CFStringRef
			  
			  return printerID_(self)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Declare sub setPrinterID_ lib "UIKit" selector "setPrinterID:" (obj as ptr, name as CFStringRef)
			  
			  setPrinterID_(self, value)
			End Set
		#tag EndSetter
		printerID As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="jobName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="printerID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
