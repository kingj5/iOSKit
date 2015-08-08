#tag Class
Class NSUserDefaults
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddSuiteNamed(suiteName as CFStringRef)
		  declare sub addSuiteNamed_ lib FoundationLib selector "addSuiteNamed:" (obj_id as ptr, suiteName as CFStringRef)
		  addSuiteNamed_(self, suiteName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ArrayForKey(defaultName as CFStringRef) As NSArray
		  declare function arrayForKey_ lib FoundationLib selector "arrayForKey:" (obj_id as ptr, defaultName as CFStringRef) as ptr
		  Return new NSArray(arrayForKey_(self, defaultName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BoolForKey(defaultName as CFStringRef) As Boolean
		  declare function boolForKey_ lib FoundationLib selector "boolForKey:" (obj_id as ptr, defaultName as CFStringRef) as Boolean
		  Return boolForKey_(self, defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("NSUserDefaults")
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
		Sub Constructor(suitename as CFStringRef)
		  declare function initWithSuiteName_ lib FoundationLib selector "initWithSuiteName:" (obj_id as ptr, suitename as CFStringRef) as ptr
		  Super.Constructor( initWithSuiteName_(Allocate(ClassRef), suitename) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictionaryForKey(defaultName as CFStringRef) As NSDictionary
		  declare function dictionaryForKey_ lib FoundationLib selector "dictionaryForKey:" (obj_id as ptr, defaultName as CFStringRef) as ptr
		  Return new NSDictionary(dictionaryForKey_(self, defaultName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictionaryRepresentation() As NSDictionary
		  declare function dictionaryRepresentation_ lib FoundationLib selector "dictionaryRepresentation" (obj_id as ptr) as ptr
		  Return new NSDictionary(dictionaryRepresentation_(self))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleForKey(defaultName as CFStringRef) As Double
		  declare function doubleForKey_ lib FoundationLib selector "doubleForKey:" (obj_id as ptr, defaultName as CFStringRef) as Double
		  Return doubleForKey_(self, defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerForKey(defaultName as CFStringRef) As Integer
		  declare function integerForKey_ lib FoundationLib selector "integerForKey:" (obj_id as ptr, defaultName as CFStringRef) as Integer
		  Return integerForKey_(self, defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForKey(defaultName as CFStringRef) As NSObject
		  declare function objectForKey_ lib FoundationLib selector "objectForKey:" (obj_id as ptr, defaultName as CFStringRef) as ptr
		  Return new NSObject(objectForKey_(self, defaultName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectIsForcedForKey(key as CFStringRef) As Boolean
		  declare function objectIsForcedForKey_ lib FoundationLib selector "objectIsForcedForKey:" (obj_id as ptr, key as CFStringRef) as Boolean
		  Return objectIsForcedForKey_(self, key)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectIsForcedForKeyInDomain(key as CFStringRef, domain as CFStringRef) As Boolean
		  declare function objectIsForcedForKey_ lib FoundationLib selector "objectIsForcedForKey:inDomain:" (obj_id as ptr, key as CFStringRef, domain as CFStringRef) as Boolean
		  Return objectIsForcedForKey_(self, key, domain)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PersistentDomainForName(domainName as CFStringRef) As NSDictionary
		  declare function persistentDomainForName_ lib FoundationLib selector "persistentDomainForName:" (obj_id as ptr, domainName as CFStringRef) as ptr
		  Return new NSDictionary(persistentDomainForName_(self, domainName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterDefaults(dictionary as NSDictionary)
		  declare sub registerDefaults_ lib FoundationLib selector "registerDefaults:" (obj_id as ptr, dictionary as ptr)
		  registerDefaults_(self, dictionary)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveObjectForKey(defaultName as CFStringRef)
		  declare sub removeObjectForKey_ lib FoundationLib selector "removeObjectForKey:" (obj_id as ptr, defaultName as CFStringRef)
		  removeObjectForKey_(self, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePersistentDomainForName(domainName as CFStringRef)
		  declare sub removePersistentDomainForName_ lib FoundationLib selector "removePersistentDomainForName:" (obj_id as ptr, domainName as CFStringRef)
		  removePersistentDomainForName_(self, domainName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSuiteNamed(suiteName as CFStringRef)
		  declare sub removeSuiteNamed_ lib FoundationLib selector "removeSuiteNamed:" (obj_id as ptr, suiteName as CFStringRef)
		  removeSuiteNamed_(self, suiteName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveVolatileDomainForName(domainName as CFStringRef)
		  declare sub removeVolatileDomainForName_ lib FoundationLib selector "removeVolatileDomainForName:" (obj_id as ptr, domainName as CFStringRef)
		  removeVolatileDomainForName_(self, domainName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ResetStandardUserDefaults()
		  declare sub resetStandardUserDefaults_ lib FoundationLib selector "resetStandardUserDefaults" (clsRef as ptr)
		  resetStandardUserDefaults_(ClassRef)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBoolForKey(value as Boolean, defaultName as CFStringRef)
		  declare sub setBool_ lib FoundationLib selector "setBool:forKey:" (obj_id as ptr, value as Boolean, defaultName as CFStringRef)
		  setBool_(self, value, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDoubleForKey(value as Double, defaultName as CFStringRef)
		  declare sub setDouble_ lib FoundationLib selector "setDouble:forKey:" (obj_id as ptr, value as Double, defaultName as CFStringRef)
		  setDouble_(self, value, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIntegerForKey(value as Integer, defaultName as CFStringRef)
		  declare sub setInteger_ lib FoundationLib selector "setInteger:forKey:" (obj_id as ptr, value as Integer, defaultName as CFStringRef)
		  setInteger_(self, value, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetObjectForKey(value as NSobject, defaultName as CFStringRef)
		  declare sub setObject_ lib FoundationLib selector "setObject:forKey:" (obj_id as ptr, value as ptr, defaultName as CFStringRef)
		  setObject_(self, value, defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPersistentDomainForName(domain as NSDictionary, domainName as CFStringRef)
		  declare sub setPersistentDomain_ lib FoundationLib selector "setPersistentDomain:forName:" (obj_id as ptr, domain as ptr, domainName as CFStringRef)
		  setPersistentDomain_(self, domain, domainName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTextForKey(value as text, defaultName as CFStringRef)
		  dim s as new NSString(value)
		  SetObjectForKey(s,defaultName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVolatileDomainForName(domain as NSDictionary, domainName as CFStringRef)
		  declare sub setVolatileDomain_ lib FoundationLib selector "setVolatileDomain:forName:" (obj_id as ptr, domain as ptr, domainName as CFStringRef)
		  setVolatileDomain_(self, domain, domainName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StandardUserDefaults() As NSUserDefaults
		  declare function standardUserDefaults_ lib FoundationLib selector "standardUserDefaults" (clsRef as ptr) as ptr
		  Return new NSUserDefaults(standardUserDefaults_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringArrayForKey(defaultName as CFStringRef) As NSArray
		  declare function stringArrayForKey_ lib FoundationLib selector "stringArrayForKey:" (obj_id as ptr, defaultName as CFStringRef) as ptr
		  Return new NSArray(stringArrayForKey_(self, defaultName))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringForKey(defaultName as CFStringRef) As CFStringRef
		  declare function stringForKey_ lib FoundationLib selector "stringForKey:" (obj_id as ptr, defaultName as CFStringRef) as CFStringRef
		  Return stringForKey_(self, defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Synchronize() As Boolean
		  declare function synchronize_ lib FoundationLib selector "synchronize" (obj_id as ptr) as Boolean
		  Return synchronize_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextForKey(defaultName as CFStringRef) As Text
		  Return StringForKey(defaultName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VolatileDomainForName(domainName as CFStringRef) As NSDictionary
		  declare function volatileDomainForName_ lib FoundationLib selector "volatileDomainForName:" (obj_id as ptr, domainName as CFStringRef) as ptr
		  Return new NSDictionary(volatileDomainForName_(self, domainName))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function volatileDomainNames_ lib FoundationLib selector "volatileDomainNames" (obj_id as ptr) as ptr
			  Return new NSArray(volatileDomainNames_(self))
			End Get
		#tag EndGetter
		volatileDomainNames As NSArray
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
