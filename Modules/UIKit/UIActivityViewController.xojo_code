#tag Class
Class UIActivityViewController
Inherits UIViewController
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIActivityViewController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(activityItems as NSArray, applicationActivities as NSArray)
		  declare function initWithActivityItems_ lib UIKitLib selector "initWithActivityItems:applicationActivities:" (obj_id as ptr, activityItems as ptr, applicationActivities as ptr) as ptr
		  if applicationActivities <> nil then
		    Super.Constructor( initWithActivityItems_(Allocate(ClassRef), activityItems, applicationActivities) )
		  else
		    Super.Constructor( initWithActivityItems_(Allocate(ClassRef), activityItems, nil) )
		  end if
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function excludedActivityTypes_ lib UIKitLib selector "excludedActivityTypes" (obj_id as ptr) as ptr
			  Return new NSArray(excludedActivityTypes_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub excludedActivityTypes_ lib UIKitLib selector "setExcludedActivityTypes:" (obj_id as ptr, excludedActivityTypes as ptr)
			  excludedActivityTypes_(self, value)
			End Set
		#tag EndSetter
		excludedActivityTypes As NSArray
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="automaticallyAdjustsScrollViewInsets"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="definesPresentationContext"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="editing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extendedLayoutIncludesOpaqueBars"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hidesBottomBarWhenPushed"
			Group="Behavior"
			Type="Boolean"
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
			Name="modalInPopover"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalPresentationCapturesStatusBarAppearance"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="providesPresentationContextTransitionStyle"
			Group="Behavior"
			Type="Boolean"
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
