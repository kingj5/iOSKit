#tag Class
Class NSMutableSet
Inherits NSSet
	#tag Method, Flags = &h0
		Sub AddObject(obj as Foundation.NSObject)
		  declare sub addObject_ lib FoundationLib selector "addObject:" (obj_id as ptr, obj as ptr)
		  addObject_(self, obj)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddObjectsFromArray(arr as NSArray)
		  declare sub addObjectsFromArray_ lib FoundationLib selector "addObjectsFromArray:" (obj_id as ptr, arr as ptr)
		  addObjectsFromArray_(self, arr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSMutableSet")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  declare function init_ lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  Super.Constructor( init_(Allocate(ClassRef)) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(numItems as UInteger)
		  declare function initWithCapacity_ lib FoundationLib selector "initWithCapacity:" (obj_id as ptr, numItems as UInteger) as ptr
		  Super.Constructor( initWithCapacity_(Allocate(ClassRef), numItems) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntersectSet(otherSet as NSSet)
		  declare sub intersectSet_ lib FoundationLib selector "intersectSet:" (obj_id as ptr, otherSet as ptr)
		  intersectSet_(self, otherSet)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MinusSet(otherSet as NSSet)
		  declare sub minusSet_ lib FoundationLib selector "minusSet:" (obj_id as ptr, otherSet as ptr)
		  minusSet_(self, otherSet)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllObjects()
		  declare sub removeAllObjects_ lib FoundationLib selector "removeAllObjects" (obj_id as ptr)
		  removeAllObjects_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveObject(object as Foundation.NSObject)
		  declare sub removeObject_ lib FoundationLib selector "removeObject:" (obj_id as ptr, object as ptr)
		  removeObject_(self, object)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Set() As Foundation.NSMutableSet
		  declare function set_ lib FoundationLib selector "set" (clsRef as ptr) as ptr
		  Return new NSMutableSet(set_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSet(otherSet as NSSet)
		  declare sub setSet_ lib FoundationLib selector "setSet:" (obj_id as ptr, otherSet as ptr)
		  setSet_(self, otherSet)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SetWithCapacity(numItems as UInteger) As NSMutableSet
		  declare function setWithCapacity_ lib FoundationLib selector "setWithCapacity:" (clsRef as ptr, numItems as UInteger) as ptr
		  Return new NSMutableSet(setWithCapacity_(ClassRef, numItems))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnionSet(otherSet as NSSet)
		  declare sub unionSet_ lib FoundationLib selector "unionSet:" (obj_id as ptr, otherSet as ptr)
		  unionSet_(self, otherSet)
		End Sub
	#tag EndMethod


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
End Class
#tag EndClass
