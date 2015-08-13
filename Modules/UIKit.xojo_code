#tag Module
Protected Module UIKit
	#tag Method, Flags = &h0
		Function BuildTargetClass(superClassName as Text, newClassName as Text, methods() as UIKit.TargetClassMethodHelper) As ptr
		  declare function objc_allocateClassPair  lib "/usr/lib/libobjc.A.dylib" (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		  declare sub        objc_registerClassPair  lib "/usr/lib/libobjc.A.dylib" (cls as Ptr)
		  declare function class_addMethod         lib "/usr/lib/libobjc.A.dylib" (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		  'declare function method_getTypeEncoding lib "/usr/lib/libobjc.A.dylib" (method as ptr) as CString
		  
		  using Xojo.Core
		  static cache as Dictionary
		  if cache = nil then cache = new Dictionary
		  
		  if cache.HasKey(newClassName) then Return cache.Value(newClassName)
		  
		  dim result as Ptr
		  result = objc_allocateClassPair(NSClassFromString(superClassName), newClassName.ToCString(Xojo.Core.TextEncoding.UTF8), 0)
		  
		  for i as Integer = 0 to methods.Ubound
		    if not class_addMethod(result,NSSelectorFromString(methods(i).selName), methods(i).impl, methods(i).charCode.ToCString(xojo.Core.TextEncoding.UTF8)) then Break
		  next
		  
		  objc_registerClassPair(result)
		  
		  cache.Value(newClassName) = result
		  Return result
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub UIAlertActionCompletionHandler(sender as UIAlertAction)
	#tag EndDelegateDeclaration


	#tag Constant, Name = UIKitLib, Type = Text, Dynamic = False, Default = \"UIKit.framework", Scope = Public
	#tag EndConstant


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
End Module
#tag EndModule
