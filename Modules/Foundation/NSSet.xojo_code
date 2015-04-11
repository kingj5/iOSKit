#tag Class
Class NSSet
Inherits NSObject
	#tag Method, Flags = &h0
		Function AnyObject() As Foundation.NSObject
		  declare function anyObject_ lib FoundationLib selector "anyObject" (obj_id as ptr) as ptr
		  Return new NSObject(anyObject_(self))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSSet")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  declare function init_ lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  Super.Constructor( init_(Allocate(ClassRef)) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(arr as NSArray)
		  declare function initWithArray_ lib FoundationLib selector "initWithArray:" (obj_id as ptr, arr as ptr) as ptr
		  Super.Constructor( initWithArray_(Allocate(ClassRef), arr) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(set as NSSet)
		  declare function initWithSet_ lib FoundationLib selector "initWithSet:" (obj_id as ptr, set as ptr) as ptr
		  Super.Constructor( initWithSet_(Allocate(ClassRef), set) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(set as NSSet, flag as Boolean)
		  declare function initWithSet_ lib FoundationLib selector "initWithSet:copyItems:" (obj_id as ptr, set as ptr, flag as Boolean) as ptr
		  Super.Constructor( initWithSet_(Allocate(ClassRef), set, flag) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsObject(anObject as Foundation.NSObject) As Boolean
		  declare function containsObject_ lib FoundationLib selector "containsObject:" (obj_id as ptr, anObject as ptr) as Boolean
		  Return containsObject_(self, anObject)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DescriptionWithLocale(locale as ptr) As Text
		  declare function descriptionWithLocale_ lib FoundationLib selector "descriptionWithLocale:" (obj_id as ptr, locale as ptr) as CFStringRef
		  Return descriptionWithLocale_(self, locale)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnumerateObjectsUsingBlock(block as iOSBlock)
		  declare sub enumerateObjectsUsingBlock_ lib FoundationLib selector "enumerateObjectsUsingBlock:" (obj_id as ptr, block as ptr)
		  enumerateObjectsUsingBlock_(self, block.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntersectsSet(otherSet as NSSet) As Boolean
		  declare function intersectsSet_ lib FoundationLib selector "intersectsSet:" (obj_id as ptr, otherSet as ptr) as Boolean
		  Return intersectsSet_(self, otherSet)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEqualToSet(otherSet as NSSet) As Boolean
		  declare function isEqualToSet_ lib FoundationLib selector "isEqualToSet:" (obj_id as ptr, otherSet as ptr) as Boolean
		  Return isEqualToSet_(self, otherSet)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSubsetOfSet(otherSet as NSSet) As Boolean
		  declare function isSubsetOfSet_ lib FoundationLib selector "isSubsetOfSet:" (obj_id as ptr, otherSet as ptr) as Boolean
		  Return isSubsetOfSet_(self, otherSet)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Set() As NSSet
		  declare function set_ lib FoundationLib selector "set" (clsRef as ptr) as ptr
		  Return new NSSet(set_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetByAddingObject(anObject as Foundation.NSObject) As NSSet
		  declare function setByAddingObject_ lib FoundationLib selector "setByAddingObject:" (obj_id as ptr, anObject as ptr) as ptr
		  Return new NSSet(setByAddingObject_(self, anObject))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetByAddingObjectsFromArray(other as NSArray) As NSSet
		  declare function setByAddingObjectsFromArray_ lib FoundationLib selector "setByAddingObjectsFromArray:" (obj_id as ptr, other as ptr) as ptr
		  Return new NSSet(setByAddingObjectsFromArray_(self, other))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetByAddingObjectsFromSet(other as NSSet) As NSSet
		  declare function setByAddingObjectsFromSet_ lib FoundationLib selector "setByAddingObjectsFromSet:" (obj_id as ptr, other as ptr) as ptr
		  Return new NSSet(setByAddingObjectsFromSet_(self, other))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValueForKey(value as ptr, key as CFStringRef)
		  declare sub setValue_ lib FoundationLib selector "setValue:forKey:" (obj_id as ptr, value as ptr, key as CFStringRef)
		  setValue_(self, value, key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SetWithArray(arr as NSArray) As NSSet
		  declare function setWithArray_ lib FoundationLib selector "setWithArray:" (clsRef as ptr, arr as ptr) as ptr
		  Return new NSSet(setWithArray_(ClassRef, arr))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SetWithObject(obj as Foundation.NSObject) As NSSet
		  declare function setWithObject_ lib FoundationLib selector "setWithObject:" (clsRef as ptr, object as ptr) as ptr
		  Return new NSSet(setWithObject_(ClassRef, obj))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SetWithSet(set as NSSet) As NSSet
		  declare function setWithSet_ lib FoundationLib selector "setWithSet:" (clsRef as ptr, set as ptr) as ptr
		  Return new NSSet(setWithSet_(ClassRef, set))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SortedArrayUsingDescriptors(sortDescriptors as NSArray) As NSArray
		  declare function sortedArrayUsingDescriptors_ lib FoundationLib selector "sortedArrayUsingDescriptors:" (obj_id as ptr, sortDescriptors as ptr) as ptr
		  Return new NSArray(sortedArrayUsingDescriptors_(self, sortDescriptors))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueForKey(key as CFStringRef) As Foundation.NSObject
		  declare function valueForKey_ lib FoundationLib selector "valueForKey:" (obj_id as ptr, key as CFStringRef) as ptr
		  Return new NSObject(valueForKey_(self, key))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function allObjects_ lib FoundationLib selector "allObjects" (obj_id as ptr) as ptr
			  Return new NSArray(allObjects_(self))
			End Get
		#tag EndGetter
		allObjects As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function count_ lib FoundationLib selector "count" (obj_id as ptr) as UInteger
			  Return count_(self)
			End Get
		#tag EndGetter
		count As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function description_ lib FoundationLib selector "description" (obj_id as ptr) as CFStringRef
			  Return description_(self)
			End Get
		#tag EndGetter
		description As CFStringRef
	#tag EndComputedProperty


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
