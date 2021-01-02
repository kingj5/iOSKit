#tag Class
Protected Class UIAlertAction
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function ActionWithTitleStyleHandler(title as CFStringRef, style as UIAlertActionStyle, comphandler as UIAlertActionCompletionHandler) As UIAlertAction
		  declare function actionWithTitle_ lib UIKitLib selector "actionWithTitle:style:handler:" (clsRef as ptr, title as CFStringRef, style as UIAlertActionStyle, handler as ptr) as ptr
		  dim handler as new UIAlertActionCompletionHandlerWrapper(comphandler)
		  dim blk as new iOSBlock(AddressOf handler.handler)
		  Return new UIAlertAction(actionWithTitle_(ClassRef, title, style, blk.Handle))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIAlertAction")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function enabled_ lib UIKitLib selector "isEnabled" (obj_id as ptr) as Boolean
			  Return enabled_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub enabled_ lib UIKitLib selector "setEnabled:" (obj_id as ptr, enabled as Boolean)
			  enabled_(self, value)
			End Set
		#tag EndSetter
		enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function style_ lib UIKitLib selector "style" (obj_id as ptr) as UIAlertActionStyle
			  Return (style_(self))
			End Get
		#tag EndGetter
		style As UIAlertActionStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function title_ lib UIKitLib selector "title" (obj_id as ptr) as CFStringRef
			  Return title_(self)
			End Get
		#tag EndGetter
		title As Text
	#tag EndComputedProperty


	#tag Enum, Name = UIAlertActionStyle, Type = Integer, Flags = &h0
		Default = 0
		  Cancel = 1
		Destructive = 2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="enabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="style"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UIAlertActionStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Cancel"
				"2 - Destructive"
			#tag EndEnumValues
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
			Name="title"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
