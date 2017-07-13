#tag Class
Protected Class UIAlertController
Inherits UIViewController
	#tag Method, Flags = &h0
		Sub AddAction(action as UIAlertAction)
		  declare sub addAction_ lib UIKitLib selector "addAction:" (obj_id as ptr, action as ptr)
		  addAction_(self, action)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AlertControllerWithTitleMessagePreferredStyle(title as CFStringRef, message as CFStringRef, preferredStyle as UIAlertControllerStyle) As UIAlertController
		  Declare Function alertControllerWithTitle_ Lib UIKitLib selector "alertControllerWithTitle:message:preferredStyle:" (clsRef As ptr, title As CFStringRef, message As CFStringRef, preferredStyle As UIAlertControllerStyle) As ptr
		  
		  Dim t As Text = title
		  Dim m As Text = message
		  
		  If t.Empty = False And m.Empty = False Then
		    Return New UIAlertController(alertControllerWithTitle_(ClassRef, title, message, preferredStyle))
		    
		    
		  Elseif t.Empty = False Then
		    Return New UIAlertController(alertControllerWithTitle_(ClassRef, title, Nil, preferredStyle))
		    
		  Elseif m.Empty = False Then
		    Return New UIAlertController(alertControllerWithTitle_(ClassRef, title, message, preferredStyle))
		    
		  Else
		    Return New UIAlertController(alertControllerWithTitle_(ClassRef, Nil, Nil, preferredStyle))
		    
		  End If
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIAlertController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompHandler()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  'Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Dismiss()
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(mParentView.ViewControllerHandle, True, nil)
		  
		  mParentView = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(parentView as iOSView)
		  declare sub presentViewController_ lib UIKitLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewCtrlr as ptr, animated as Boolean, compHandler as ptr)
		  dim blk as new iOSBlock(AddressOf CompHandler)
		  mParentView = parentView
		  presentViewController_(parentView.ViewControllerHandle, self, True, blk.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function actions_ lib UIKitLib selector "actions" (obj_id as ptr) as ptr
			  Return new NSArray(actions_(self))
			End Get
		#tag EndGetter
		actions As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function message_ lib UIKitLib selector "message" (obj_id as ptr) as CFStringRef
			  Return message_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub message_ lib UIKitLib selector "setMessage:" (obj_id as ptr, message as CFStringRef)
			  message_(self, value)
			End Set
		#tag EndSetter
		message As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mParentView As iOSView
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredStyle_ lib UIKitLib selector "preferredStyle" (obj_id as ptr) as UIAlertControllerStyle
			  Return (preferredStyle_(self))
			End Get
		#tag EndGetter
		preferredStyle As UIAlertControllerStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function textFields_ lib UIKitLib selector "textFields" (obj_id as ptr) as ptr
			  Return new NSArray(textFields_(self))
			End Get
		#tag EndGetter
		textFields As NSArray
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
		title As Text
	#tag EndComputedProperty


	#tag Enum, Name = UIAlertControllerStyle, Type = Integer, Flags = &h0
		ActionSheet = 0
		Alert = 1
	#tag EndEnum


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
			Name="message"
			Group="Behavior"
			Type="Text"
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
			Name="preferredStyle"
			Group="Behavior"
			Type="UIAlertControllerStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - ActionSheet"
				"1 - Alert"
			#tag EndEnumValues
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
			Name="title"
			Group="Behavior"
			Type="Text"
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
