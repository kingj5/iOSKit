#tag Class
Class NSMutableData
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AppendBytesLength(bytes as xojo.Core.MemoryBlock)
		  declare sub appendBytes_ lib FoundationLib selector "appendBytes:length:" (obj_id as ptr, bytes as ptr, length as UInteger)
		  appendBytes_(self, bytes.Data, bytes.Size)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendData(otherData as NSData)
		  declare sub appendData_ lib FoundationLib selector "appendData:" (obj_id as ptr, otherData as ptr)
		  appendData_(self, otherData)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSMutableData")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(length as UInteger)
		  declare function initWithLength_ lib FoundationLib selector "initWithLength:" (obj_id as ptr, length as UInteger) as ptr
		  Super.Constructor( initWithLength_(Allocate(ClassRef), length) )
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
		Shared Function DataWithCapacity(aNumItems as UInteger) As NSMutableData
		  declare function dataWithCapacity_ lib FoundationLib selector "dataWithCapacity:" (clsRef as ptr, aNumItems as UInteger) as ptr
		  Return new NSMutableData(dataWithCapacity_(ClassRef, aNumItems))
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
		Shared Function DataWithLength(length as UInteger) As NSMutableData
		  declare function dataWithLength_ lib FoundationLib selector "dataWithLength:" (clsRef as ptr, length as UInteger) as ptr
		  Return new NSMutableData(dataWithLength_(ClassRef, length))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncreaseLengthBy(extraLength as UInteger)
		  declare sub increaseLengthBy_ lib FoundationLib selector "increaseLengthBy:" (obj_id as ptr, extraLength as UInteger)
		  increaseLengthBy_(self, extraLength)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceBytesInRangeWithBytes(range as NSRange, bytes as xojo.Core.MemoryBlock)
		  declare sub replaceBytesInRange_ lib FoundationLib selector "replaceBytesInRange:withBytes:" (obj_id as ptr, range as NSRange, bytes as ptr)
		  replaceBytesInRange_(self, range, bytes.Data)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceBytesInRangeWithBytesLength(range as NSRange, replacementBytes as xojo.core.memoryblock, replacementLength as UInteger)
		  declare sub replaceBytesInRange_ lib FoundationLib selector "replaceBytesInRange:withBytes:length:" (obj_id as ptr, range as NSRange, replacementBytes as ptr, replacementLength as UInteger)
		  replaceBytesInRange_(self, range, replacementBytes.Data, replacementLength)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetBytesInRange(range as NSRange)
		  declare sub resetBytesInRange_ lib FoundationLib selector "resetBytesInRange:" (obj_id as ptr, range as NSRange)
		  resetBytesInRange_(self, range)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(aData as NSData)
		  declare sub setData_ lib FoundationLib selector "setData:" (obj_id as ptr, aData as ptr)
		  setData_(self, aData)
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
