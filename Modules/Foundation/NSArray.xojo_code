#tag Class
Class NSArray
Inherits NSObject
	#tag Method, Flags = &h1000
		Function ArrayByAddingObject(anObject as NSObject) As NSArray
		  //# Returns a new array that is a copy of the receiving array with a given object added to the end.
		  
		  
		  declare function arrayByAddingObject lib FoundationLib selector "arrayByAddingObject:" (obj_id as Ptr, anObject as Ptr) as Ptr
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  dim arrayRef as Ptr = arrayByAddingObject(self, anObjectRef)
		  
		  if arrayRef <> nil then
		    return new NSArray(arrayRef)
		  end if
		  
		  
		  #pragma unused anObject
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ArrayByAddingObjectsFromArray(otherArray as NSArray) As NSArray
		  //# Returns a new array that is a copy of the receiving array with the objects contained in another array added to the end.
		  
		  
		  declare function arrayByAddingObjectsFromArray lib FoundationLib selector "arrayByAddingObjectsFromArray:" (obj_id as Ptr, otherArray as Ptr) as Ptr
		  
		  dim otherArrayRef as Ptr
		  if otherArray <> nil then
		    otherArrayRef = otherArray
		  end if
		  
		  dim newArrayRef as Ptr = arrayByAddingObjectsFromArray(self, otherArrayRef)
		  
		  if newArrayRef <> nil then
		    return new NSArray(newArrayRef)
		  end if
		  
		  
		  #pragma unused otherArray
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSArray")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  //# Initializes a newly allocated array with the contents of the file specified by a given path.
		  
		  
		  declare function initWithContentsOfFile lib FoundationLib selector "initWithContentsOfFile:" (obj_id as Ptr, aPath as CFStringRef) as Ptr
		  
		  if file <> nil then
		    super.Constructor(initWithContentsOfFile(Allocate(NSClassFromString("NSArray")), file.Path))
		  else
		    dim n as NilObjectException
		    n.Reason = "NSArray.Constructor: FolderItem argument cannot be nil."
		    raise n
		  end if
		  
		  
		  #pragma unused file
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray)
		  //# Creates and returns an array containing the objects in another given array.
		  
		  
		  declare function initWithArray lib FoundationLib selector "initWithArray:" (obj_id as Ptr, anArray as Ptr) as Ptr
		  
		  dim anArrayRef as Ptr
		  if anArray <> nil then
		    anArrayRef = anArray
		    super.Constructor(initWithArray(Allocate(NSClassFromString("NSArray")), anArrayRef))
		  else
		    dim n as NilObjectException
		    n.Reason = "NSArray.Constructor: NSArray argument cannot be nil."
		    raise n
		  end if
		  
		  
		  
		  #pragma unused anArray
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray, copyItems as Boolean)
		  //# Initializes a newly allocated set with the objects that are contained in a given array, optionally copying the items.
		  
		  
		  declare function initWithArray lib FoundationLib selector "initWithArray:copyItems:" (obj_id as Ptr, anArray as Ptr, flag as Boolean) as Ptr
		  
		  dim anArrayRef as Ptr
		  if anArray <> nil then
		    anArrayRef = anArray
		    super.Constructor(initWithArray(Allocate(NSClassFromString("NSArray")), anArrayRef, copyItems))
		  else
		    dim n as NilObjectException
		    n.Reason = "NSArray.Constructor: NSArray argument cannot be nil."
		    raise n
		  end if
		  
		  
		  
		  #pragma unused anArray
		  #pragma unused copyItems
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(objects() as NSObject)
		  //# Initializes a newly allocated set with a specified number of objects from a given C array of objects.
		  
		  
		  declare function initWithObjects lib FoundationLib selector "initWithObjects:count:" (obj_id as Ptr, objects as Ptr, count as UInt32) as Ptr
		  
		  #if RBVersion > 2013.01
		    #if Target64Bit
		      #pragma warning "MACOSLIB: This method is not 64 bit-savvy"
		    #Endif
		  #Endif
		  
		  
		  dim uboundObject as UInt32 = objects.ubound
		  dim objectCount as UInt32 = uboundObject+1
		  if uboundObject > -1 then
		    
		    dim m as new SmartMutableMemoryBlock(SizeOfPointer*(objectCount))
		    for i as integer = 0 to uboundObject
		      m.UIntegerValue(i*SizeOfPointer) = objects(i).id
		    next
		    
		    super.Constructor(initWithObjects(Allocate(NSClassFromString("NSArray")), m.Data, objectCount))
		  else
		    dim n as NilObjectException
		    n.Reason = "NSArray.Constructor: NSObject argument cannot be nil."
		    raise n
		  end if
		  
		  
		  #pragma unused objects
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ContainsObject(anObject as NSObject) As Boolean
		  //# Returns a Boolean value that indicates whether a given object is present in the array.
		  
		  
		  declare function containsObject_ lib FoundationLib selector "containsObject:" (obj_id as Ptr, anObjects as Ptr) as Boolean
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		    return containsObject_(self, anObjectRef)
		  else
		    dim n as NilObjectException
		    n.Reason = "NSArray.ContainsObject: NSObject argument cannot be nil."
		    raise n
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSArray
		  //# Returns the NSArray.
		  
		  
		  declare function m_copy lib FoundationLib selector "copy" (id as Ptr) as Ptr
		  
		  return   new NSArray( m_copy( me.id ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function Create() As NSArray
		  
		  
		  declare function array_ lib FoundationLib selector "array" (class_id as Ptr) as Ptr
		  
		  dim arrayRef as Ptr = array_(ClassRef)
		  if arrayRef <> nil then
		    return new NSArray(arrayRef)
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithArray(anArray as NSArray) As NSArray
		  //# Creates and returns an array containing the objects in another given array.
		  
		  
		  declare function arrayWithArray lib FoundationLib selector "arrayWithArray:" (class_id as Ptr, anArray as Ptr) as Ptr
		  
		  dim anArrayRef as Ptr
		  if anArray <> nil then
		    anArrayRef = anArray
		  end if
		  
		  dim arrayRef as Ptr = arrayWithArray(ClassRef, anArrayRef)
		  
		  if arrayRef <> nil then
		    return new NSArray(arrayRef)
		  end if
		  
		  
		  #pragma unused anArray
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithFile(file as FolderItem) As NSArray
		  //# Creates and returns an array containing the contents of the file specified by a given path.
		  
		  
		  declare function arrayWithContentsOfFile lib FoundationLib selector "arrayWithContentsOfFile:" (class_id as Ptr, aPath as CFStringRef) as Ptr
		  
		  if file <> nil then
		    dim arrayRef as Ptr = arrayWithContentsOfFile(ClassRef, file.Path)
		    
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		  end if
		  
		  
		  #pragma unused file
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithObject(anObject as NSObject) As NSArray
		  //# Creates and returns an array containing a given object.
		  
		  
		  declare function arrayWithObject lib FoundationLib selector "arrayWithObject:" (class_id as Ptr, anObject as Ptr) as Ptr
		  
		  if anObject <> nil then
		    dim arrayRef as Ptr = arrayWithObject(ClassRef, anObject)
		    
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		  end if
		  
		  
		  #pragma unused anObject
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithObjects(objects() as NSObject) As NSArray
		  //# Creates and returns an array containing the objects in the argument list.
		  
		  
		  declare function arrayWithObjects lib FoundationLib selector "arrayWithObjects:count:" (class_id as Ptr, objects as Ptr, count as UInt32) as Ptr
		  
		  #if RBVersion > 2013.01
		    #if Target64Bit
		      #pragma warning "MACOSLIB: This method is not 64 bit-savvy"
		    #Endif
		  #Endif
		  
		  
		  dim uboundObject as UInt32 = objects.ubound
		  dim objectCount as UInt32 = uboundObject+1
		  if uboundObject > -1 then
		    
		    dim m as new SmartMutableMemoryBlock(SizeOfPointer*(objectCount))
		    for i as integer = 0 to uboundObject
		      m.UIntegerValue(i*SizeOfPointer) = objects(i).id
		    next
		    
		    dim arrayRef as Ptr = arrayWithObjects(ClassRef, m.Data, objectCount)
		    
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		  end if
		  
		  
		  #pragma unused objects
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IndexOf(anObject as NSObject) As UInt32
		  //# Returns the index of the specified object.
		  
		  
		  declare function indexOfObject lib FoundationLib selector "indexOfObject:" (obj_id as Ptr, anObject as Ptr) as UInt32
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  return indexOfObject(self, anObjectRef)
		  
		  #pragma unused anObject
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IndexOf(anObject as NSObject, range as NSRange) As UInt32
		  //# Returns the lowest index within a specified range whose corresponding array value is equal to a given object .
		  
		  
		  declare function indexOfObject lib FoundationLib selector "indexOfObject:inRange:" (obj_id as Ptr, anObject as Ptr, range as NSRange) as UInt32
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  return indexOfObject(self, anObjectRef, range)
		  
		  #pragma unused anObject
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IndexOfObjectIdentical(anObject as NSObject) As UInt32
		  //# Returns the lowest index whose corresponding array value is identical to a given object.
		  
		  
		  declare function indexOfObjectIdenticalTo lib FoundationLib selector "indexOfObjectIdenticalTo:" (obj_id as Ptr, anObject as Ptr) as UInt32
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  return indexOfObjectIdenticalTo(self, anObjectRef)
		  
		  #pragma unused anObject
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IndexOfObjectIdentical(anObject as NSObject, range as NSRange) As UInt32
		  //# Returns the lowest index within a specified range whose corresponding array value is equal to a given object .
		  
		  
		  declare function indexOfObjectIdenticalTo lib FoundationLib selector "indexOfObjectIdenticalTo:inRange:" (obj_id as Ptr, anObject as Ptr, range as NSRange) as UInt32
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  return indexOfObjectIdenticalTo(self, anObjectRef, range)
		  
		  #pragma unused anObject
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(otherArray as NSArray) As Boolean
		  //# Compares the receiving array to another array.
		  
		  
		  declare function isEqualToArray lib FoundationLib selector "isEqualToArray:" (obj_id as Ptr, otherArray as Ptr) as Boolean
		  
		  dim arrayRef as Ptr
		  if otherArray <> nil then
		    arrayRef = otherArray
		  end if
		  
		  return isEqualToArray(self, arrayRef)
		  
		  #pragma unused otherArray
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Join(separator as Text) As Text
		  //# Constructs and returns an NSString object that is the result of interposing a given separator between the elements of the array.
		  
		  
		  declare function componentsJoinedByString lib FoundationLib selector "componentsJoinedByString:" (obj_id as Ptr, separator as CFStringRef) as CFStringRef
		  
		  return componentsJoinedByString(self, separator)
		  
		  #pragma unused separator
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function LastValue() As Ptr
		  //# Returns the object in the array with the highest index value.
		  
		  
		  declare function lastObject lib FoundationLib selector "lastObject" (obj_id as Ptr) as Ptr
		  
		  return lastObject(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As NSObject()
		  
		  return self.Values(NSMakeRange(0, self.Count))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Text()
		  
		  dim retArray() as Text
		  
		  #if RBVersion > 2013.01
		    #if Target64Bit
		      #pragma warning "MACOSLIB: This method is not 64 bit-savvy"
		    #Endif
		  #Endif
		  
		  
		  dim arrayRange as NSRange = NSMakeRange(0, self.Count)
		  dim m as SmartMemoryBlock = SmartMemoryBlock(self.ValuesArray(arrayRange))
		  dim n as UInt32 = arrayRange.length-1
		  for i as integer = 0 to n
		    retArray.append new NSString(Ptr(m.UIntegerValue(i*SizeOfPointer)))
		  next
		  
		  return retArray
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(objects() as NSObject)
		  
		  self.Constructor(objects)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Subarray(aRange as NSRange) As NSArray
		  //# Returns a new array containing the receiving array’s elements that fall within the limits specified by a given range.
		  
		  
		  declare function subarrayWithRange lib FoundationLib selector "subarrayWithRange:" (obj_id as Ptr, aRange as NSRange) as Ptr
		  
		  dim newArrayRef as Ptr = subarrayWithRange(self, aRange)
		  
		  if newArrayRef <> nil then
		    return new NSArray(newArrayRef)
		  end if
		  
		  
		  #pragma unused aRange
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(index as Integer) As Ptr
		  //# Returns the object located at index.
		  
		  
		  declare function objectAtIndex lib FoundationLib selector "objectAtIndex:" (theArray as Ptr, idx as Integer) as Ptr
		  
		  if self <> nil then
		    if index < 0 or index >= me.Count then
		      raise new OutOfBoundsException
		    end if
		    
		    dim p as Ptr = objectAtIndex(me.id, index)
		    
		    return   p
		  else
		    return nil
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Values(aRange as NSRange) As NSObject()
		  #if RBVersion > 2013.01
		    #if Target64Bit
		      #pragma warning "MACOSLIB: This method is not 64 bit-savvy"
		    #Endif
		  #Endif
		  
		  
		  dim rb_array() as NSObject
		  
		  dim m as SmartMemoryBlock = SmartMemoryBlock(self.ValuesArray(aRange))
		  
		  dim n as UInt32 = aRange.length-1
		  for i as integer = 0 to n
		    rb_array.append new NSObject(Ptr(m.UIntegerValue(i*SizeOfPointer)))
		  next
		  
		  return rb_array
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ValuesArray(aRange as NSRange) As MemoryBlock
		  //# Copies the objects contained in the array that fall within the specified range to aBuffer.
		  
		  
		  declare sub getObjects lib FoundationLib selector "getObjects:range:" (obj_id as Ptr, aBuffer as Ptr, aRange as NSRange)
		  
		  #if RBVersion > 2013.01
		    #if Target64Bit
		      #pragma warning "MACOSLIB: This method is not 64 bit-savvy"
		    #Endif
		  #Endif
		  
		  
		  dim m as new MutableMemoryBlock(SizeOfPointer*aRange.length)
		  
		  getObjects self, m.Data, aRange
		  
		  return m
		  
		  #pragma unused aRange
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Write(file as FolderItem, atomically as Boolean) As Boolean
		  //# Writes the contents of the array to a file at a given path.
		  
		  
		  declare function writeToFile lib FoundationLib selector "writeToFile:atomically:" (obj_id as Ptr, path as CFStringRef, flag as Boolean) as Boolean
		  
		  if file <> nil then
		    return writeToFile(self, file.Path, atomically)
		  else
		    return false
		  end if
		  
		  
		  #pragma unused file
		  #pragma unused atomically
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the number of objects currently in the array.
			  
			  #if Target32Bit
			    declare function m_count lib FoundationLib selector "count" ( obj as Ptr ) as UInt32
			  #Else
			    declare function m_count lib FoundationLib selector "count" ( obj as Ptr ) as UInt64
			  #Endif
			  
			  dim cnt as integer = m_count( me.id )
			  
			  return  cnt
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
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
