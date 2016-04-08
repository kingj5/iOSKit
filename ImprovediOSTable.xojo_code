#tag Class
Protected Class ImprovediOSTable
Inherits iOSTable
	#tag Event
		Sub Open()
		  declare function object_getClass lib "/usr/lib/libobjc.A.dylib" (cls As Ptr) As Ptr
		  declare function NSSelectorFromString lib "Foundation" (aSelectorName as CFStringRef) as Ptr
		  declare function class_addMethod lib "/usr/lib/libobjc.A.dylib" (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		  declare function class_replaceMethod lib "/usr/lib/libobjc.A.dylib" (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		  
		  
		  declare function NSClassFromString lib "Foundation" (clsName as CFStringRef) as ptr
		  declare function getDelegate lib "UIKit" selector "delegate" (obj_id as ptr) as ptr
		  
		  dim mydel as ptr = getDelegate(self.Handle)
		  dim mydelClass as ptr = object_getClass(mydel)
		  
		  if not class_addMethod(mydelClass, NSSelectorFromString("scrollViewDidEndDecelerating:"), _
		  AddressOf impl_scrollViewDidScroll, "v@:@") then break
		  
		  'declare function NSStringFromClass lib "Foundation" (aClass as ptr) as CFStringRef
		  'declare function NSProtocolFromString lib "Foundation" (protocolName as CFStringRef) as ptr
		  '
		  'declare function class_conformsToProtocol lib "/usr/lib/libobjc.A.dylib" (cls as ptr, protocol as ptr) as Boolean
		  
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(mydel) = xojo.Core.WeakRef.Create(self)
		  
		  RaiseEvent Open
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub didScroll(sView as ptr)
		  'float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
		  'if (bottomEdge >= scrollView.contentSize.height) {
		  '// we are at the end
		  '}
		  
		  #if Target32Bit
		    declare function frame lib UIKitLib selector "frame" (obj_id as ptr) as NSRect32
		    declare function contentOffset lib UIKitLib selector "contentOffset" (obj_id as ptr) as NSPoint32
		    declare function contentSize lib UIKitLib selector "contentSize" (obj_id as Ptr) as NSSize32
		  #Elseif Target64Bit
		    declare function frame lib UIKitLib selector "frame" (obj_id as ptr) as NSRect64
		    declare function contentOffset lib UIKitLib selector "contentOffset" (obj_id as ptr) as NSPoint64
		    declare function contentSize lib UIKitLib selector "contentSize" (obj_id as Ptr) as NSSize64
		  #Endif
		  Break
		  dim mframe as NSRect = frame(sView)
		  dim offset as NSPoint = contentOffset(sView)
		  dim cSize as NSSize = contentSize(sView)
		  dim bottomEdge as Double = offset.y + mframe.rsize.h
		  if bottomEdge >= cSize.h then
		    RaiseEvent ScrollToBottom
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub impl_scrollViewDidScroll(pid as ptr, sel as ptr, view as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    ImprovediOSTable(w.Value).didScroll(view)
		  end if
		  
		  #Pragma Unused sel
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ScrollToBottom()
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
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
			Name="Format"
			Visible=true
			Group="Behavior"
			Type="iOSTable.Formats"
			EditorType="Enum"
			#tag EnumValues
				"0 - Plain"
				"1 - Grouped"
			#tag EndEnumValues
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
			Name="SectionCount"
			Group="Behavior"
			Type="Integer"
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
