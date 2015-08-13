#tag Class
Class NSData
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSData")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path as CFStringRef)
		  declare function initWithContentsOfFile_ lib FoundationLib selector "initWithContentsOfFile:" (obj_id as ptr, path as CFStringRef) as ptr
		  Super.Constructor( initWithContentsOfFile_(Allocate(ClassRef), path) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data as NSData)
		  declare function initWithData_ lib FoundationLib selector "initWithData:" (obj_id as ptr, data as ptr) as ptr
		  Super.Constructor( initWithData_(Allocate(ClassRef), data) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(aURL as NSURL)
		  declare function initWithContentsOfURL_ lib FoundationLib selector "initWithContentsOfURL:" (obj_id as ptr, aURL as ptr) as ptr
		  Super.Constructor( initWithContentsOfURL_(Allocate(ClassRef), aURL) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(bytes as xojo.core.memoryblock, length as UInteger)
		  declare function initWithBytes_ lib FoundationLib selector "initWithBytes:length:" (obj_id as ptr, bytes as ptr, length as UInteger) as ptr
		  Super.Constructor( initWithBytes_(Allocate(ClassRef), bytes.Data, length) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Data() As NSData
		  declare function data_ lib FoundationLib selector "data" (clsRef as ptr) as ptr
		  Return new NSData(data_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DataWithBytesLength(bytes as xojo.core.memoryblock, length as UInteger) As NSData
		  declare function dataWithBytes_ lib FoundationLib selector "dataWithBytes:length:" (clsRef as ptr, bytes as ptr, length as UInteger) as ptr
		  Return new NSData(dataWithBytes_(ClassRef, bytes.Data, length))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DataWithContentsOfFile(path as CFStringRef) As NSData
		  declare function dataWithContentsOfFile_ lib FoundationLib selector "dataWithContentsOfFile:" (clsRef as ptr, path as CFStringRef) as ptr
		  Return new NSData(dataWithContentsOfFile_(ClassRef, path))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DataWithContentsOfURL(aURL as NSURL) As NSData
		  declare function dataWithContentsOfURL_ lib FoundationLib selector "dataWithContentsOfURL:" (clsRef as ptr, aURL as ptr) as ptr
		  Return new NSData(dataWithContentsOfURL_(ClassRef, aURL))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DataWithData(aData as NSData) As NSData
		  declare function dataWithData_ lib FoundationLib selector "dataWithData:" (clsRef as ptr, aData as ptr) as ptr
		  Return new NSData(dataWithData_(ClassRef, aData))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBytes(range as NSRange) As SmartMemoryBlock
		  dim buffer as new SmartMemoryBlock(range.length)
		  declare sub getBytes_ lib FoundationLib selector "getBytes:range:" (obj_id as ptr, buffer as ptr, range as NSRange)
		  getBytes_(self, buffer.Data, range)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBytes(length as UInteger) As SmartMemoryBlock
		  dim buffer as new SmartMemoryBlock(length)
		  declare sub getBytes_ lib FoundationLib selector "getBytes:length:" (obj_id as ptr, buffer as ptr, length as UInteger)
		  getBytes_(self, buffer.Data, length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEqualToData(otherData as NSData) As Boolean
		  declare function isEqualToData_ lib FoundationLib selector "isEqualToData:" (obj_id as ptr, otherData as ptr) as Boolean
		  Return isEqualToData_(self, otherData)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubdataWithRange(range as NSRange) As NSData
		  declare function subdataWithRange_ lib FoundationLib selector "subdataWithRange:" (obj_id as ptr, range as NSRange) as ptr
		  Return new NSData(subdataWithRange_(self, range))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteToFile(path as CFStringRef, atomically as Boolean) As Boolean
		  declare function writeToFile_ lib FoundationLib selector "writeToFile:atomically:" (obj_id as ptr, path as CFStringRef, atomically as Boolean) as Boolean
		  Return writeToFile_(self, path, atomically)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteToURL(aURL as NSURL, atomically as Boolean) As Boolean
		  declare function writeToURL_ lib FoundationLib selector "writeToURL:atomically:" (obj_id as ptr, aURL as ptr, atomically as Boolean) as Boolean
		  Return writeToURL_(self, aURL, atomically)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target32Bit
			    declare sub getBytes lib FoundationLib selector "getBytes:length:" ( id as Ptr, buffer as Ptr, length as UInt32 )
			  #else
			    declare sub getBytes lib FoundationLib selector "getBytes:length:" ( id as Ptr, buffer as Ptr, length as UInt64 )
			  #endif
			  if self.length > 0 then
			    dim result as new Foundation.SmartMutableMemoryBlock(self.length)
			    GetBytes self,result.Data,self.length
			    Return result
			  end if
			  Return new SmartMutableMemoryBlock(0)
			  
			End Get
		#tag EndGetter
		DataMB As SmartMutableMemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function description_ lib FoundationLib selector "description" (obj_id as ptr) as CFStringRef
			  Return description_(self)
			End Get
		#tag EndGetter
		description As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function length_ lib FoundationLib selector "length" (obj_id as ptr) as UInteger
			  Return length_(self)
			End Get
		#tag EndGetter
		length As UInteger
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="description"
			Group="Behavior"
			Type="Text"
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
