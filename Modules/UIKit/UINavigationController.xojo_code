#tag Class
Class UINavigationController
Inherits UIViewController
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UINavigationController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(forView As iOSView)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  
		  Declare function initWithRootViewController_ lib FoundationLib selector "initWithRootViewController:" (obj_id as ptr, rootViewController as ptr) as ptr
		  
		  super.Constructor( initWithRootViewController_( Allocate(ClassRef), forView.ViewControllerHandle ) )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(forView As iOSView) As ptr
		  
		  
		  Declare function initWithRootViewController_ lib FoundationLib selector "initWithRootViewController:" (obj_id as ptr, rootViewController as ptr) as ptr
		  
		  
		  return initWithRootViewController_( Allocate(ClassRef), forView.ViewControllerHandle ) 
		  
		  'UINavigationController alloc] initWithRootViewController:self.frstVwCntlr]
		  '
		  '
		  'Declare Function alloc Lib FoundationLib selector "alloc" (classRef As Ptr) As Ptr
		  '
		  '
		  'declare function initWithRootViewController_ lib "UIKit" selector "initWithRootViewController:" (
		  '
		  '
		  'declare function NSClassFromString lib "Foundation" (classname as CFStringRef) as ptr
		  'declare function keyWindow lib "UIKit" selector "keyWindow" (obj_ref as ptr) as ptr
		  'declare function sharedApplication lib "UIKit" selector "sharedApplication" (obj_ref as ptr) as ptr
		  'declare function rootViewController lib "UIKit" selector "rootViewController" (obj_ref as ptr) as ptr
		  'declare function navigationBar lib "UIKit" selector "navigationBar" (obj_ref as ptr) as ptr
		  '
		  'declare function navigationController lib "UIKit" selector "navigationController" (viewController as ptr) as ptr
		  'dim navigationControllerRef as ptr = navigationController(v.ViewControllerHandle)
		  ''dim sApp as ptr = sharedApplication(NSClassFromString("UIApplication"))
		  'dim navBar as ptr = navigationBar(navigationControllerRef)
		  '
		  'declare sub setTintColor lib UIKitLib selector "setTintColor:" (id as ptr, UIColor as Ptr)
		  'setTintColor navBar, new UIColor(buttonColor)
		  '
		  'declare sub setBarTintColor lib UIKitLib selector "setBarTintColor:" (id as ptr, UIColor as Ptr)
		  'setBarTintColor navBar, new UIColor(barColor)
		  '
		  ''if translucent then
		  'declare sub setTranslucent lib UIKitLib selector "setTranslucent:" (id as ptr, value as Boolean)
		  'setTranslucent navBar, translucent
		  ''end
		  '
		  'declare sub setBarStyle lib UIKitLib selector "setBarStyle:" (id as ptr, theStyle as integer)
		  'setBarStyle navBar, 1 //UIStatusBarStyleLightContent
		  ''setBarStyle sApp, 1 //UIStatusBarStyleLightContent
		  '
		  '
		  ''if isIPad and v.ParentSplitView <> Nil then
		  '
		  '//This is done in the plist
		  '
		  ''declare function View lib UIKitLib selector "view" (id as ptr) as ptr
		  ''Declare sub setNeedsLayout lib UIKitLib selector "setNeedsLayout" (id as ptr)
		  ''
		  ''dim view As ptr = View(v.ParentSplitView.ViewControllerHandle)
		  ''setNeedsLayout (view)
		  '
		  ''navigationControllerRef = navigationController(v.ParentSplitView.ViewControllerHandle)
		  ''navigationControllerRef = navigationController(sApp)
		  ''navBar = navigationBar(navigationControllerRef)
		  '
		  ''setBarTintColor navBar, new UIColor(barColor)
		  '
		  ''setBarStyle navBar, 1 //UIStatusBarStyleLightContent
		  ''end if
		End Function
	#tag EndMethod


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
			Name="providesPresentationContextTransitionStyle"
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
