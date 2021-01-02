#tag Class
Class UIPopoverPresentationController
Inherits UIResponder
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function barButtonItem_ lib UIKitLib selector "barButtonItem" (obj_id as ptr) as ptr
			  Return barButtonItem_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub barButtonItem_ lib UIKitLib selector "setBarButtonItem:" (obj_id as ptr, btn as ptr)
			  barButtonItem_(self, value)
			End Set
		#tag EndSetter
		barButtonItem As ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  #if Target32Bit
			    declare sub sourceRect_ lib UIKitLib selector "setSourceRect:" (obj_id as ptr, rect as NSRect32)
			    sourceRect_(self, value.Value32)
			  #elseif Target64Bit
			    declare sub sourceRect_ lib UIKitLib selector "setSourceRect:" (obj_id as ptr, rect as NSRect64)
			    sourceRect_(self, value.Value64)
			  #endif
			End Set
		#tag EndSetter
		sourceRect As Foundation.NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sourceView_ lib UIKitLib selector "sourceView" (obj_id as ptr) as ptr
			  Return new UIView(sourceView_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub sourceView_ lib UIKitLib selector "setSourceView:" (obj_id as ptr, view as ptr)
			  sourceView_(self, value)
			End Set
		#tag EndSetter
		sourceView As UIView
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
	#tag EndViewBehavior
End Class
#tag EndClass
