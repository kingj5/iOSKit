#tag Module
Protected Module Foundation
	#tag Method, Flags = &h0
		Function DoubleConstant(frameworkName as Text, constName as Text) As Double
		  dim constPtr as Ptr = LoadConstant(frameworkName, constName)
		  if constPtr <> nil then
		    Return constPtr.Double(0)
		  end if
		  Raise new InvalidArgumentException
		  Return -1.0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerConstant(frameworkName as Text, constName as Text) As Integer
		  dim constPtr as Ptr = LoadConstant(frameworkName, constName)
		  if constPtr <> nil then
		    Return constPtr.Integer(0)
		  end if
		  raise new InvalidArgumentException
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadConstant(frameworkName as Text, constName as Text) As Ptr
		  Declare Function dlsym Lib "/usr/lib/libSystem.dylib" ( handle As Ptr, name As CString ) As ptr
		  dim libPtr as Ptr = LoadFramework(frameworkName)
		  
		  dim constPtr as Ptr = dlsym(libPtr, constName.ToCString(xojo.core.TextEncoding.UTF8))
		  Return constPtr
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadFramework(frameworkName as Text) As Ptr
		  static frameworkHandlesDict as xojo.Core.Dictionary = new xojo.Core.Dictionary
		  
		  if frameworkHandlesDict.HasKey(frameworkName) then Return frameworkHandlesDict.Value(frameworkName)
		  
		  Declare Function dlopen Lib "/usr/lib/libSystem.dylib" ( path As CString, mode As Int32 ) As Ptr
		  Declare Function dlerror Lib "/usr/lib/libSystem.dylib" () As CString
		  
		  Const RTLD_LAZY = 1
		  Const RTLD_GLOBAL = 8
		  
		  dim path as Text =  "/System/Library/Frameworks/" + frameworkName + ".framework/" + frameworkName
		  Dim result As ptr = dlopen(path.ToCString(xojo.core.TextEncoding.UTF8), RTLD_LAZY Or RTLD_GLOBAL )
		  
		  If result = Nil Then
		    Dim reason As Text = Text.FromCString(dlerror(), Xojo.Core.TextEncoding.UTF8)
		    Dim exc As New Xojo.Core.InvalidArgumentException
		    exc.Reason = reason
		    Raise exc
		    Return nil
		  end if
		  
		  frameworkHandlesDict.Value(frameworkName) = result
		  Return result
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSClassFromString Lib FoundationLib (clsName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function NSMakeRange(location as integer, length as Integer) As NSRange
		  dim result as NSRange
		  result.location = location
		  result.length = length
		  
		  Return result
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSSelectorFromString Lib FoundationLib (selName as CFStringRef) As ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SizeOfPointer() As integer
		  //# Returns the size of a Ptr (the same code as SizeOfInteger)
		  
		  #if RBVersion >= 2013
		    #if Target64Bit
		      return  8
		    #else
		      return  4
		    #endif
		    
		  #else
		    return  4
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringConstant(frameworkName as Text, constName as Text) As Text
		  dim constPtr as Ptr = LoadConstant(frameworkName, constName)
		  if constPtr <> nil then
		    Return constPtr.CFStringRef(0)
		  end if
		  Return ""
		End Function
	#tag EndMethod


	#tag Constant, Name = FoundationLib, Type = Text, Dynamic = False, Default = \"Foundation.Framework", Scope = Public
	#tag EndConstant


	#tag Structure, Name = NSPoint32, Flags = &h0
		x as single
		y as single
	#tag EndStructure

	#tag Structure, Name = NSPoint64, Flags = &h0
		x as double
		y as double
	#tag EndStructure

	#tag Structure, Name = NSRange, Flags = &h0
		location as uinteger
		length as uinteger
	#tag EndStructure

	#tag Structure, Name = NSRect32, Flags = &h0
		origin as NSPoint32
		rsize as NSSize32
	#tag EndStructure

	#tag Structure, Name = NSRect64, Flags = &h0
		origin as NSPoint64
		rsize as NSSize64
	#tag EndStructure

	#tag Structure, Name = NSSize32, Flags = &h0
		w as single
		h as single
	#tag EndStructure

	#tag Structure, Name = NSSize64, Flags = &h0
		w as double
		h as double
	#tag EndStructure


	#tag Enum, Name = NSComparisonResult, Flags = &h0
		NSOrderedAscending = -1
		  NSOrderedSame = 0
		NSOrderedDescending = 1
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
