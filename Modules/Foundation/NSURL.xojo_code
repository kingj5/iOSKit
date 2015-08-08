#tag Class
Class NSURL
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function BookmarkDataWithContentsOfURL(bookmarkFileURL as NSURL, error as NSError) As NSData
		  declare function bookmarkDataWithContentsOfURL_ lib FoundationLib selector "bookmarkDataWithContentsOfURL:error:" (clsRef as ptr, bookmarkFileURL as ptr, error as ptr) as ptr
		  Return new NSData(bookmarkDataWithContentsOfURL_(ClassRef, bookmarkFileURL, error))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BookmarkDataWithOptions(options as Integer, keys as NSArray, relativeURL as NSURL, error as NSError) As NSData
		  declare function bookmarkDataWithOptions_ lib FoundationLib selector "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:" (obj_id as ptr, options as integer, keys as ptr, relativeURL as ptr, error as ptr) as ptr
		  Return new NSData(bookmarkDataWithOptions_(self, options, keys, relativeURL, error))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckPromisedItemIsReachableAndReturnError(error as NSError) As Boolean
		  declare function checkPromisedItemIsReachableAndReturnError_ lib FoundationLib selector "checkPromisedItemIsReachableAndReturnError:" (obj_id as ptr, error as ptr) as Boolean
		  Return checkPromisedItemIsReachableAndReturnError_(self, error)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckResourceIsReachableAndReturnError(error as NSError) As Boolean
		  declare function checkResourceIsReachableAndReturnError_ lib FoundationLib selector "checkResourceIsReachableAndReturnError:" (obj_id as ptr, error as ptr) as Boolean
		  Return checkResourceIsReachableAndReturnError_(self, error)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSURL")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path as CFStringRef, isDir as Boolean)
		  declare function initFileURLWithPath_ lib FoundationLib selector "initFileURLWithPath:isDirectory:" (obj_id as ptr, path as CFStringRef, isDir as Boolean) as ptr
		  Super.Constructor( initFileURLWithPath_(Allocate(ClassRef), path, isDir) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(scheme as CFStringRef, host as CFStringRef, path as CFStringRef)
		  declare function initWithScheme_ lib FoundationLib selector "initWithScheme:host:path:" (obj_id as ptr, scheme as CFStringRef, host as CFStringRef, path as CFStringRef) as ptr
		  Super.Constructor( initWithScheme_(Allocate(ClassRef), scheme, host, path) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(URLString as CFStringRef, baseURL as NSURL)
		  declare function initWithString_ lib FoundationLib selector "initWithString:relativeToURL:" (obj_id as ptr, URLString as CFStringRef, baseURL as ptr) as ptr
		  Super.Constructor( initWithString_(Allocate(ClassRef), URLString, baseURL) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(bookmarkData as NSData, options as Integer, relativeURL as NSURL, isStale as Boolean, error as NSError)
		  declare function initByResolvingBookmarkData_ lib FoundationLib selector "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:" (obj_id as ptr, bookmarkData as ptr, options as integer, relativeURL as ptr, isStale as Boolean, error as ptr) as ptr
		  Super.Constructor( initByResolvingBookmarkData_(Allocate(ClassRef), bookmarkData, options, relativeURL, isStale, error) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(URLString as NSString)
		  declare function initWithString_ lib FoundationLib selector "initWithString:" (obj_id as ptr, URLString as ptr) as ptr
		  Super.Constructor( initWithString_(Allocate(ClassRef), URLString) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path as Text)
		  declare function initFileURLWithPath_ lib FoundationLib selector "initFileURLWithPath:" (obj_id as ptr, path as CFStringRef) as ptr
		  Super.Constructor( initFileURLWithPath_(Allocate(ClassRef), path) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(f as xojo.IO.FolderItem)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  self.Constructor(f.Path)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileReferenceURL() As NSURL
		  declare function fileReferenceURL_ lib FoundationLib selector "fileReferenceURL" (obj_id as ptr) as ptr
		  Return new NSURL(fileReferenceURL_(self))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FileURLWithPath(path as CFStringRef) As NSURL
		  declare function fileURLWithPath_ lib FoundationLib selector "fileURLWithPath:" (clsRef as ptr, path as CFStringRef) as ptr
		  Return new NSURL(fileURLWithPath_(ClassRef, path))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FileURLWithPathComponents(components as NSArray) As NSURL
		  declare function fileURLWithPathComponents_ lib FoundationLib selector "fileURLWithPathComponents:" (clsRef as ptr, components as ptr) as ptr
		  Return new NSURL(fileURLWithPathComponents_(ClassRef, components))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FileURLWithPathIsDirectory(path as CFStringRef, isDir as Boolean) As NSURL
		  declare function fileURLWithPath_ lib FoundationLib selector "fileURLWithPath:isDirectory:" (clsRef as ptr, path as CFStringRef, isDir as Boolean) as ptr
		  Return new NSURL(fileURLWithPath_(ClassRef, path, isDir))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPromisedItemResourceValueForKeyError(value as ptr, key as CFStringRef, error as NSError) As Boolean
		  declare function getPromisedItemResourceValue_ lib FoundationLib selector "getPromisedItemResourceValue:forKey:error:" (obj_id as ptr, value as ptr, key as CFStringRef, error as ptr) as Boolean
		  Return getPromisedItemResourceValue_(self, value, key, error)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResourceValueForKeyError(value as ptr, key as CFStringRef, error as NSError) As Boolean
		  declare function getResourceValue_ lib FoundationLib selector "getResourceValue:forKey:error:" (obj_id as ptr, value as ptr, key as CFStringRef, error as ptr) as Boolean
		  Return getResourceValue_(self, value, key, error)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEqual(anObject as NSObject) As Boolean
		  declare function isEqual_ lib FoundationLib selector "isEqual:" (obj_id as ptr, anObject as ptr) as Boolean
		  Return isEqual_(self, anObject)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFileReferenceURL() As Boolean
		  declare function isFileReferenceURL_ lib FoundationLib selector "isFileReferenceURL" (obj_id as ptr) as Boolean
		  Return isFileReferenceURL_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PromisedItemResourceValuesForKeysError(keys as NSArray, error as NSError) As NSDictionary
		  declare function promisedItemResourceValuesForKeys_ lib FoundationLib selector "promisedItemResourceValuesForKeys:error:" (obj_id as ptr, keys as ptr, error as ptr) as ptr
		  Return new NSDictionary(promisedItemResourceValuesForKeys_(self, keys, error))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllCachedResourceValues()
		  declare sub removeAllCachedResourceValues_ lib FoundationLib selector "removeAllCachedResourceValues" (obj_id as ptr)
		  removeAllCachedResourceValues_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveCachedResourceValueForKey(key as CFStringRef)
		  declare sub removeCachedResourceValueForKey_ lib FoundationLib selector "removeCachedResourceValueForKey:" (obj_id as ptr, key as CFStringRef)
		  removeCachedResourceValueForKey_(self, key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceValuesForKeysError(keys as NSArray, error as NSError) As NSDictionary
		  declare function resourceValuesForKeys_ lib FoundationLib selector "resourceValuesForKeys:error:" (obj_id as ptr, keys as ptr, error as ptr) as ptr
		  Return new NSDictionary(resourceValuesForKeys_(self, keys, error))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ResourceValuesForKeysFromBookmarkData(keys as NSArray, bookmarkData as NSData) As NSDictionary
		  declare function resourceValuesForKeys_ lib FoundationLib selector "resourceValuesForKeys:fromBookmarkData:" (clsRef as ptr, keys as ptr, bookmarkData as ptr) as ptr
		  Return new NSDictionary(resourceValuesForKeys_(ClassRef, keys, bookmarkData))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetResourceValueForKeyError(value as ptr, key as CFStringRef, error as NSError) As Boolean
		  declare function setResourceValue_ lib FoundationLib selector "setResourceValue:forKey:error:" (obj_id as ptr, value as ptr, key as CFStringRef, error as ptr) as Boolean
		  Return setResourceValue_(self, value, key, error)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetResourceValuesError(keyedValues as NSDictionary, error as NSError) As Boolean
		  declare function setResourceValues_ lib FoundationLib selector "setResourceValues:error:" (obj_id as ptr, keyedValues as ptr, error as ptr) as Boolean
		  Return setResourceValues_(self, keyedValues, error)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTemporaryResourceValueForKey(value as ptr, key as CFStringRef)
		  declare sub setTemporaryResourceValue_ lib FoundationLib selector "setTemporaryResourceValue:forKey:" (obj_id as ptr, value as ptr, key as CFStringRef)
		  setTemporaryResourceValue_(self, value, key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartAccessingSecurityScopedResource() As Boolean
		  declare function startAccessingSecurityScopedResource_ lib FoundationLib selector "startAccessingSecurityScopedResource" (obj_id as ptr) as Boolean
		  Return startAccessingSecurityScopedResource_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopAccessingSecurityScopedResource()
		  declare sub stopAccessingSecurityScopedResource_ lib FoundationLib selector "stopAccessingSecurityScopedResource" (obj_id as ptr)
		  stopAccessingSecurityScopedResource_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLByAppendingPathComponent(pathComponent as CFStringRef) As NSURL
		  declare function URLByAppendingPathComponent_ lib FoundationLib selector "URLByAppendingPathComponent:" (obj_id as ptr, pathComponent as CFStringRef) as ptr
		  Return new NSURL(URLByAppendingPathComponent_(self, pathComponent))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLByAppendingPathComponentIsDirectory(pathComponent as CFStringRef, isDirectory as Boolean) As NSURL
		  declare function URLByAppendingPathComponent_ lib FoundationLib selector "URLByAppendingPathComponent:isDirectory:" (obj_id as ptr, pathComponent as CFStringRef, isDirectory as Boolean) as ptr
		  Return new NSURL(URLByAppendingPathComponent_(self, pathComponent, isDirectory))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLByAppendingPathExtension(pathExtension as CFStringRef) As NSURL
		  declare function URLByAppendingPathExtension_ lib FoundationLib selector "URLByAppendingPathExtension:" (obj_id as ptr, pathExtension as CFStringRef) as ptr
		  Return new NSURL(URLByAppendingPathExtension_(self, pathExtension))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function URLByResolvingAliasFileAtURLOptionsError(url as NSURL, options as Integer, error as NSError) As NSURL
		  declare function URLByResolvingAliasFileAtURL_ lib FoundationLib selector "URLByResolvingAliasFileAtURL:options:error:" (clsRef as ptr, url as ptr, options as integer, error as ptr) as ptr
		  Return new NSURL(URLByResolvingAliasFileAtURL_(ClassRef, url, options, error))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function URLByResolvingBookmarkDataOptionsRelativeToURLBookmarkDataIsStaleError(bookmarkData as NSData, options as Integer, relativeURL as NSURL, isStale as Boolean, error as NSError) As NSURL
		  declare function URLByResolvingBookmarkData_ lib FoundationLib selector "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:" (clsRef as ptr, bookmarkData as ptr, options as integer, relativeURL as ptr, isStale as Boolean, error as ptr) as ptr
		  Return new NSURL(URLByResolvingBookmarkData_(ClassRef, bookmarkData, options, relativeURL, isStale, error))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function URLWithString(URLString as CFStringRef) As NSURL
		  declare function URLWithString_ lib FoundationLib selector "URLWithString:" (clsRef as ptr, URLString as CFStringRef) as ptr
		  Return new NSURL(URLWithString_(ClassRef, URLString))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function URLWithStringRelativeToURL(URLString as CFStringRef, baseURL as NSURL) As NSURL
		  declare function URLWithString_ lib FoundationLib selector "URLWithString:relativeToURL:" (clsRef as ptr, URLString as CFStringRef, baseURL as ptr) as ptr
		  Return new NSURL(URLWithString_(ClassRef, URLString, baseURL))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteBookmarkDataToURLOptionsError(bookmarkData as NSData, bookmarkFileURL as NSURL, options as uinteger, error as NSError) As Boolean
		  declare function writeBookmarkData_ lib FoundationLib selector "writeBookmarkData:toURL:options:error:" (clsRef as ptr, bookmarkData as ptr, bookmarkFileURL as ptr, options as uinteger, error as ptr) as Boolean
		  Return writeBookmarkData_(ClassRef, bookmarkData, bookmarkFileURL, options, error)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function absoluteString_ lib FoundationLib selector "absoluteString" (obj_id as ptr) as CFStringRef
			  Return absoluteString_(self)
			End Get
		#tag EndGetter
		absoluteString As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function absoluteURL_ lib FoundationLib selector "absoluteURL" (obj_id as ptr) as ptr
			  Return new NSURL(absoluteURL_(self))
			End Get
		#tag EndGetter
		absoluteURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function baseURL_ lib FoundationLib selector "baseURL" (obj_id as ptr) as ptr
			  Return new NSURL(baseURL_(self))
			End Get
		#tag EndGetter
		baseURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function filePathURL_ lib FoundationLib selector "filePathURL" (obj_id as ptr) as ptr
			  Return new NSURL(filePathURL_(self))
			End Get
		#tag EndGetter
		filePathURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function fileURL_ lib FoundationLib selector "isFileURL" (obj_id as ptr) as Boolean
			  Return fileURL_(self)
			End Get
		#tag EndGetter
		fileURL As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim result as new xojo.IO.FolderItem(self.path)
			  Return result
			End Get
		#tag EndGetter
		folderitemValue As xojo.IO.FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function fragment_ lib FoundationLib selector "fragment" (obj_id as ptr) as CFStringRef
			  Return fragment_(self)
			End Get
		#tag EndGetter
		fragment As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function host_ lib FoundationLib selector "host" (obj_id as ptr) as CFStringRef
			  Return host_(self)
			End Get
		#tag EndGetter
		host As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function lastPathComponent_ lib FoundationLib selector "lastPathComponent" (obj_id as ptr) as CFStringRef
			  Return lastPathComponent_(self)
			End Get
		#tag EndGetter
		lastPathComponent As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function parameterString_ lib FoundationLib selector "parameterString" (obj_id as ptr) as CFStringRef
			  Return parameterString_(self)
			End Get
		#tag EndGetter
		parameterString As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function password_ lib FoundationLib selector "password" (obj_id as ptr) as CFStringRef
			  Return password_(self)
			End Get
		#tag EndGetter
		password As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function path_ lib FoundationLib selector "path" (obj_id as ptr) as CFStringRef
			  Return path_(self)
			End Get
		#tag EndGetter
		path As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function pathComponents_ lib FoundationLib selector "pathComponents" (obj_id as ptr) as ptr
			  Return new NSArray(pathComponents_(self))
			End Get
		#tag EndGetter
		pathComponents As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function pathExtension_ lib FoundationLib selector "pathExtension" (obj_id as ptr) as CFStringRef
			  Return pathExtension_(self)
			End Get
		#tag EndGetter
		pathExtension As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function query_ lib FoundationLib selector "query" (obj_id as ptr) as CFStringRef
			  Return query_(self)
			End Get
		#tag EndGetter
		query As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function relativePath_ lib FoundationLib selector "relativePath" (obj_id as ptr) as CFStringRef
			  Return relativePath_(self)
			End Get
		#tag EndGetter
		relativePath As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function relativeString_ lib FoundationLib selector "relativeString" (obj_id as ptr) as CFStringRef
			  Return relativeString_(self)
			End Get
		#tag EndGetter
		relativeString As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function resourceSpecifier_ lib FoundationLib selector "resourceSpecifier" (obj_id as ptr) as CFStringRef
			  Return resourceSpecifier_(self)
			End Get
		#tag EndGetter
		resourceSpecifier As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function scheme_ lib FoundationLib selector "scheme" (obj_id as ptr) as CFStringRef
			  Return scheme_(self)
			End Get
		#tag EndGetter
		scheme As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function standardizedURL_ lib FoundationLib selector "standardizedURL" (obj_id as ptr) as ptr
			  Return new NSURL(standardizedURL_(self))
			End Get
		#tag EndGetter
		standardizedURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function URLByDeletingLastPathComponent_ lib FoundationLib selector "URLByDeletingLastPathComponent" (obj_id as ptr) as ptr
			  Return new NSURL(URLByDeletingLastPathComponent_(self))
			End Get
		#tag EndGetter
		URLByDeletingLastPathComponent As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function URLByDeletingPathExtension_ lib FoundationLib selector "URLByDeletingPathExtension" (obj_id as ptr) as ptr
			  Return new NSURL(URLByDeletingPathExtension_(self))
			End Get
		#tag EndGetter
		URLByDeletingPathExtension As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function URLByResolvingSymlinksInPath_ lib FoundationLib selector "URLByResolvingSymlinksInPath" (obj_id as ptr) as ptr
			  Return new NSURL(URLByResolvingSymlinksInPath_(self))
			End Get
		#tag EndGetter
		URLByResolvingSymlinksInPath As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function URLByStandardizingPath_ lib FoundationLib selector "URLByStandardizingPath" (obj_id as ptr) as ptr
			  Return new NSURL(URLByStandardizingPath_(self))
			End Get
		#tag EndGetter
		URLByStandardizingPath As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function user_ lib FoundationLib selector "user" (obj_id as ptr) as CFStringRef
			  Return user_(self)
			End Get
		#tag EndGetter
		user As CFStringRef
	#tag EndComputedProperty


	#tag Constant, Name = NSURLBookmarkCreationMinimalBookmark, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationPreferFileIDResolution, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationSecurityScopeAllowOnlyReadAccess, Type = Double, Dynamic = False, Default = \"4096", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationSuitableForBookmarkFile, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationWithSecurityScope, Type = Double, Dynamic = False, Default = \"2048", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkResolutionWithoutMounting, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkResolutionWithoutUI, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkResolutionWithSecurityScope, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="fileURL"
			Group="Behavior"
			Type="Boolean"
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
