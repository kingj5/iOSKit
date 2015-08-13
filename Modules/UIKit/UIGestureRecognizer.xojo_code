#tag Class
Class UIGestureRecognizer
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(subclassName as Text)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  declare function initWithTargetAndAction lib UIKitLib selector "initWithTarget:action:" _
		  (obj_id as ptr, target as ptr, action as ptr) as ptr
		  
		  dim target as Ptr = Initialize(Allocate(TargetClass))
		  
		  Super.Constructor initWithTargetAndAction(Allocate(NSClassFromString(subclassName)), target, NSSelectorFromString("handleGesture:"))
		  
		  using Xojo.Core
		  if TargetDictionary = nil then TargetDictionary = new Dictionary
		  TargetDictionary.Value(target) = xojo.core.WeakRef.Create(self)
		  
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Gesture(additionalData as UIGestureRecognizer)
		  RaiseEvent Gesture(additionalData)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_action(pid as ptr, sel as ptr, gestureRecognizer as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(TargetDictionary.Value(pid))
		  if w.Value <> nil Then
		    UIGestureRecognizer(w.Value).Gesture(new UIGestureRecognizer(gestureRecognizer))
		  end if
		  
		  #Pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function locationInView(view as UIView) As NSPoint
		  #If Target32Bit
		    declare function locationInView lib UIKitLib selector "locationInView:" (obj_id as ptr,view as ptr) as NSPoint32
		  #Elseif Target64Bit
		    declare function locationInView lib UIKitLib selector "locationInView:" (obj_id as ptr,view as ptr) as NSPoint64
		  #Endif
		  if view <> nil then
		    return locationInView(self,view)
		  else
		    return locationInView(self,nil)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function locationInWindow() As NSPoint
		  Return self.locationInView(nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function locationOfTouchInView(touchIndex as uint32, view as UIView) As NSPoint
		  #if Target32Bit
		    declare function locationOfTouchInView lib UIKitLib selector "locationOfTouch:inView:" _
		    (obj_id as ptr, touchIndex as uint32, view as ptr) as NSPoint32
		  #Elseif Target64Bit
		    declare function locationOfTouchInView lib UIKitLib selector "locationOfTouch:inView:" _
		    (obj_id as ptr, touchIndex as uint32, view as ptr) as NSPoint64
		  #Endif
		  if view <> nil then
		    Return locationOfTouchInView(self,touchIndex,view)
		  else
		    Return locationOfTouchInView(self,touchIndex,nil)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function numberOfTouches() As UInt32
		  declare function numberOfTouches lib UIKitLib selector "numberOfTouches" (obj_id as ptr) as UInt32
		  Return numberOfTouches(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("handleGesture:", AddressOf impl_action, "v@:@")
		    targetID = BuildTargetClass("NSObject","UIGestureNSObjectTarget",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Gesture(additionalData as UIGestureRecognizer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function state_ lib UIKitLib selector "state" (obj_id as ptr) as TouchState
			  Return state_(self)
			End Get
		#tag EndGetter
		state As TouchState
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Shared TargetDictionary As Xojo.Core.Dictionary
	#tag EndProperty


	#tag Enum, Name = TouchState, Flags = &h0
		Ended = 3
		  Began = 1
		Changed = 2
	#tag EndEnum


	#tag ViewBehavior
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
			Name="state"
			Group="Behavior"
			Type="TouchState"
			EditorType="Enum"
			#tag EnumValues
				"3 - Ended"
				"1 - Began"
				"2 - Changed"
			#tag EndEnumValues
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
