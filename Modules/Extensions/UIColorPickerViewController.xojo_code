#tag Class
Protected Class UIColorPickerViewController
Inherits UIKit.UINavigationController
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  
		  
		  
		  Super.Constructor(Initialize(Allocate(NSClassFromString("UIColorPickerViewController"))))
		  
		  Declare Sub setDelegate Lib UIKitLib selector "setDelegate:" (obj_id As ptr, del As ptr)
		  dim del as ptr = Initialize(Allocate(TargetClass))
		  setDelegate(self, del)
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(del) = xojo.core.WeakRef.Create(self)
		  
		  
		  needsExtraRelease = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFinish()
		  
		  
		  
		  Dim myColor As UIKit.UIColor = self.selectedColor
		  
		  Dim colValue As color = myColor.ColorValue
		  
		  
		  
		  RaiseEvent DidFinish(colValue)
		  
		  
		  'self.DismissViewControllerAnimatedCompletion(True, nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidSelectColor()
		  
		  Dim myColor As UIKit.UIColor = self.selectedColor
		  
		  Dim colValue As color = myColor.ColorValue
		  
		  RaiseEvent DidSelectColor(colValue)
		  
		  
		  'self.DismissViewControllerAnimatedCompletion(True, nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didFinish(pid as ptr, sel as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UIColorPickerViewController(w.Value).HandleDidFinish
		    
		    'dispatch.Remove(pid)
		  end if
		  
		  
		  #Pragma Unused sel
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didSelectColor(pid as ptr, sel as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UIColorPickerViewController(w.Value).HandleDidSelectColor
		  end if
		  
		  
		  #Pragma Unused sel
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsAvailable() As Boolean
		  
		  Dim sSystemVersion As Double
		  
		  //Get sSystemVersion only once
		  If sSystemVersion = 0.0 Then
		    
		    Declare Function currentDevice_ Lib UIKitLib selector "currentDevice" (clsRef As ptr) As ptr
		    Declare Function systemversion_ Lib UIKitLib selector "systemVersion" (obj_id As ptr) As CFStringRef
		    Dim device As Ptr = currentDevice_(NSClassFromString("UIDevice"))
		    Dim systemVersion As Text = systemversion_(device)
		    
		    Try
		      sSystemVersion = Double.FromText(systemVersion)
		    Catch
		    End Try
		    
		  End If
		  
		  if sSystemVersion >= 14.0 then Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53686F77732074686520466F6E745069636B6572
		Sub PresentInView(mView As iOSView, completion As iOSBlock = nil)
		  declare sub presentViewController lib UIKitLib selector "presentViewController:animated:completion:" _
		  (obj_id as ptr, controller as ptr, animated as Boolean, completion as ptr)
		  
		  if completion <> nil then
		    presentViewController(mView.ViewControllerHandle, self, True, completion.Handle)
		  else
		    presentViewController(mView.ViewControllerHandle, self, True, nil)
		  end if
		  
		  mparentViewController = mView //get a reference to dismiss ourself
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("colorPickerViewControllerDidFinish:", AddressOf impl_didFinish, "v@:@")
		    methods.Append new TargetClassMethodHelper("colorPickerViewControllerDidSelectColor:", AddressOf impl_didSelectColor, "v@:@")
		    
		    targetID = BuildTargetClass("NSObject","UIColorPickerViewControllerDelegate",methods)
		  end if
		  Return targetID
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidFinish(value As color)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidSelectColor(value As color)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mparentViewController As iOSView
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function selectedColor_ lib UIKitLib selector "selectedColor" (obj as ptr) as ptr
			  Return new UIKit.UIColor(selectedColor_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setSelectedColor_ lib UIKitLib selector "setSelectedColor:" (obj as ptr, value as ptr)
			  setSelectedColor_(self, value)
			End Set
		#tag EndSetter
		selectedColor As UIKit.UIColor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return selectedColor.ColorValue
			End Get
		#tag EndGetter
		selectedColorValue As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function supportsAlpha_ lib UIKitLib selector "supportsAlpha" (obj as ptr) as Boolean
			  Return supportsAlpha_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub supportsAlpha_ lib UIKitLib selector "setSupportsAlpha:" (obj as ptr, value as Boolean)
			  supportsAlpha_(self, value)
			End Set
		#tag EndSetter
		supportsAlpha As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="automaticallyAdjustsScrollViewInsets"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="definesPresentationContext"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="editing"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="extendedLayoutIncludesOpaqueBars"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="hidesBottomBarWhenPushed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalInPopover"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalPresentationCapturesStatusBarAppearance"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="providesPresentationContextTransitionStyle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalPresentationStyle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UIModalPresentationStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - Fullscreen"
				"1 - PageSheet"
				"2 - FormSheet"
				"3 - CurrentContext"
				"4 - Custom"
				"5 - OverFullScreen"
				"6 - OverCurrentContext"
				"7 - Popover"
				"-1 - None"
			#tag EndEnumValues
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
		#tag ViewProperty
			Name="supportsAlpha"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="selectedColorValue"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
