#tag Class
Protected Class SwipeView
Inherits iOSUserControl
	#tag Event
		Function CreateView() As UInteger
		  #If Target32Bit
		    declare function initWithFrame lib UIKitLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect32) as ptr
		  #Elseif Target64Bit
		    declare function initWithFrame lib UIKitLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect64) as ptr
		  #Endif
		  declare function alloc lib UIKitLib selector "alloc" (clsRef as ptr) as ptr
		  
		  dim frame as new NSRect
		  frame.origin.x = 0
		  frame.origin.y = 0
		  frame.rsize.w = self.Width
		  frame.rsize.h = self.Height
		  
		  #if Target32Bit
		    dim selfRef as ptr = initWithFrame(alloc(TargetClass),frame.Value32)
		  #Elseif Target64Bit
		    dim selfRef as ptr = initWithFrame(alloc(TargetClass),frame.Value64)
		  #Endif
		  
		  using xojo.Core
		  if dispatch = nil then dispatch = new Dictionary
		  dispatch.Value(selfRef) = xojo.core.WeakRef.Create(self)
		  
		  Return UInteger(selfRef)
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim useGestures as Boolean = raiseEvent UsesGestures
		  
		  if useGestures then
		    LeftRecognizer = new UISwipeGestureRecognizer(UISwipeGestureRecognizer.SwipeDirection.Left)
		    RightRecognizer = new UISwipeGestureRecognizer(UISwipeGestureRecognizer.SwipeDirection.Right)
		    UpRecognizer = new UISwipeGestureRecognizer(UISwipeGestureRecognizer.SwipeDirection.Up)
		    DownRecognizer = new UISwipeGestureRecognizer(UISwipeGestureRecognizer.SwipeDirection.Down)
		    TapRecognizer = new UITapGestureRecognizer
		    
		    AddHandler LeftRecognizer.Gesture, AddressOf HandleLeftSwipe
		    AddHandler RightRecognizer.Gesture, AddressOf HandleRightSwipe
		    AddHandler UpRecognizer.Gesture, AddressOf HandleUpSwipe
		    AddHandler DownRecognizer.Gesture, AddressOf HandleDownSwipe
		    AddHandler TapRecognizer.Gesture, AddressOf HandleTap
		    
		    declare sub addGestureRecognizer lib UIKitLib selector "addGestureRecognizer:" _
		    (view as ptr, recognizer as ptr)
		    addGestureRecognizer(self.Handle, LeftRecognizer)
		    addGestureRecognizer(self.Handle, RightRecognizer)
		    addGestureRecognizer(self.Handle, UpRecognizer)
		    addGestureRecognizer(self.Handle, DownRecognizer)
		    addGestureRecognizer(self.Handle, TapRecognizer)
		  else
		    declare sub setMultipleTouchEnabled lib UIKitLib selector "setMultipleTouchEnabled:" (obj_id as ptr, yesNo as Boolean)
		    setMultipleTouchEnabled(self.Handle,True)
		  end if
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub HandleDownSwipe(sender as UIKit.UISwipeGestureRecognizer, additionalData as UIKit.UIGestureRecognizer)
		  SwipeDown(additionalData)
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleLeftSwipe(sender as UIKit.UISwipeGestureRecognizer, additionalData as UIKit.UIGestureRecognizer)
		  SwipeLeft(additionalData)
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRightSwipe(sender as UIKit.UISwipeGestureRecognizer, additionalData as UIKit.UIGestureRecognizer)
		  SwipeRight(additionalData)
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleShakeBegan()
		  RaiseEvent ShakeBegan
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleShakeEnded()
		  RaiseEvent ShakeEnded
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTap(sender as UIKit.UIGestureRecognizer, additionalData as UIKit.UIGestureRecognizer)
		  if additionalData.state = UIGestureRecognizer.TouchState.Ended then
		    dim tmp as NSPoint = additionalData.locationInView(new UIView(self.Handle))
		    Tap(new xojo.Core.Point(tmp.x,tmp.y))
		  end if
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTouchesBegan(touches() as UIKit.UITouch)
		  using Xojo.Core
		  dim locations() as Point
		  dim tmp as NSPoint
		  for i as Integer = 0 to touches.Ubound
		    tmp = touches(i).locationInView(new UIView(self.Handle))
		    locations.Append new Point(tmp.x, tmp.y)
		  next
		  RaiseEvent TouchesBegan(locations)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTouchesEnded(touches() as UIKit.UITouch)
		  using Xojo.Core
		  dim locations() as Point
		  dim tmp as NSPoint
		  for i as Integer = 0 to touches.Ubound
		    tmp = touches(i).locationInView(new UIView(self.Handle))
		    locations.Append new Point(tmp.x, tmp.y)
		  next
		  RaiseEvent TouchesMoved(locations)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTouchesMoved(touches() as UIKit.UITouch)
		  using Xojo.Core
		  dim locations() as Point
		  dim tmp as NSPoint
		  for i as Integer = 0 to touches.Ubound
		    tmp = touches(i).locationInView(new UIView(self.Handle))
		    locations.Append new Point(tmp.x, tmp.y)
		  next
		  RaiseEvent TouchesMoved(locations)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleUpSwipe(sender as UIKit.UISwipeGestureRecognizer, additionalData as UIKit.UIGestureRecognizer)
		  SwipeUp(additionalData)
		  
		  #Pragma Unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_canBecomeFirstResponder(pid as ptr, sel as ptr) As Boolean
		  Return True
		  
		  #Pragma Unused pid 
		  #Pragma Unused sel
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_drawRect32(pid as ptr, sel as ptr, dirtyRect as NSRect32)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SwipeView(w.Value).mDrawRect(dirtyRect)
		  end if
		  
		  #Pragma Unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_drawRect64(pid as ptr, sel as ptr, dirtyRect as NSRect64)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SwipeView(w.Value).mDrawRect(dirtyRect)
		  end if
		  
		  #Pragma unused sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_motionBegan(pid as ptr, sel as ptr, eventsubtype as integer, evt as ptr)
		  const UIEventSubtypeMotionShake = 1
		  
		  declare function subtype lib UIKitLib selector "subtype" (obj_id as ptr) as Integer
		  if subtype(evt) = UIEventSubtypeMotionShake then
		    dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		    if w.Value <> nil Then
		      SwipeView(w.Value).HandleShakeBegan
		    end if
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused eventsubtype
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_motionEnded(pid as ptr, sel as ptr, eventsubtype as integer, evt as ptr)
		  const UIEventSubtypeMotionShake = 1
		  
		  declare function subtype lib UIKitLib selector "subtype" (obj_id as ptr) as Integer
		  if subtype(evt) = UIEventSubtypeMotionShake then
		    dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		    if w.Value <> nil Then
		      SwipeView(w.Value).HandleShakeEnded
		    end if
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused eventsubtype
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_touchesBegan(pid as ptr, sel as ptr, touchesSet as ptr, evt as ptr)
		  declare function allObjects lib UIKitLib selector "allObjects" (obj_id as ptr) as ptr
		  dim nsarr as ptr = allObjects(touchesSet)
		  
		  declare function count lib UIKitLib selector "count" (obj_id as ptr) as Integer
		  dim objCount as Integer = count(nsarr)
		  
		  declare function objectAtIndex lib UIKitLib selector "objectAtIndex:" (obj_id as ptr, index as Integer) as ptr
		  
		  using UIKit
		  dim touches() as UITouch
		  for i as integer = 0 to objCount-1
		    touches.Append new UITouch(objectAtIndex(nsarr,i))
		  next
		  
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SwipeView(w.Value).HandleTouchesBegan(touches)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused evt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_touchesEnded(pid as ptr, sel as ptr, touchesSet as ptr, evt as ptr)
		  
		  declare function allObjects lib UIKitLib selector "allObjects" (obj_id as ptr) as ptr
		  dim nsarr as ptr = allObjects(touchesSet)
		  
		  declare function count lib UIKitLib selector "count" (obj_id as ptr) as Integer
		  dim objCount as Integer = count(nsarr)
		  
		  declare function objectAtIndex lib UIKitLib selector "objectAtIndex:" (obj_id as ptr, index as Integer) as ptr
		  
		  using UIKit
		  dim touches() as UITouch
		  for i as integer = 0 to objCount-1
		    touches.Append new UITouch(objectAtIndex(nsarr,i))
		  next
		  
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SwipeView(w.Value).HandleTouchesEnded(touches)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused evt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_touchesMoved(pid as ptr, sel as ptr, touchesSet as ptr, evt as ptr)
		  declare function allObjects lib UIKitLib selector "allObjects" (obj_id as ptr) as ptr
		  dim nsarr as ptr = allObjects(touchesSet)
		  
		  declare function count lib UIKitLib selector "count" (obj_id as ptr) as Integer
		  dim objCount as Integer = count(nsarr)
		  
		  declare function objectAtIndex lib UIKitLib selector "objectAtIndex:" (obj_id as ptr, index as Integer) as ptr
		  
		  using UIKit
		  dim touches() as UITouch
		  for i as integer = 0 to objCount-1
		    touches.Append new UITouch(objectAtIndex(nsarr,i))
		  next
		  
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    SwipeView(w.Value).HandleTouchesMoved(touches)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused evt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invalidate()
		  declare sub setNeedsDisplay lib UIKitLib selector "setNeedsDisplay" (obj_id as ptr)
		  setNeedsDisplay(self.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mDrawRect(dirtyRect as NSRect)
		  static e as Extensions.EditableIOSImage
		  e = new Extensions.EditableIOSImage(dirtyRect.rsize.w,dirtyRect.rsize.h)
		  e.graphics.FillColor = Color.Black
		  e.graphics.FillRect 0,0,e.graphics.Width,e.graphics.Height
		  Paint(e.graphics)
		  
		  #if Target32Bit
		    declare sub drawInRect lib UIKitLib selector "drawInRect:" (obj_id as ptr, rect as NSRect32)
		    drawInRect(e.Image.Handle,dirtyRect.Value32)
		  #Elseif Target64Bit
		    declare sub drawInRect lib UIKitLib selector "drawInRect:" (obj_id as ptr, rect as NSRect64)
		    drawInRect(e.Image.Handle,dirtyRect.Value64)
		  #Endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    //detecting shaking
		    methods.Append new TargetClassMethodHelper("canBecomeFirstResponder", AddressOf impl_canBecomeFirstResponder, "B@:")
		    methods.Append new TargetClassMethodHelper("motionBegan:withEvent:", AddressOf impl_motionBegan, "v@:i@")
		    methods.Append new TargetClassMethodHelper("motionEnded:withEvent:", AddressOf impl_motionEnded, "v@:i@")
		    
		    //drawing/Paint event
		    #if Target32Bit
		      methods.Append new TargetClassMethodHelper("drawRect:", AddressOf impl_drawRect32, "v@:{NSRect=ffff}")
		    #Elseif Target64Bit
		      methods.Append new TargetClassMethodHelper("drawRect:", AddressOf impl_drawRect64, "v@:{NSRect=ffff}")
		    #Endif
		    
		    //touches
		    methods.Append new TargetClassMethodHelper("touchesBegan:withEvent:", AddressOf impl_touchesBegan, "v@:@@")
		    methods.Append new TargetClassMethodHelper("touchesMoved:withEvent:", AddressOf impl_touchesMoved, "v@:@@")
		    methods.Append new TargetClassMethodHelper("touchesEnded:withEvent:", AddressOf impl_touchesEnded, "v@:@@")
		    
		    targetID = BuildTargetClass("UIView","MySwipeView",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g as iOSGraphics)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShakeBegan()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShakeEnded()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SwipeDown(additionalData as UIKit.UIGestureRecognizer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SwipeLeft(additionalData as UIKit.UIGestureRecognizer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SwipeRight(additionalData as UIKit.UIGestureRecognizer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SwipeUp(additionalData as UIKit.UIGestureRecognizer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Tap(location as xojo.Core.Point)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TouchesBegan(locations() as Xojo.Core.Point)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TouchesEnded(locations() as Xojo.Core.Point)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TouchesMoved(locations() as Xojo.Core.Point)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UsesGestures() As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DownRecognizer As UISwipeGestureRecognizer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LeftRecognizer As UISwipeGestureRecognizer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RightRecognizer As UISwipeGestureRecognizer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TapRecognizer As UIKit.UITapGestureRecognizer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UpRecognizer As UISwipeGestureRecognizer
	#tag EndProperty


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
			Type="Integer"
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
	#tag EndViewBehavior
End Class
#tag EndClass
