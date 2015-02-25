#tag Class
 Attributes ( unfinished ) Protected Class ScrollView
Inherits iOSUserControl
	#tag Event
		Function CreateView() As UInteger
		  dim scrollerRef as ptr = NSClassFromString("UIScrollView")
		  dim mWidth, mHeight, mLeft, mTop as Integer
		  mLeft = 0
		  mTop = 0
		  mWidth = 100
		  mHeight = 100
		  
		  DesiredBounds(mLeft,mTop,mWidth,mHeight)
		  
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  
		  #if Target32Bit
		    declare function initWithFrame lib FoundationLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect32) as ptr
		  #Elseif Target64Bit
		    declare function initWithFrame lib FoundationLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect64) as ptr
		  #Endif
		  dim frame as new NSRect
		  frame.origin.x = mLeft
		  frame.origin.y = mTop
		  frame.rsize.w = mWidth
		  frame.rsize.h = mHeight
		  
		  #if Target32Bit
		    dim selfRef as ptr = initWithFrame(alloc(scrollerRef),frame.Value32)
		  #Elseif Target64Bit
		    dim selfRef as ptr = initWithFrame(alloc(scrollerRef),frame.Value64)
		  #Endif
		  
		  declare sub setScrollEnabled lib UIKitLib selector "setScrollEnabled:" (obj_id as ptr, yesNo as Boolean)
		  setScrollEnabled(self.Handle,True)
		  
		  #if Target32Bit
		    declare sub setContentSize lib UIKitLib selector "setContentSize:" (obj_id as ptr, rsize as NSSize32)
		  #Elseif Target64Bit
		    declare sub setContentSize lib UIKitLib selector "setContentSize:" (obj_id as ptr, rsize as NSSize64)
		  #Endif
		  dim sz as new NSSize
		  sz.w = 2000
		  sz.h = 2000
		  #if Target32Bit
		    setContentSize(self.Handle,sz.Value32)
		  #Else
		    setContentSize(self.Handle,sz.Value64)
		  #Endif
		  
		  declare sub setBackgroundColor lib UIKitLib selector "setBackgroundColor:" (obj_id as ptr, col as ptr)
		  setBackgroundColor(selfRef,UIColor.LightGray)
		  
		  Return UInteger(selfRef)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub flashScrollIndicators()
		  Declare sub flashScrollIndicators_ lib UIKitLib selector "flashScrollIndicators" (obj_id as ptr)
		  flashScrollIndicators_(self.Handle)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DesiredBounds(byref xInset as integer, byref yInset as integer, byref width as integer, byref height as integer)
	#tag EndHook


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
