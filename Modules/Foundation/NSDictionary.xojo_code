#tag Class
Class NSDictionary
Inherits NSObject
	#tag Method, Flags = &h0
		Function AllKeys() As NSArray
		  
		  declare function allKeys lib FoundationLib selector "allKeys" (id as Ptr) as Ptr
		  
		  return new NSArray(allKeys(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function AllKeys(anObject as NSObject) As NSArray
		  //# Returns a new array containing the keys corresponding to all occurrences of a given object in the dictionary.
		  
		  
		  declare function allKeysForObject lib FoundationLib selector "allKeysForObject:" (obj_id as Ptr, anObject as Ptr) as Ptr
		  
		  return new NSArray(allKeysForObject(self, anObject))
		  
		  #pragma unused anObject
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllValues() As NSArray
		  
		  declare function allValues lib FoundationLib selector "allValues" (id as Ptr) as Ptr
		  
		  return new NSArray(allValues(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSDictionary")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys as NSArray, values as NSArray)
		  //# Creates and returns a dictionary containing entries constructed from the contents of an array of keys and an array of values.
		  
		  
		  declare function dictionaryWithObjectsforKeys lib FoundationLib selector "dictionaryWithObjects:forKeys:" (cls as Ptr, nsa1 as Ptr, nsa2 as Ptr) as Ptr
		  
		  if keys is nil then
		    dim e as new NilObjectException
		    e.Reason = CurrentMethodName + ": keys cannot be nil."
		    raise e
		  end if
		  if keys is nil then
		    dim e as new NilObjectException
		    e.Reason = CurrentMethodName + ": keys cannot be nil."
		    raise e
		  end if
		  
		  Super.Constructor(dictionaryWithObjectsforKeys( NSClassFromString("NSDictionary"), values, keys))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary)
		  //#
		  
		  declare function initWithDictionary lib FoundationLib selector "initWithDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Ptr
		  
		  super.Constructor(initWithDictionary(Allocate(NSClassFromString("NSDictionary")), otherDictionary))
		  
		  #pragma unused otherDictionary
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys() as NSObject, objects() as NSObject)
		  //# Initializes a newly allocated dictionary with entries constructed from the contents of the objects and keys arrays.
		  
		  
		  declare function initWithObjects lib FoundationLib selector "initWithObjects:forKeys:" (obj_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		  
		  dim keysArray as new NSArray(keys)
		  dim objectsArray as new NSArray(objects)
		  
		  super.Constructor(initWithObjects(Allocate(NSClassFromString("NSDictionary")), objectsArray, keysArray))
		  
		  #pragma unused keys
		  #pragma unused objects
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(path as NSString)
		  //# Create a new NSDictionary from a file (like as .plist file)
		  
		  
		  declare function initWithContentsOfFile lib FoundationLib selector "initWithContentsOfFile:" (obj_id as Ptr, path as CFStringRef) as Ptr
		  
		  super.Constructor(initWithContentsOfFile(Allocate(NSClassFromString("NSDictionary")), path))
		  
		  #pragma unused path
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSDictionary
		  
		  declare function copy lib FoundationLib selector "copy" (id as Ptr) as Ptr
		  
		  return new NSDictionary(copy(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function Create() As NSDictionary
		  //# Creates and returns an empty dictionary.
		  
		  
		  declare function dictionary_ lib FoundationLib selector "dictionary" (class_id as Ptr) as Ptr
		  
		  dim dictRef as Ptr = dictionary_(ClassRef)
		  if dictRef <> nil then
		    return new NSDictionary(dictRef)
		  else
		    return nil
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateFromDictionary(otherDictionary as NSDictionary) As NSDictionary
		  //# Creates and returns a dictionary containing the keys and values from another given dictionary.
		  
		  
		  declare function dictionaryWithDictionary lib FoundationLib selector "dictionaryWithDictionary:" _
		  (class_id as Ptr, otherDictionary as Ptr) as Ptr
		  
		  if otherDictionary <> nil then
		    dim dictRef as Ptr = dictionaryWithDictionary(ClassRef, otherDictionary)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		  end if
		  
		  
		  #pragma unused otherDictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromFile(file as FolderItem) As NSDictionary
		  //# Create a new NSDictionary from a file (like as .plist file)
		  
		  
		  declare function dictionaryWithContentsOfFile lib FoundationLib selector "dictionaryWithContentsOfFile:" (cls as Ptr, path as CFStringRef) as Ptr
		  
		  if file <> nil then
		    dim p as Ptr = dictionaryWithContentsOfFile( NSClassFromString( "NSDictionary" ), file.Path )
		    
		    if p<>nil then
		      return   new NSDictionary( p )
		    end if
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateFromObject(key as Ptr, anObject as Ptr) As NSDictionary
		  //# Creates and returns a dictionary containing a given key and value.
		  
		  
		  declare function dictionaryWithObject lib FoundationLib selector "dictionaryWithObject:forKey:" _
		  (class_id as Ptr, anObject as Ptr, key as Ptr) as Ptr
		  
		  dim dictRef as Ptr = dictionaryWithObject(ClassRef, anObject, key)
		  if dictRef <> nil then
		    return new NSDictionary(dictRef)
		  end if
		  
		  
		  #pragma unused key
		  #pragma unused anObject
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateFromObjects(keys() as NSObject, objects() as NSObject) As NSDictionary
		  //# Creates and returns a dictionary containing entries constructed from the contents of an array of keys and an array of values.
		  
		  
		  declare function dictionaryWithObjects lib FoundationLib selector "dictionaryWithObjects:forKeys:" _
		  (class_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		  
		  dim keysArray as new NSArray(keys)
		  dim objectsArray as new NSArray(objects)
		  
		  dim dictRef as Ptr = dictionaryWithObjects(ClassRef, objectsArray, keysArray)
		  if dictRef <> nil then
		    return new NSDictionary(dictRef)
		  end if
		  
		  
		  #pragma unused keys
		  #pragma unused objects
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileCreationDate() As NSDate
		  //# Returns the value for the NSFileCreationDate key.
		  
		  
		  declare function fileCreationDate lib FoundationLib selector "fileCreationDate" (obj_id as Ptr) as Ptr
		  
		  dim dateRef as Ptr = fileCreationDate(self)
		  if dateRef <> nil then
		    return new NSDate(dateRef)
		  else
		    return nil
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileExtensionHidden() As Boolean
		  //# Returns the value for the NSFileExtensionHidden key.
		  
		  
		  declare function fileExtensionHidden lib FoundationLib selector "fileExtensionHidden" (obj_id as Ptr) as Boolean
		  
		  return fileExtensionHidden(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileGroupOwnerAccountName() As NSString
		  //# Returns the value for the NSFileGroupOwnerAccountName key.
		  
		  
		  declare function fileGroupOwnerAccountName lib FoundationLib selector "fileGroupOwnerAccountName" (obj_id as Ptr) as Ptr
		  
		  return new NSString(fileGroupOwnerAccountName(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileIsAppendOnly() As Boolean
		  //# Returns the value for the NSFileAppendOnly key.
		  
		  
		  declare function fileIsAppendOnly lib FoundationLib selector "fileIsAppendOnly" (obj_id as Ptr) as Boolean
		  
		  return fileIsAppendOnly(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileIsImmutable() As Boolean
		  //# Returns the value for the NSFileImmutable key.
		  
		  
		  declare function fileIsImmutable lib FoundationLib selector "fileIsImmutable" (obj_id as Ptr) as Boolean
		  
		  return fileIsImmutable(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileModificationDate() As NSDate
		  //# Returns the value for the key NSFileModificationDate.
		  
		  
		  declare function fileModificationDate lib FoundationLib selector "fileModificationDate" (obj_id as Ptr) as Ptr
		  
		  dim dateRef as Ptr = fileModificationDate(self)
		  if dateRef <> nil then
		    return new NSDate(dateRef)
		  else
		    return nil
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileOwnerAccountName() As NSString
		  //# Returns the value for the key NSFileOwnerAccountName.
		  
		  
		  declare function fileOwnerAccountName lib FoundationLib selector "fileOwnerAccountName" (obj_id as Ptr) as Ptr
		  
		  return new NSString(fileOwnerAccountName(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FilePosixPermissions() As UInt32
		  //# Returns the value for the key NSFilePosixPermissions.
		  
		  
		  declare function filePosixPermissions lib FoundationLib selector "filePosixPermissions" (obj_id as Ptr) as UInt32
		  
		  return filePosixPermissions(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSize() As UInt64
		  //# Returns the value for the key NSFileSize.
		  
		  
		  declare function fileSize lib FoundationLib selector "fileSize" (obj_id as Ptr) as UInt64
		  
		  return fileSize(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSystemFileNumber() As UInt32
		  //# Returns the value for the key NSFileSystemFileNumber.
		  
		  
		  declare function fileSystemFileNumber lib FoundationLib selector "fileSystemFileNumber" (obj_id as Ptr) as UInt32
		  
		  return fileSystemFileNumber(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSystemNumber() As Integer
		  //# Returns the value for the key NSFileSystemNumber.
		  
		  
		  declare function fileSystemNumber lib FoundationLib selector "fileSystemNumber" (obj_id as Ptr) as Integer
		  
		  return fileSystemNumber(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileType() As NSString
		  //# Returns the value for the key NSFileType.
		  
		  
		  declare function fileType lib FoundationLib selector "fileType" (obj_id as Ptr) as Ptr
		  
		  return new NSString(fileType(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(key as NSObject) As Boolean
		  
		  return   ( me.Value( key ) <> nil )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(otherDictionary as NSDictionary) As Boolean
		  //# Returns a Boolean value that indicates whether the contents of the receiving dictionary are equal to the contents of another given dictionary.
		  
		  
		  declare function isEqualToDictionary lib FoundationLib selector "isEqualToDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Boolean
		  
		  dim otherDictRef as Ptr
		  if otherDictionary <> nil then
		    otherDictRef = otherDictionary
		  else
		    otherDictRef = nil
		  end if
		  
		  return isEqualToDictionary(self, otherDictRef)
		  
		  #pragma unused otherDictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSStringValue(key as NSObject) As NSString
		  //# Get an NSString corresponding to a key
		  
		  
		  dim p as Ptr = self.Value(key)
		  if p <> nil then
		    return new NSString(p)
		  else
		    //key not found, I believe.
		    return nil
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as Ptr) As Ptr
		  //# Get a value corresponding to a key
		  
		  
		  declare function objectForKey lib FoundationLib selector "objectForKey:" (id as Ptr, key as Ptr) as Ptr
		  
		  return objectForKey(self, key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteToFile(file as FolderItem, atomically as Boolean = true) As Boolean
		  //# Write the NSDictionary to 'file'. Returns true on success
		  
		  
		  declare function writeToFile lib FoundationLib selector "writeToFile:atomically:" (id as Ptr, path as CFStringRef, atomically as Boolean) as Boolean
		  
		  return writeToFile(self, file.Path, atomically )
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  
			  declare function m_count lib FoundationLib selector "count" ( id as Ptr ) as UInt32
			  
			  return   m_count( me.id )
			  
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
