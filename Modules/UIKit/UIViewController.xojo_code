#tag Class
Class UIViewController
Inherits UIResponder
	#tag Method, Flags = &h0
		Sub AddChildViewController(childController as UIViewController)
		  declare sub addChildViewController_ lib UIKitLib selector "addChildViewController:" (obj_id as ptr, childController as ptr)
		  addChildViewController_(self, childController)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub AttemptRotationToDeviceOrientation()
		  declare sub attemptRotationToDeviceOrientation_ lib UIKitLib selector "attemptRotationToDeviceOrientation" (clsRef as ptr)
		  attemptRotationToDeviceOrientation_(ClassRef)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIViewController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DismissViewControllerAnimatedCompletion(flag as Boolean, completion as iOSBlock)
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  if completion <> nil then
		    dismissViewControllerAnimated_(self, flag, completion.Handle)
		  else
		    dismissViewControllerAnimated_(self, flag, nil)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentViewControllerAnimatedCompletion(viewControllerToPresent as Ptr, flag as Boolean, completion as iOSBlock)
		  declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewControllerToPresent as ptr, flag as Boolean, completion as ptr)
		  if completion <> nil then
		    presentViewController_(self, viewControllerToPresent, flag, completion.Handle)
		  else
		    presentViewController_(self, viewControllerToPresent, flag, nil)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFromParentViewController()
		  declare sub removeFromParentViewController_ lib UIKitLib selector "removeFromParentViewController" (obj_id as ptr)
		  removeFromParentViewController_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditingAnimated(editing as Boolean, animated as Boolean)
		  declare sub setEditing_ lib UIKitLib selector "setEditing:animated:" (obj_id as ptr, editing as Boolean, animated as Boolean)
		  setEditing_(self, editing, animated)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNeedsStatusBarAppearanceUpdate()
		  declare sub setNeedsStatusBarAppearanceUpdate_ lib UIKitLib selector "setNeedsStatusBarAppearanceUpdate" (obj_id as ptr)
		  setNeedsStatusBarAppearanceUpdate_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetToolbarItemsAnimated(toolbarItems as NSArray, animated as Boolean)
		  declare sub setToolbarItems_ lib UIKitLib selector "setToolbarItems:animated:" (obj_id as ptr, toolbarItems as ptr, animated as Boolean)
		  setToolbarItems_(self, toolbarItems, animated)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function automaticallyAdjustsScrollViewInsets_ lib UIKitLib selector "automaticallyAdjustsScrollViewInsets" (obj_id as ptr) as Boolean
			  Return automaticallyAdjustsScrollViewInsets_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub automaticallyAdjustsScrollViewInsets_ lib UIKitLib selector "setAutomaticallyAdjustsScrollViewInsets:" (obj_id as ptr, automaticallyAdjustsScrollViewInsets as Boolean)
			  automaticallyAdjustsScrollViewInsets_(self, value)
			End Set
		#tag EndSetter
		automaticallyAdjustsScrollViewInsets As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function childViewControllers_ lib UIKitLib selector "childViewControllers" (obj_id as ptr) as ptr
			  Return new NSArray(childViewControllers_(self))
			End Get
		#tag EndGetter
		childViewControllers As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function definesPresentationContext_ lib UIKitLib selector "definesPresentationContext" (obj_id as ptr) as Boolean
			  Return definesPresentationContext_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub definesPresentationContext_ lib UIKitLib selector "setDefinesPresentationContext:" (obj_id as ptr, definesPresentationContext as Boolean)
			  definesPresentationContext_(self, value)
			End Set
		#tag EndSetter
		definesPresentationContext As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function editing_ lib UIKitLib selector "isEditing" (obj_id as ptr) as Boolean
			  Return editing_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub editing_ lib UIKitLib selector "setEditing:" (obj_id as ptr, editing as Boolean)
			  editing_(self, value)
			End Set
		#tag EndSetter
		editing As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function extendedLayoutIncludesOpaqueBars_ lib UIKitLib selector "extendedLayoutIncludesOpaqueBars" (obj_id as ptr) as Boolean
			  Return extendedLayoutIncludesOpaqueBars_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub extendedLayoutIncludesOpaqueBars_ lib UIKitLib selector "setExtendedLayoutIncludesOpaqueBars:" (obj_id as ptr, extendedLayoutIncludesOpaqueBars as Boolean)
			  extendedLayoutIncludesOpaqueBars_(self, value)
			End Set
		#tag EndSetter
		extendedLayoutIncludesOpaqueBars As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hidesBottomBarWhenPushed_ lib UIKitLib selector "hidesBottomBarWhenPushed" (obj_id as ptr) as Boolean
			  Return hidesBottomBarWhenPushed_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub hidesBottomBarWhenPushed_ lib UIKitLib selector "setHidesBottomBarWhenPushed:" (obj_id as ptr, hidesBottomBarWhenPushed as Boolean)
			  hidesBottomBarWhenPushed_(self, value)
			End Set
		#tag EndSetter
		hidesBottomBarWhenPushed As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function modalInPopover_ lib UIKitLib selector "isModalInPopover" (obj_id as ptr) as Boolean
			  Return modalInPopover_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub modalInPopover_ lib UIKitLib selector "setModalInPopover:" (obj_id as ptr, modalInPopover as Boolean)
			  modalInPopover_(self, value)
			End Set
		#tag EndSetter
		modalInPopover As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function modalPresentationCapturesStatusBarAppearance_ lib UIKitLib selector "modalPresentationCapturesStatusBarAppearance" (obj_id as ptr) as Boolean
			  Return modalPresentationCapturesStatusBarAppearance_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub modalPresentationCapturesStatusBarAppearance_ lib UIKitLib selector "setModalPresentationCapturesStatusBarAppearance:" (obj_id as ptr, modalPresentationCapturesStatusBarAppearance as Boolean)
			  modalPresentationCapturesStatusBarAppearance_(self, value)
			End Set
		#tag EndSetter
		modalPresentationCapturesStatusBarAppearance As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function parentViewController_ lib UIKitLib selector "parentViewController" (obj_id as ptr) as ptr
			  Return new UIViewController(parentViewController_(self))
			End Get
		#tag EndGetter
		parentViewController As UIViewController
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target32Bit
			    declare function preferredContentSize_ lib UIKitLib selector "preferredContentSize" (obj_id as ptr) as NSSize32
			  #Elseif Target64Bit
			    declare function preferredContentSize_ lib UIKitLib selector "preferredContentSize" (obj_id as ptr) as NSSize64
			  #Endif
			  
			  Return preferredContentSize_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    declare sub preferredContentSize_ lib UIKitLib selector "setPreferredContentSize:" (obj_id as ptr, preferredContentSize as NSSize32)
			    preferredContentSize_(self, value.Value32)
			  #Elseif Target64Bit
			    declare sub preferredContentSize_ lib UIKitLib selector "setPreferredContentSize:" (obj_id as ptr, preferredContentSize as NSSize64)
			    preferredContentSize_(self, value.Value64)
			  #Endif
			  
			  
			End Set
		#tag EndSetter
		preferredContentSize As Foundation.NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function presentedViewController_ lib UIKitLib selector "presentedViewController" (obj_id as ptr) as ptr
			  Return new UIViewController(presentedViewController_(self))
			End Get
		#tag EndGetter
		presentedViewController As UIViewController
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function presentingViewController_ lib UIKitLib selector "presentingViewController" (obj_id as ptr) as ptr
			  Return new UIViewController(presentingViewController_(self))
			End Get
		#tag EndGetter
		presentingViewController As UIViewController
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function providesPresentationContextTransitionStyle_ lib UIKitLib selector "providesPresentationContextTransitionStyle" (obj_id as ptr) as Boolean
			  Return providesPresentationContextTransitionStyle_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub providesPresentationContextTransitionStyle_ lib UIKitLib selector "setProvidesPresentationContextTransitionStyle:" (obj_id as ptr, providesPresentationContextTransitionStyle as Boolean)
			  providesPresentationContextTransitionStyle_(self, value)
			End Set
		#tag EndSetter
		providesPresentationContextTransitionStyle As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function restorationIdentifier_ lib UIKitLib selector "restorationIdentifier" (obj_id as ptr) as CFStringRef
			  Return restorationIdentifier_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub restorationIdentifier_ lib UIKitLib selector "setRestorationIdentifier:" (obj_id as ptr, restorationIdentifier as CFStringRef)
			  restorationIdentifier_(self, value)
			End Set
		#tag EndSetter
		restorationIdentifier As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function title_ lib UIKitLib selector "title" (obj_id as ptr) as CFStringRef
			  Return title_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub title_ lib UIKitLib selector "setTitle:" (obj_id as ptr, title as CFStringRef)
			  title_(self, value)
			End Set
		#tag EndSetter
		title As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function toolbarItems_ lib UIKitLib selector "toolbarItems" (obj_id as ptr) as ptr
			  Return new NSArray(toolbarItems_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub toolbarItems_ lib UIKitLib selector "setToolbarItems:" (obj_id as ptr, toolbarItems as ptr)
			  toolbarItems_(self, value)
			End Set
		#tag EndSetter
		toolbarItems As NSArray
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
