#tag Class
Class UIView
Inherits UIResponder
	#tag Method, Flags = &h0
		Sub AnimateAlpha(alpha as Double, duration as Double, completion as iOSBlock = nil)
		  
		  TransformToAlpha = alpha
		  Dim animations as new iOSBlock (AddressOf TransformAlphaBlock)
		  
		  
		  Dim classPtr As ptr
		  Declare sub animateWithDuration_ lib UIKitLib selector "animateWithDuration:animations:completion:" _
		  (id as ptr, duration as Double, animations as ptr, completion as ptr)
		  
		  classPtr = NSClassFromString("UIView")
		  
		  if completion is nil then
		    animateWithDuration_ classptr, duration, Animations.handle, nil
		  else
		    animateWithDuration_ classptr, duration, Animations.handle, completion.Handle
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AnimateFrame(Frame As NSRect, duration as Double, completion as iOSBlock = nil)
		  
		  TransformToFrame = Frame
		  Dim animations as new iOSBlock (AddressOf TransformFrameBlock)
		  
		  
		  Dim classPtr As ptr
		  
		  
		  
		  Declare sub animateWithDuration_ lib UIKitLib selector "animateWithDuration:animations:completion:" _
		  (id as ptr, duration as Double, animations as ptr, completion as ptr)
		  
		  classPtr = NSClassFromString("UIView")
		  
		  if completion is nil then
		    animateWithDuration_ classptr, duration, Animations.handle, nil
		  else
		    animateWithDuration_ classptr, duration, Animations.handle, completion.Handle
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(rect as NSRect)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  
		  declare function initWithFrame lib UIKitLib selector "initWithFrame:" _
		  (clsRef as ptr, frame as NSRect64) as ptr
		  Super.Constructor(initWithFrame(Allocate(NSClassFromString("UIView")),rect.Value64))
		  
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( hidden ) Private Sub TransformAlphaBlock()
		  
		  
		  
		  declare sub setAlphaValue lib UIKitLib selector "setAlpha:" (id as ptr, value as CGFloat)
		  setAlphaValue self.id, TransformToAlpha
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( hidden ) Private Sub TransformFrameBlock()
		  
		  
		  
		  Declare Sub setFrame Lib UIKitLib selector "setFrame:" (obj_id As ptr, frame As NSRect64)
		  setFrame(self.id, TransformToFrame.Value64)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0, Description = 5468652076696577E280997320616C7068612076616C75652E
		#tag Getter
			Get
			  
			  declare function alphaValue lib UIKitLib selector "alpha" (id as ptr) as Single
			  
			  return alphaValue (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  declare sub setAlphaValue lib UIKitLib selector "setAlpha:" (id as ptr, value as Single)
			  
			  setAlphaValue id, value
			  
			End Set
		#tag EndSetter
		Alpha As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  declare function bounds lib UIKitLib selector "bounds" (obj_id as Ptr) as CGRect64
			  
			  Dim re As CGRect64 = bounds(self)
			  
			  
			  Return new xojo.Core.Rect(re.origin.x, re.origin.y, re.rsize.w, re.rsize.h)
			  
			End Get
		#tag EndGetter
		bounds As xojo.Core.Rect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  declare function frame lib UIKitLib selector "frame" (obj_id as Ptr) as CGRect64
			  
			  
			  
			  Dim re As CGRect64 = frame(self)
			  
			  
			  Return new xojo.Core.Rect(re.origin.x, re.origin.y, re.rsize.w, re.rsize.h)
			  
			End Get
		#tag EndGetter
		frame As xojo.Core.Rect
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			
			TransformToAlpha = alpha
		#tag EndNote
		Attributes( hidden ) Private TransformToAlpha As Double = 1.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( hidden ) Private TransformToFrame As Foundation.NSRect
	#tag EndProperty


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
		#tag ViewProperty
			Name="Alpha"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
