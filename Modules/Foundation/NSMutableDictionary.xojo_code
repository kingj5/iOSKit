#tag Class
Class NSMutableDictionary
Inherits NSDictionary
	#tag Method, Flags = &h0
		Sub AddEntries(d as NSDictionary)
		  
		  
		  declare sub addEntriesFromDictionary lib FoundationLib selector "addEntriesFromDictionary:" ( id as Ptr, value as Ptr )
		  
		  if d is nil then
		    dim e as new NilObjectException
		    e.Reason = CurrentMethodName + ": d cannot be nil."
		    raise e
		  end if
		  
		  addEntriesFromDictionary(self, d)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSMutableDictionary")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  //# Delete all the values stored in the dictionary
		  
		  
		  declare sub removeAllObjects lib FoundationLib selector "removeAllObjects" (id as Ptr)
		  
		  removeAllObjects(self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(keys as NSArray, values as NSArray) -- From NSDictionary
		  // Constructor(otherDictionary as NSDictionary) -- From NSDictionary
		  // Constructor(keys() as NSObject, objects() as NSObject) -- From NSDictionary
		  // Constructor(path as NSString) -- From NSDictionary
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(ClassRef)))
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  
		  declare function initWithContentsOfFile lib FoundationLib selector "initWithContentsOfFile:" ( cls as Ptr, path as CFStringRef ) as Ptr
		  
		  Super.Constructor(initWithContentsOfFile(Allocate(NSClassFromString("NSMutableDictionary")), file.Path))
		  
		  #pragma Unused file
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(capacity as Integer)
		  
		  declare function dictionaryWithCapacity lib FoundationLib selector "dictionaryWithCapacity:" ( cls as Ptr, capacity as UInt32 ) as Ptr
		  
		  Super.Constructor(dictionaryWithCapacity(NSClassFromString( "NSMutableDictionary" ), capacity))
		  
		  #pragma Unused capacity
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary)
		  
		  
		  declare function initWithDictionary lib FoundationLib selector "initWithDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Ptr
		  
		  super.Constructor(initWithDictionary(Allocate(NSClassFromString("NSMutableDictionary")), otherDictionary))
		  
		  #pragma unused otherDictionary
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary, copyItems as Boolean)
		  
		  
		  declare function initWithDictionary lib FoundationLib selector "initWithDictionary:copyItems:" (obj_id as Ptr, otherDictionary as Ptr, flag as Boolean) as Ptr
		  
		  super.Constructor(initWithDictionary(Allocate(NSClassFromString("NSMutableDictionary")), otherDictionary, copyItems))
		  
		  #pragma unused otherDictionary
		  #pragma unused copyItems
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys() as NSObject, objects() as NSObject)
		  
		  
		  declare function initWithObjects lib FoundationLib selector "initWithObjects:forKeys:" (obj_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		  
		  dim keysArray as new NSArray(keys)
		  dim objectsArray as new NSArray(objects)
		  
		  super.Constructor(initWithObjects(Allocate(NSClassFromString("NSMutableDictionary")), objectsArray, keysArray))
		  
		  #pragma unused keys
		  #pragma unused objects
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function Create() As NSMutableDictionary
		  //# Creates and returns an empty dictionary.
		  
		  
		  declare function createDictionary lib FoundationLib selector "dictionary" (class_id as Ptr) as Ptr
		  
		  dim dictRef as Ptr = createDictionary(ClassRef)
		  if dictRef <> nil then
		    return new NSMutableDictionary(dictRef)
		  else
		    return nil
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithCapacity(numItems as Integer) As NSMutableDictionary
		  
		  
		  declare function dictionaryWithCapacity lib FoundationLib selector "dictionaryWithCapacity:" (class_id as Ptr, numItems as UInt32) as Ptr
		  
		  dim dictRef as Ptr = dictionaryWithCapacity(ClassRef, numItems)
		  if dictRef <> nil then
		    return new NSMutableDictionary(dictRef)
		  else
		    return nil
		  end if
		  
		  
		  #pragma unused numItems
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithDictionary(otherDictionary as NSDictionary) As NSMutableDictionary
		  
		  
		  declare function dictionaryWithDictionary lib FoundationLib selector "dictionaryWithDictionary:" _
		  (class_id as Ptr, otherDictionary as Ptr) as Ptr
		  
		  if otherDictionary <> nil then
		    dim dictRef as Ptr = dictionaryWithDictionary(ClassRef, otherDictionary)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    end if
		  end if
		  
		  
		  #pragma unused otherDictionary
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithFile(file as FolderItem) As NSMutableDictionary
		  
		  
		  declare function dictionaryWithContentsOfFile lib FoundationLib selector "dictionaryWithContentsOfFile:" _
		  (class_id as Ptr, path as CFStringRef) as Ptr
		  
		  if file <> nil then
		    dim dictRef as Ptr = dictionaryWithContentsOfFile(ClassRef, file.Path)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    end if
		  end if
		  
		  
		  #pragma unused file
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithObject(key as Ptr, anObject as Ptr) As NSMutableDictionary
		  
		  
		  declare function dictionaryWithObject lib FoundationLib selector "dictionaryWithObject:forKey:" _
		  (class_id as Ptr, anObject as Ptr, key as Ptr) as Ptr
		  
		  dim dictRef as Ptr = dictionaryWithObject(ClassRef, anObject, key)
		  if dictRef <> nil then
		    return new NSMutableDictionary(dictRef)
		  end if
		  
		  
		  #pragma unused key
		  #pragma unused anObject
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithObjects(keys() as NSObject, objects() as NSObject) As NSMutableDictionary
		  
		  
		  declare function dictionaryWithObjects lib FoundationLib selector "dictionaryWithObjects:forKeys:" _
		  (class_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		  
		  dim keysArray as new NSArray(keys)
		  dim objectsArray as new NSArray(objects)
		  
		  dim dictRef as Ptr = dictionaryWithObjects(ClassRef, objectsArray, keysArray)
		  if dictRef <> nil then
		    return new NSMutableDictionary(dictRef)
		  end if
		  
		  
		  #pragma unused keys
		  #pragma unused objects
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(otherDictionary as NSDictionary) As NSDictionary
		  
		  self.AddEntries otherDictionary
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(keys as NSArray)
		  
		  
		  declare sub removeObjectsForKeys lib FoundationLib selector "removeObjectsForKeys:" (obj_id as Ptr, keys as Ptr)
		  
		  if keys <> nil then
		    removeObjectsForKeys self, keys
		  else
		    //no-op?
		  end if
		  
		  
		  #pragma unused keys
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(key as Ptr)
		  
		  declare sub removeObjectForKey lib FoundationLib selector "removeObjectForKey:" (obj_id as Ptr, key as Ptr)
		  
		  removeObjectForKey self, key
		  
		  
		  #pragma unused key
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveAll()
		  
		  
		  declare sub removeAllObjects lib FoundationLib selector "removeAllObjects" (obj_id as Ptr)
		  
		  removeAllObjects self
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(otherDictionary as NSDictionary)
		  
		  
		  declare sub setDictionary lib FoundationLib selector "setDictionary:" (obj_id as Ptr, otherDictionary as Ptr)
		  
		  if otherDictionary <> nil then
		    setDictionary self, otherDictionary
		  else
		    //was this intended to be a no-op?
		  end if
		  
		  
		  #pragma unused otherDictionary
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as Ptr, assigns newValue as Ptr)
		  
		  
		  declare sub setObject lib FoundationLib selector "setObject:forKey:" ( id as Ptr, key as Ptr, value as Ptr )
		  
		  setObject(self, newValue, key)
		  
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
