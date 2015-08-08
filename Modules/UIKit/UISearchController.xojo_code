#tag Class
Class UISearchController
Inherits UIViewController
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UISearchController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(searchResultsController as UIViewController)
		  declare function initWithSearchResultsController_ lib UIKitLib selector "initWithSearchResultsController:" (obj_id as ptr, searchResultsController as ptr) as ptr
		  Super.Constructor( initWithSearchResultsController_(Allocate(ClassRef), searchResultsController) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function active_ lib UIKitLib selector "isActive" (obj_id as ptr) as Boolean
			  Return active_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub active_ lib UIKitLib selector "setActive:" (obj_id as ptr, active as Boolean)
			  active_(self, value)
			End Set
		#tag EndSetter
		active As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function dimsBackgroundDuringPresentation_ lib UIKitLib selector "dimsBackgroundDuringPresentation" (obj_id as ptr) as Boolean
			  Return dimsBackgroundDuringPresentation_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub dimsBackgroundDuringPresentation_ lib UIKitLib selector "setDimsBackgroundDuringPresentation:" (obj_id as ptr, dimsBackgroundDuringPresentation as Boolean)
			  dimsBackgroundDuringPresentation_(self, value)
			End Set
		#tag EndSetter
		dimsBackgroundDuringPresentation As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hidesNavigationBarDuringPresentation_ lib UIKitLib selector "hidesNavigationBarDuringPresentation" (obj_id as ptr) as Boolean
			  Return hidesNavigationBarDuringPresentation_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub hidesNavigationBarDuringPresentation_ lib UIKitLib selector "setHidesNavigationBarDuringPresentation:" (obj_id as ptr, hidesNavigationBarDuringPresentation as Boolean)
			  hidesNavigationBarDuringPresentation_(self, value)
			End Set
		#tag EndSetter
		hidesNavigationBarDuringPresentation As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function delegate_ lib UIKitLib selector "delegate" (obj_id as ptr) as ptr
			  Return delegate_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub delegate_ lib UIKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
			  delegate_(self, value)
			End Set
		#tag EndSetter
		mDelegate As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function searchBar_ lib UIKitLib selector "searchBar" (obj_id as ptr) as ptr
			  Return new UIKit.UISearchBar(searchBar_(self))
			End Get
		#tag EndGetter
		searchBar As UIKit.UISearchBar
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function searchResultsController_ lib UIKitLib selector "searchResultsController" (obj_id as ptr) as ptr
			  Return new UIViewController(searchResultsController_(self))
			End Get
		#tag EndGetter
		searchResultsController As UIViewController
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function searchResultsUpdater_ lib UIKitLib selector "searchResultsUpdater" (obj_id as ptr) as ptr
			  Return (searchResultsUpdater_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub searchResultsUpdater_ lib UIKitLib selector "setSearchResultsUpdater:" (obj_id as ptr, searchResultsUpdater as ptr)
			  searchResultsUpdater_(self, value)
			End Set
		#tag EndSetter
		searchResultsUpdater As Ptr
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="active"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="dimsBackgroundDuringPresentation"
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
			Name="hidesNavigationBarDuringPresentation"
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
