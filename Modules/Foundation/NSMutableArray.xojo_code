#tag Class
Class NSMutableArray
Inherits NSArray
	#tag Method, Flags = &h1000
		Sub Append(otherArray as NSArray)
		  
		  
		  declare sub addObjectsFromArray lib FoundationLib selector "addObjectsFromArray:" (obj_id as Ptr, otherArray as Ptr)
		  
		  dim arrayRef as Ptr
		  if otherArray <> nil then
		    arrayRef = otherArray
		  end if
		  addObjectsFromArray self, arrayRef
		  
		  
		  #pragma unused otherArray
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Append(anObject as NSObject)
		  
		  
		  declare sub addObject lib FoundationLib selector "addObject:" ( id as Ptr, newItem as Ptr )
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  addObject self, anObjectRef
		  
		  
		  #pragma unused anObject
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSMutableArray")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize( Allocate( NSClassFromString("NSMutableArray") )) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  
		  
		  declare function initWithContentsOfFile lib FoundationLib selector "initWithContentsOfFile:" (obj_id as Ptr, aPath as CFStringRef) as Ptr
		  
		  if file <> nil then
		    super.Constructor(initWithContentsOfFile(Allocate(NSClassFromString("NSMutableArray")), file.Path))
		  end if
		  
		  
		  #pragma unused file
		  
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray)
		  
		  
		  declare function initWithArray lib FoundationLib selector "initWithArray:" (obj_id as Ptr, anArray as Ptr) as Ptr
		  
		  dim anArrayRef as Ptr
		  if anArray <> nil then
		    anArrayRef = anArray
		  end if
		  
		  super.Constructor(initWithArray(Allocate(NSClassFromString("NSMutableArray")), anArrayRef))
		  
		  
		  #pragma unused anArray
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as NSArray, copyItems as Boolean)
		  
		  
		  declare function initWithArray lib FoundationLib selector "initWithArray:copyItems:" (obj_id as Ptr, anArray as Ptr, flag as Boolean) as Ptr
		  
		  dim anArrayRef as Ptr
		  if anArray <> nil then
		    anArrayRef = anArray
		  end if
		  
		  super.Constructor(initWithArray(Allocate(NSClassFromString("NSMutableArray")), anArrayRef, copyItems))
		  
		  
		  #pragma unused anArray
		  #pragma unused copyItems
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(objects() as NSObject)
		  
		  
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
		    
		    super.Constructor(initWithObjects(Allocate(NSClassFromString("NSMutableArray")), m.Data, objectCount))
		  end if
		  
		  
		  #pragma unused objects
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(strings() as Text)
		  
		  dim nsstr() as NSObject
		  for each str as Text in strings
		    nsstr.Append new NSString(str)
		  next
		  
		  self.Constructor(nsstr)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(capacity as UInt32)
		  
		  
		  declare function initWithCapacity lib FoundationLib selector "initWithCapacity:" (obj_id as Ptr, capacity as UInt32) as Ptr
		  
		  super.Constructor(initWithCapacity(Allocate(NSClassFromString("NSMutableArray")), capacity))
		  
		  
		  #pragma unused capacity
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function Create() As NSMutableArray
		  
		  
		  declare function array_ lib FoundationLib selector "array" (class_id as Ptr) as Ptr
		  
		  dim arrayRef as Ptr = array_(ClassRef)
		  if arrayRef <> nil then
		    return new NSMutableArray(arrayRef)
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithArray(anArray as NSArray) As NSMutableArray
		  
		  
		  declare function arrayWithArray lib FoundationLib selector "arrayWithArray:" (class_id as Ptr, anArray as Ptr) as Ptr
		  
		  dim anArrayRef as Ptr
		  if anArray <> nil then
		    anArrayRef = anArray
		  end if
		  
		  dim arrayRef as Ptr = arrayWithArray(ClassRef, anArrayRef)
		  
		  if arrayRef <> nil then
		    return new NSMutableArray(arrayRef)
		  end if
		  
		  
		  #pragma unused anArray
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithCapacity(capacity as UInt32) As NSMutableArray
		  
		  
		  declare function arrayWithCapacity lib FoundationLib selector "arrayWithCapacity:" (class_id as Ptr, capacity as UInt32) as Ptr
		  
		  dim arrayRef as Ptr = arrayWithCapacity(ClassRef, capacity)
		  if arrayRef <> nil then
		    return new NSMutableArray(arrayRef)
		  else
		    return nil
		  end if
		  
		  
		  #pragma unused capacity
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithFile(file as FolderItem) As NSMutableArray
		  
		  
		  declare function arrayWithContentsOfFile lib FoundationLib selector "arrayWithContentsOfFile:" (class_id as Ptr, aPath as CFStringRef) as Ptr
		  
		  if file <> nil then
		    dim arrayRef as Ptr = arrayWithContentsOfFile(ClassRef, file.Path)
		    
		    if arrayRef <> nil then
		      return new NSMutableArray(arrayRef)
		    end if
		  end if
		  
		  
		  #pragma unused file
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithObject(anObject as NSObject) As NSMutableArray
		  
		  
		  declare function arrayWithObject lib FoundationLib selector "arrayWithObject:" (class_id as Ptr, anObject as Ptr) as Ptr
		  
		  if anObject <> nil then
		    dim arrayRef as Ptr = arrayWithObject(ClassRef, anObject)
		    
		    if arrayRef <> nil then
		      return new NSMutableArray(arrayRef)
		    end if
		  end if
		  
		  
		  #pragma unused anObject
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithObjects(objects() as NSObject) As NSMutableArray
		  
		  
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
		      return new NSMutableArray(arrayRef)
		    end if
		  end if
		  
		  
		  #pragma unused objects
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Insert(anObject as NSObject, index as UInt32)
		  
		  
		  declare sub insertObject lib FoundationLib selector "insertObject:atIndex:" (obj_id as Ptr, anObject as Ptr, index as UInt32)
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  insertObject self, anObjectRef, index
		  
		  
		  #pragma unused anObject
		  #pragma unused index
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(objects() as NSObject)
		  
		  self.Constructor(objects)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(otherArray as NSArray)
		  
		  
		  declare sub removeObjectsInArray lib FoundationLib selector "removeObjectsInArray:" (obj_id as Ptr, otherArray as Ptr)
		  
		  dim arrayRef as Ptr
		  if otherArray <> nil then
		    arrayRef = otherArray
		  end if
		  
		  removeObjectsInArray self, arrayRef
		  
		  
		  #pragma unused otherArray
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(anObject as NSObject)
		  
		  
		  declare sub removeObject lib FoundationLib selector "removeObject:" (obj_id as Ptr, anObject as Ptr)
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  removeObject self, anObjectRef
		  
		  
		  #pragma unused anObject
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(anObject as NSObject, range as NSRange)
		  
		  
		  declare sub removeObject lib FoundationLib selector "removeObject:inRange:" (obj_id as Ptr, anObject as Ptr, range as NSRange)
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  removeObject self, anObjectRef, range
		  
		  
		  #pragma unused anObject
		  #pragma unused range
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(range as NSRange)
		  
		  
		  declare sub removeObjectsInRange lib FoundationLib selector "removeObjectsInRange:" (obj_id as Ptr, range as NSRange)
		  
		  removeObjectsInRange self, range
		  
		  
		  #pragma unused range
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(index as UInt32)
		  
		  
		  declare sub removeObjectAtIndex lib FoundationLib selector "removeObjectAtIndex:" (obj_id as Ptr, index as UInt32)
		  
		  removeObjectAtIndex self, index
		  
		  
		  #pragma unused index
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveAll()
		  
		  
		  declare sub removeAllObjects lib FoundationLib selector "removeAllObjects" (obj_id as Ptr)
		  
		  removeAllObjects self
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveIdentical(anObject as NSObject)
		  
		  
		  declare sub removeObjectIdenticalTo lib FoundationLib selector "removeObjectIdenticalTo:" (obj_id as Ptr, anObject as Ptr)
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  removeObjectIdenticalTo self, anObjectRef
		  
		  
		  #pragma unused anObject
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveIdentical(anObject as NSObject, range as NSRange)
		  
		  
		  declare sub removeObjectIdenticalTo lib FoundationLib selector "removeObjectIdenticalTo:inRange:" (obj_id as Ptr, anObject as Ptr, range as NSRange)
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  removeObjectIdenticalTo self, anObjectRef, range
		  
		  
		  #pragma unused anObject
		  #pragma unused range
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveLast()
		  
		  
		  declare sub removeLastObject lib FoundationLib selector "removeLastObject" (obj_id as Ptr)
		  
		  removeLastObject self
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(otherArray as NSArray)
		  
		  
		  declare sub setArray lib FoundationLib selector "setArray:" (obj_id as Ptr, otherArray as Ptr)
		  
		  dim otherArrayRef as Ptr
		  if otherArray <> nil then
		    otherArrayRef = otherArray
		  end if
		  
		  setArray self, otherArrayRef
		  
		  
		  #pragma unused otherArray
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(range as NSRange, objects as NSArray)
		  
		  
		  declare sub replaceObjectsInRange lib FoundationLib selector "replaceObjectsInRange:withObjectsFromArray:" _
		  (obj_id as Ptr, range as NSRange, objects as Ptr)
		  
		  dim objectsRef as Ptr
		  if objects <> nil then
		    objectsRef = objects
		  end if
		  
		  replaceObjectsInRange self, range, objectsRef
		  
		  
		  #pragma unused range
		  #pragma unused objects
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(range as NSRange, objects as NSArray, otherRange as NSRange)
		  
		  
		  declare sub replaceObjectsInRange lib FoundationLib selector "replaceObjectsInRange:withObjectsFromArray:range:" _
		  (obj_id as Ptr, range as NSRange, objects as Ptr, otherRange as NSRange)
		  
		  dim objectsRef as Ptr
		  if objects <> nil then
		    objectsRef = objects
		  end if
		  
		  replaceObjectsInRange self, range, objectsRef, otherRange
		  
		  
		  #pragma unused range
		  #pragma unused objects
		  #pragma unused otherRange
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(index as UInt32, anObject as NSObject)
		  
		  
		  declare sub replaceObjectAtIndex lib FoundationLib selector "replaceObjectAtIndex:withObject:" (obj_id as Ptr, index as UInt32, anObject as Ptr)
		  
		  dim anObjectRef as Ptr
		  if anObject <> nil then
		    anObjectRef = anObject
		  end if
		  
		  replaceObjectAtIndex self, index, anObjectRef
		  
		  
		  #pragma unused index
		  #pragma unused anObject
		  
		  
		End Sub
	#tag EndMethod


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
