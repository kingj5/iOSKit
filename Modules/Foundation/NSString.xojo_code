#tag Class
Class NSString
Inherits NSObject
	#tag Method, Flags = &h0
		Function AbbreviatedPath() As Text
		  
		  
		  declare function stringByAbbreviatingWithTildeInPath lib FoundationLib selector "stringByAbbreviatingWithTildeInPath" (obj_id as Ptr) as CFStringRef
		  
		  return stringByAbbreviatingWithTildeInPath(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AppendPathComponent(aString as Text) As Text
		  
		  
		  declare function stringByAppendingPathComponent lib FoundationLib selector "stringByAppendingPathComponent:" _
		  (obj_id as Ptr, aString as CFStringRef) as CFStringRef
		  
		  return stringByAppendingPathComponent(self, aString)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AppendPathExtension(ext as Text) As Text
		  
		  
		  declare function stringByAppendingPathExtension lib FoundationLib selector "stringByAppendingPathExtension:" _
		  (obj_id as Ptr, ext as CFStringRef) as CFStringRef
		  
		  return stringByAppendingPathExtension(self, ext)
		  
		  
		  #pragma unused ext
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function AvailableStringEncodings() As NSStringEncoding()
		  
		  
		  declare function availableStringEncodings lib FoundationLib selector "availableStringEncodings" (class_id as Ptr) as Ptr
		  
		  const sizeOfUInt32 = 4
		  
		  dim rb_array() as NSStringEncoding
		  
		  dim m as MemoryBlock = new MemoryBlock(availableStringEncodings(ClassRef))
		  
		  dim offset as UInt32 = 0
		  while m.UInt32Value(offset) <> 0
		    rb_array.append NSStringEncoding(m.UInt32Value(offset))
		    offset = offset + sizeOfUInt32
		  wend
		  
		  return rb_array
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BooleanValue() As Boolean
		  
		  
		  declare function boolValue lib FoundationLib selector "boolValue" (obj_id as Ptr) as Boolean
		  
		  return boolValue(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BoundingSize(attribs as NSDictionary) As NSSize
		  
		  #if Target32Bit
		    declare function sizeWithAttributes lib FoundationLib selector "sizeWithAttributes:" (obj_id as Ptr, attribs as Ptr) as NSSize32
		  #Elseif Target64Bit
		    declare function sizeWithAttributes lib FoundationLib selector "sizeWithAttributes:" (obj_id as Ptr, attribs as Ptr) as NSSize64
		  #Endif
		  
		  dim dictRef as Ptr
		  if attribs <> nil then
		    dictRef = attribs
		  end if
		  
		  return sizeWithAttributes(self, dictRef)
		  
		  
		  #pragma unused attribs
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanBeConverted(anEncoding as NSStringEncoding) As Boolean
		  
		  
		  declare function canBeConvertedToEncoding lib FoundationLib selector "canBeConvertedToEncoding:" _
		  (obj_id as Ptr, anEncoding as NSStringEncoding) as Boolean
		  
		  return canBeConvertedToEncoding(self, anEncoding)
		  
		  
		  #pragma unused anEncoding
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Char(index as UInt32) As Text
		  
		  
		  declare function characterAtIndex lib FoundationLib selector "characterAtIndex:" (obj_id as Ptr, index as UInt32) as UInt16
		  
		  dim unichar as UInt16 = characterAtIndex(self, index)
		  
		  return Text.FromUnicodeCodepoint(unichar)
		  
		  
		  #pragma unused index
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSString")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(aString as NSString) As NSComparisonResult
		  
		  
		  declare function compare lib FoundationLib selector "compare:" (obj_id as Ptr, aString as Ptr) as NSComparisonResult
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return compare(self, aStringRef)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(aString as NSString, options as UInt32) As NSComparisonResult
		  
		  
		  declare function compare lib FoundationLib selector "compare:options:" (obj_id as Ptr, aString as Ptr, options as UInt32) as NSComparisonResult
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return compare(self, aStringRef, options)
		  
		  
		  #pragma unused aString
		  #pragma unused options
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareCaseInsensitive(aString as NSString) As NSComparisonResult
		  
		  
		  declare function caseInsensitiveCompare lib FoundationLib selector "caseInsensitiveCompare:" (obj_id as Ptr, aString as Ptr) as NSComparisonResult
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return caseInsensitiveCompare(self, aStringRef)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareLocalized(aString as NSString) As NSComparisonResult
		  
		  
		  declare function localizedCompare lib FoundationLib selector "localizedCompare:" (obj_id as Ptr, aString as Ptr) as NSComparisonResult
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return localizedCompare(self, aStringRef)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareLocalizedCaseInsensitive(aString as NSString) As NSComparisonResult
		  
		  
		  declare function localizedCaseInsensitiveCompare lib FoundationLib selector "localizedCaseInsensitiveCompare:" (obj_id as Ptr, aString as Ptr) as NSComparisonResult
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return localizedCaseInsensitiveCompare(self, aStringRef)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareLocalizedStandard(aString as NSString) As NSComparisonResult
		  
		  
		  declare function localizedStandardCompare lib FoundationLib selector "localizedStandardCompare:" (obj_id as Ptr, aString as Ptr) as NSComparisonResult
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return localizedStandardCompare(self, aStringRef)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize(Allocate(NSClassFromString("NSString"))))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aString as NSString)
		  
		  
		  declare function initWithString lib FoundationLib selector "initWithString:" (obj_id as Ptr, aString as Ptr) as Ptr
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  super.Constructor(initWithString(Allocate(NSClassFromString("NSString")), aStringRef))
		  
		  
		  #pragma unused aString
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(s as Text)
		  
		  declare function stringWithString lib FoundationLib selector "stringWithString:" ( cls as Ptr, value as CFStringRef ) as Ptr
		  
		  //note that this stringWithString expects the caller to take ownership of the returned NSString.
		  Super.Constructor(stringWithString( NSClassFromString("NSString" ), s))
		  
		  
		  #pragma unused s
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function Create() As NSString
		  
		  
		  declare function string_ lib FoundationLib selector "string" (class_id as Ptr) as Ptr
		  
		  dim stringRef as Ptr = string_(ClassRef)
		  if stringRef <> nil then
		    return new NSString(stringRef)
		  else
		    return nil
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithString(aString as NSString) As NSString
		  
		  
		  declare function stringWithString lib FoundationLib selector "stringWithString:" (class_id as Ptr, aString as Ptr) as Ptr
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  dim stringRef as Ptr = stringWithString(ClassRef, aStringRef)
		  if stringRef <> nil then
		    return new NSString(stringRef)
		  else
		    return nil
		  end if
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithString(aString as Text) As NSString
		  
		  
		  declare function stringWithString lib FoundationLib selector "stringWithString:" (class_id as Ptr, aString as CFStringRef) as Ptr
		  
		  dim stringRef as Ptr = stringWithString(ClassRef, aString)
		  if stringRef <> nil then
		    return new NSString(stringRef)
		  else
		    return nil
		  end if
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decomposedStringWithCanonicalMapping() As NSString
		  
		  declare function decomposedStringWithCanonicalMapping lib FoundationLib selector "decomposedStringWithCanonicalMapping" (id as Ptr) as Ptr
		  
		  return new NSString(decomposedStringWithCanonicalMapping(self))
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decomposedStringWithCompatibilityMapping() As NSString
		  
		  
		  declare function decomposedStringWithCompatibilityMapping lib FoundationLib selector "decomposedStringWithCompatibilityMapping" (id as Ptr) as Ptr
		  
		  return new NSString(decomposedStringWithCompatibilityMapping(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(point as NSPoint, attribs as NSDictionary)
		  
		  #if Target32Bit
		    declare sub drawAtPoint lib FoundationLib selector "drawAtPoint:withAttributes:" (obj_id as Ptr, point as NSPoint32, attribs as Ptr)
		  #Elseif Target64Bit
		    declare sub drawAtPoint lib FoundationLib selector "drawAtPoint:withAttributes:" (obj_id as Ptr, point as NSPoint64, attribs as Ptr)
		  #Endif
		  
		  
		  dim dictRef as Ptr
		  if attribs <> nil then
		    dictRef = attribs
		  end if
		  
		  #if Target32Bit
		    drawAtPoint self, point.Value32, dictRef
		  #Elseif Target64Bit
		    drawAtPoint self, point.Value64, dictRef
		  #Endif
		  
		  
		  #pragma unused point
		  #pragma unused attribs
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Draw(rect as NSRect, attribs as NSDictionary)
		  
		  #if Target32Bit
		    declare sub drawInRect lib FoundationLib selector "drawInRect:withAttributes:" (obj_id as Ptr, rect as NSRect32, attribs as Ptr)
		  #elseif Target64Bit
		    declare sub drawInRect lib FoundationLib selector "drawInRect:withAttributes:" (obj_id as Ptr, rect as NSRect64, attribs as Ptr)
		  #Endif
		  
		  dim dictRef as Ptr
		  if attribs <> nil then
		    dictRef = attribs
		  end if
		  
		  #if Target32Bit
		    drawInRect self, rect.Value32, dictRef
		  #Elseif Target64Bit
		    drawInRect self, rect.Value64, dictRef
		  #Endif
		  
		  
		  #pragma unused rect
		  #pragma unused attribs
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EscapedURL(anEncoding as NSStringEncoding = NSStringEncoding.NSUTF8StringEncoding) As Text
		  
		  
		  declare function stringByAddingPercentEscapesUsingEncoding lib FoundationLib selector "stringByAddingPercentEscapesUsingEncoding:" _
		  (obj_id as Ptr, anEncoding as NSStringEncoding) as CFStringRef
		  
		  return stringByAddingPercentEscapesUsingEncoding(self, anEncoding)
		  
		  
		  #pragma unused anEncoding
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExpandedPath() As Text
		  
		  
		  declare function stringByExpandingTildeInPath lib FoundationLib selector "stringByExpandingTildeInPath" (path as CFStringRef) as CFStringRef
		  
		  return stringByExpandingTildeInPath(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FastestEncoding() As NSStringEncoding
		  
		  
		  declare function fastestEncoding lib FoundationLib selector "fastestEncoding" (obj_id as Ptr) as NSStringEncoding
		  
		  return fastestEncoding(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileSystemRepresentation() As Text
		  
		  
		  declare function fileSystemRepresentation lib FoundationLib selector "fileSystemRepresentation" (obj_id as Ptr) as CString
		  
		  return text.FromCString( fileSystemRepresentation(self) , xojo.core.TextEncoding.UTF8)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hash() As UInt32
		  
		  
		  declare function hash lib FoundationLib selector "hash" (obj_id as Ptr) as UInt32
		  
		  return hash(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasPrefix(aString as NSString) As Boolean
		  
		  
		  declare function hasPrefix lib FoundationLib selector "hasPrefix:" (obj_id as Ptr, aString as Ptr) as Boolean
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return hasPrefix(self, aStringRef)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasSuffix(aString as NSString) As Boolean
		  
		  
		  declare function hasSuffix lib FoundationLib selector "hasSuffix:" (obj_id as Ptr, aString as Ptr) as Boolean
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return hasSuffix(self, aStringRef)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Instr(aString as Text) As UInt32
		  
		  
		  declare function rangeOfString lib FoundationLib selector "rangeOfString:" (obj_id as Ptr, aString as CFStringRef) as NSRange
		  
		  dim range as NSRange = rangeOfString(self, aString)
		  
		  return range.location
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Instr(aString as Text, optionsMask as UInt32) As UInt32
		  
		  
		  declare function rangeOfString lib FoundationLib selector "rangeOfString:options:" _
		  (obj_id as Ptr, aString as CFStringRef, optionsMask as UInt32) as NSRange
		  
		  dim range as NSRange = rangeOfString(self, aString, optionsMask)
		  
		  return range.location
		  
		  
		  #pragma unused aString
		  #pragma unused optionsMask
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEqual(aString as NSString) As Boolean
		  
		  
		  declare function isEqualToString lib FoundationLib selector "isEqualToString:" (obj_id as Ptr, aString as Ptr) as Boolean
		  
		  dim aStringRef as Ptr
		  if aString <> nil then
		    aStringRef = aString
		  end if
		  
		  return isEqualToString(self, aStringRef)
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastPathComponent() As Text
		  
		  
		  declare function lastPathComponent lib FoundationLib selector "lastPathComponent" (obj_id as Ptr) as CFStringRef
		  
		  return lastPathComponent(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Left(numberOfChars as UInt32) As NSString
		  
		  
		  declare function substringToIndex lib FoundationLib selector "substringToIndex:" (obj_id as Ptr, index as UInt32) as Ptr
		  
		  dim stringRef as Ptr = substringToIndex(self, numberOfChars)
		  if stringRef <> nil then
		    return new NSString(stringRef)
		  else
		    return nil
		  end if
		  
		  
		  #pragma unused numberOfChars
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Len() As UInt32
		  
		  
		  declare function length lib FoundationLib selector "length" (obj_id as Ptr) as UInt32
		  
		  return length(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function LenB(anEncoding as NSStringEncoding) As UInt32
		  
		  
		  declare function lengthOfBytesUsingEncoding lib FoundationLib selector "lengthOfBytesUsingEncoding:" (obj_id as Ptr, enc as NSStringEncoding) as UInt32
		  
		  return lengthOfBytesUsingEncoding(self, anEncoding)
		  
		  
		  #pragma unused anEncoding
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function LocalizedNameOfStringEncoding(anEncoding as NSStringEncoding) As Text
		  
		  
		  declare function localizedNameOfStringEncoding lib FoundationLib selector "localizedNameOfStringEncoding:" _
		  (class_id as Ptr, enc as NSStringEncoding) as CFStringRef
		  
		  return localizedNameOfStringEncoding(ClassRef, anEncoding)
		  
		  
		  #pragma unused anEncoding
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function MaxLenB(anEncoding as NSStringEncoding) As UInt32
		  
		  
		  declare function maximumLengthOfBytesUsingEncoding lib FoundationLib selector "maximumLengthOfBytesUsingEncoding:" _
		  (obj_id as Ptr, enc as NSStringEncoding) as UInt32
		  
		  return maximumLengthOfBytesUsingEncoding(self, anEncoding)
		  
		  
		  #pragma unused anEncoding
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Mid(range as NSRange) As NSString
		  
		  
		  declare function substringWithRange lib FoundationLib selector "substringWithRange:" (obj_id as Ptr, range as NSRange) as Ptr
		  
		  dim stringRef as Ptr = substringWithRange(self, range)
		  if stringRef <> nil then
		    return new NSString(stringRef)
		  else
		    return nil
		  end if
		  
		  
		  #pragma unused range
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Mid(index as UInt32) As NSString
		  
		  
		  declare function substringFromIndex lib FoundationLib selector "substringFromIndex:" (obj_id as Ptr, index as UInt32) as Ptr
		  
		  dim stringRef as Ptr = substringFromIndex(self, index)
		  if stringRef <> nil then
		    return new NSString(stringRef)
		  else
		    return nil
		  end if
		  
		  
		  #pragma unused index
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(aString as NSString) As NSString
		  
		  
		  declare function stringByAppendingString lib FoundationLib selector "stringByAppendingString:" (obj_id as Ptr, aString as Ptr) as Ptr
		  
		  if aString <> nil then
		    dim aStringRef as Ptr = stringByAppendingString(self, aString)
		    return new NSString(aStringRef)
		  else
		    return self
		  end if
		  
		  
		  #pragma unused aString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(aString as NSString) As Integer
		  
		  return CType(self.Compare(aString),Integer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Text
		  return self.StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(s as Text)
		  self.Constructor(s)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathComponents() As Text()
		  
		  
		  declare function pathComponents lib FoundationLib selector "pathComponents" (obj_id as Ptr) as Ptr
		  
		  dim rb_array() as Text
		  
		  dim arrayRef as Ptr = pathComponents(self)
		  if arrayRef <> nil then
		    rb_array = new NSArray(arrayRef)
		  end if
		  
		  return rb_array
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pathExtension() As NSString
		  // Added by Kem Tekinay.
		  
		  
		  declare function pathExtension lib FoundationLib selector "pathExtension" (id as Ptr) as Ptr
		  
		  return new NSString(pathExtension(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function precomposedStringWithCanonicalMapping() As NSString
		  
		  declare function precomposedStringWithCanonicalMapping lib FoundationLib selector "precomposedStringWithCanonicalMapping" (id as Ptr) as Ptr
		  
		  return new NSString(precomposedStringWithCanonicalMapping(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function precomposedStringWithCompatibilityMapping() As NSString
		  
		  declare function precomposedStringWithCompatibilityMapping lib FoundationLib selector "precomposedStringWithCompatibilityMapping" (id as Ptr) as Ptr
		  
		  return new NSString(precomposedStringWithCompatibilityMapping(self))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function PropertyList() As Ptr
		  
		  
		  declare function propertyList lib FoundationLib selector "propertyList" (obj_id as Ptr) as Ptr
		  
		  return propertyList(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveExtension() As Text
		  
		  
		  declare function stringByDeletingPathExtension lib FoundationLib selector "stringByDeletingPathExtension" (obj_id as Ptr) as CFStringRef
		  
		  return stringByDeletingPathExtension(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ReplaceAll(searchString as Text, replacement as Text) As Text
		  
		  
		  declare function stringByReplacingOccurrencesOfString lib FoundationLib selector "stringByReplacingOccurrencesOfString:withString:" _
		  (obj_id as Ptr, target as CFStringRef, replacement as CFStringRef) as CFStringRef
		  
		  return stringByReplacingOccurrencesOfString(self, searchString, replacement)
		  
		  
		  #pragma unused searchString
		  #pragma unused replacement
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ReplaceAll(searchString as Text, replacement as Text, options as UInt32, range as NSRange) As Text
		  
		  
		  declare function stringByReplacingOccurrencesOfString lib FoundationLib selector "stringByReplacingOccurrencesOfString:withString:options:range:" _
		  (obj_id as Ptr, target as CFStringRef, replacement as CFStringRef, options as UInt32, range as NSRange) as CFStringRef
		  
		  return stringByReplacingOccurrencesOfString(self, searchString, replacement, options, range)
		  
		  
		  #pragma unused searchString
		  #pragma unused replacement
		  #pragma unused options
		  #pragma unused range
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResolvePath() As Text
		  
		  
		  declare function stringByResolvingSymlinksInPath lib FoundationLib selector "stringByResolvingSymlinksInPath" (obj_id as Ptr) as CFStringRef
		  
		  return stringByResolvingSymlinksInPath(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SmallestEncoding() As NSStringEncoding
		  
		  
		  declare function smallestEncoding lib FoundationLib selector "smallestEncoding" (obj_id as Ptr) as NSStringEncoding
		  
		  return smallestEncoding(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Split(separator as Text) As Text()
		  
		  
		  declare function componentsSeparatedByString lib FoundationLib selector "componentsSeparatedByString:" _
		  (obj_id as Ptr, separator as CFStringRef) as Ptr
		  
		  dim rb_array() as Text
		  
		  dim arrayRef as Ptr = componentsSeparatedByString(self, separator)
		  if arrayRef <> nil then
		    rb_array = new NSArray(arrayRef)
		  end if
		  
		  return rb_array
		  
		  
		  #pragma unused separator
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StandardizePath() As Text
		  
		  
		  declare function stringByStandardizingPath lib FoundationLib selector "stringByStandardizingPath" (obj_id as Ptr) as CFStringRef
		  
		  return stringByStandardizingPath(self)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnescapedURL(anEncoding as NSStringEncoding = NSStringEncoding.NSUTF8StringEncoding) As Text
		  
		  
		  declare function stringByReplacingPercentEscapesUsingEncoding lib FoundationLib selector "stringByReplacingPercentEscapesUsingEncoding:" _
		  (obj_id as Ptr, anEncoding as NSStringEncoding) as CFStringRef
		  
		  return stringByReplacingPercentEscapesUsingEncoding(self, anEncoding)
		  
		  
		  #pragma unused anEncoding
		  
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  
			  declare function isAbsolutePath lib FoundationLib selector "isAbsolutePath" (obj_id as Ptr) as Boolean
			  
			  return isAbsolutePath(self)
			  
			  
			  
			End Get
		#tag EndGetter
		AbsolutePath As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  
			  declare function doubleValue lib FoundationLib selector "doubleValue" (obj_id as Ptr) as Double
			  
			  return doubleValue(self)
			  
			  
			  
			End Get
		#tag EndGetter
		DoubleValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  
			  declare function longLongValue lib FoundationLib selector "longLongValue" (obj_id as Ptr) as Int64
			  
			  return longLongValue(self)
			  
			  
			  
			End Get
		#tag EndGetter
		Int64Value As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  
			  declare function integerValue lib FoundationLib selector "integerValue" (obj_id as Ptr) as Integer
			  
			  return integerValue(self)
			  
			  
			  
			End Get
		#tag EndGetter
		IntegerValue As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  declare function length lib FoundationLib selector "length" (obj_id as Ptr) as Integer
			  
			  return length(self)
			  
			End Get
		#tag EndGetter
		Length As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  
			  declare function floatValue lib FoundationLib selector "floatValue" (obj_id as Ptr) as Single
			  
			  return floatValue(self)
			  
			  
			  
			End Get
		#tag EndGetter
		SingleValue As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function stringWithString lib FoundationLib selector "stringWithString:" (clsRef as ptr, str as ptr) as CFStringRef
			  Return stringWithString(ClassRef, self)
			End Get
		#tag EndGetter
		StringValue As Text
	#tag EndComputedProperty


	#tag Constant, Name = NSAnchoredSearch, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSBackwardsSearch, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSCaseInsensitiveSearch, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSDiacriticInsensitiveSearch, Type = Double, Dynamic = False, Default = \"128", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSForcedOrderingSearch, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLiteralSearch, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSNumericSearch, Type = Double, Dynamic = False, Default = \"64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSRegularExpressionSearch, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingDisableScreenFontSubstitution, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingOneShot, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingTruncatesLastVisibleLine, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingUsesDeviceMetrics, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingUsesFontLeading, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSStringDrawingUsesLineFragmentOrigin, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSWidthInsensitiveSearch, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSStringEncoding, Flags = &h0
		NSASCIIStringEncoding = 1
		  NSNEXTSTEPStringEncoding = 2
		  NSJapaneseEUCStringEncoding = 3
		  NSUTF8StringEncoding = 4
		  NSISOLatin1StringEncoding = 5
		  NSSymbolStringEncoding = 6
		  NSNonLossyASCIIStringEncoding = 7
		  NSShiftJISStringEncoding = 8
		  NSISOLatin2StringEncoding = 9
		  NSUnicodeStringEncoding = 10
		  NSWindowsCP1251StringEncoding = 11
		  NSWindowsCP1252StringEncoding = 12
		  NSWindowsCP1253StringEncoding = 13
		  NSWindowsCP1254StringEncoding = 14
		  NSWindowsCP1250StringEncoding = 15
		  NSISO2022JPStringEncoding = 21
		  NSMacOSRomanStringEncoding = 30
		  NSUTF16StringEncoding = 10
		  NSUTF16BigEndianStringEncoding = &h90000100
		  NSUTF16LittleEndianStringEncoding = &h94000100
		  NSUTF32StringEncoding = &h8c000100
		  NSUTF32BigEndianStringEncoding = &h98000100
		  NSUTF32LittleEndianStringEncoding = &h9c000100
		NSProprietaryStringEncoding = 65536
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AbsolutePath"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Group="Behavior"
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
			Name="IntegerValue"
			Group="Behavior"
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
			Name="Length"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SingleValue"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
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
