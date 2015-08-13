#tag Class
Protected Class UIStepper
Inherits iOSUserControl
	#tag Event
		Function CreateView() As UInteger
		  #If Target32Bit
		    declare function initWithFrame lib UIKitLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect32) as ptr
		  #Elseif Target64Bit
		    declare function initWithFrame lib UIKitLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect64) as ptr
		  #Endif
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  dim frame as new NSRect
		  frame.rsize.w = 100
		  frame.rsize.h = 100
		  #if Target32Bit
		    dim selfRef as ptr = initWithFrame(alloc(ClassRef),frame.Value32)
		  #Elseif Target64Bit
		    dim selfRef as ptr = initWithFrame(alloc(ClassRef),frame.Value64)
		  #Endif
		  
		  declare function init lib FoundationLib selector "init" (obj_id as Ptr) as ptr
		  dim target as ptr = init(alloc(TargetClass))
		  
		  using Xojo.Core
		  if dispatch = nil then dispatch = new Dictionary
		  dispatch.Value(Target) = xojo.core.WeakRef.Create(self)
		  
		  declare sub addTarget lib UIKitLib selector "addTarget:action:forControlEvents:" (obj_id as ptr, target as ptr, action as ptr, events as Integer)
		  const UIControlEventValueChanged = 4096
		  addTarget(selfRef, Target, NSSelectorFromString("action:"), UIControlEventValueChanged)
		  
		  Return UInteger(selfRef)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BackgroundImageForState(state as UIControlState) As iOSImage
		  declare function backgroundImageForState_ lib UIKitLib selector "backgroundImageForState:" (obj_id as ptr, state as UIControlState) as ptr
		  Return iOSImage.FromHandle(backgroundImageForState_(self.Handle, state))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIStepper")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecrementImageForState(state as UIControlState) As iOSImage
		  declare function decrementImageForState_ lib UIKitLib selector "decrementImageForState:" (obj_id as ptr, state as UIControlState) as ptr
		  Return iOSImage.FromHandle(decrementImageForState_(self.Handle, state))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DividerImageForLeftSegmentStateRightSegmentState(leftState as UIControlState, rightState as UIControlState) As iOSImage
		  declare function dividerImageForLeftSegmentState_ lib UIKitLib selector "dividerImageForLeftSegmentState:rightSegmentState:" (obj_id as ptr, leftState as UIControlState, rightState as UIControlState) as ptr
		  Return iOSImage.FromHandle(dividerImageForLeftSegmentState_(self.Handle, leftState, rightState))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleAction()
		  RaiseEvent ValueChanged
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_action(pid as ptr, sel as ptr, sender as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UIStepper(w.Value).HandleAction
		  end if
		  
		  #Pragma Unused sel
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IncrementImageForState(state as UIControlState) As iOSImage
		  declare function incrementImageForState_ lib UIKitLib selector "incrementImageForState:" (obj_id as ptr, state as UIControlState) as ptr
		  Return iOSImage.FromHandle(incrementImageForState_(self.Handle, state))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBackgroundImageForState(image as iOSImage, state as UIControlState)
		  declare sub setBackgroundImage_ lib UIKitLib selector "setBackgroundImage:forState:" (obj_id as ptr, image as ptr, state as UIControlState)
		  setBackgroundImage_(self.Handle, image.Handle, state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDecrementImageForState(image as iOSImage, state as UIControlState)
		  declare sub setDecrementImage_ lib UIKitLib selector "setDecrementImage:forState:" (obj_id as ptr, image as ptr, state as UIControlState)
		  setDecrementImage_(self.Handle, image.Handle, state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDividerImageForLeftSegmentStateRightSegmentState(image as iOSImage, leftState as UIControlState, rightState as UIControlState)
		  declare sub setDividerImage_ lib UIKitLib selector "setDividerImage:forLeftSegmentState:rightSegmentState:" (obj_id as ptr, image as ptr, leftState as UIControlState, rightState as UIControlState)
		  setDividerImage_(self.Handle, image.Handle, leftState, rightState)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIncrementImageForState(image as iOSImage, state as UIControlState)
		  declare sub setIncrementImage_ lib UIKitLib selector "setIncrementImage:forState:" (obj_id as ptr, image as ptr, state as UIControlState)
		  setIncrementImage_(self.Handle, image.Handle, state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("action:", AddressOf impl_action, "v@:@")
		    
		    targetID = BuildTargetClass("NSObject","UIStepperActionClass",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function autorepeat_ lib UIKitLib selector "autorepeat" (obj_id as ptr) as Boolean
			  Return autorepeat_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub autorepeat_ lib UIKitLib selector "setAutorepeat:" (obj_id as ptr, autorepeat as Boolean)
			  autorepeat_(self.Handle, value)
			End Set
		#tag EndSetter
		autorepeat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function continuous_ lib UIKitLib selector "isContinuous" (obj_id as ptr) as Boolean
			  Return continuous_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub continuous_ lib UIKitLib selector "setContinuous:" (obj_id as ptr, continuous as Boolean)
			  continuous_(self.Handle, value)
			End Set
		#tag EndSetter
		continuous As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maximumValue_ lib UIKitLib selector "maximumValue" (obj_id as ptr) as Double
			  Return maximumValue_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub maximumValue_ lib UIKitLib selector "setMaximumValue:" (obj_id as ptr, maximumValue as Double)
			  maximumValue_(self.Handle, value)
			End Set
		#tag EndSetter
		maximumValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function minimumValue_ lib UIKitLib selector "minimumValue" (obj_id as ptr) as Double
			  Return minimumValue_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub minimumValue_ lib UIKitLib selector "setMinimumValue:" (obj_id as ptr, minimumValue as Double)
			  minimumValue_(self.Handle, value)
			End Set
		#tag EndSetter
		minimumValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function stepValue_ lib UIKitLib selector "stepValue" (obj_id as ptr) as Double
			  Return stepValue_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub stepValue_ lib UIKitLib selector "setStepValue:" (obj_id as ptr, stepValue as Double)
			  stepValue_(self.Handle, value)
			End Set
		#tag EndSetter
		stepValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function tintColor_ lib UIKitLib selector "tintColor" (obj_id as ptr) as ptr
			  return new UIColor(tintColor_(self.Handle))
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub tintColor_ lib UIKitLib selector "setTintColor:" (obj_id as ptr, tintColor as ptr)
			  tintColor_(self.Handle, value)
			End Set
		#tag EndSetter
		tintColor As UIKit.UIColor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function value_ lib UIKitLib selector "value" (obj_id as ptr) as Double
			  Return value_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub value_ lib UIKitLib selector "setValue:" (obj_id as ptr, value as Double)
			  value_(self.Handle, value)
			End Set
		#tag EndSetter
		value As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function wraps_ lib UIKitLib selector "wraps" (obj_id as ptr) as Boolean
			  Return wraps_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub wraps_ lib UIKitLib selector "setWraps:" (obj_id as ptr, wraps as Boolean)
			  wraps_(self.Handle, value)
			End Set
		#tag EndSetter
		wraps As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = UIControlState, Type = Integer, Flags = &h0
		Normal = 0
		  Highlighted = 1
		  Disabled = 2
		Selected = 4
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityHint"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autorepeat"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="continuous"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			Type="Double"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="maximumValue"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="minimumValue"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="stepValue"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Double"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="value"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="wraps"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
