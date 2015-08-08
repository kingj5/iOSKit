#tag Module
Protected Module KeychainServices
	#tag Method, Flags = &h1
		Protected Sub AddPassword(item as KeychainServices.JK_KeychainItem, password as Text)
		  Delete(item)
		  dim dictRef as ptr = QueryDictionary(item)
		  const NSUTF8StringEncoding  = 4
		  declare function dataUsingEncoding lib FoundationLib selector "dataUsingEncoding:" (obj_id as ptr, encoding as Integer) as ptr
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  declare function stringWithString lib FoundationLib selector "stringWithString:" (clsRef as ptr, str as CFStringRef) as ptr
		  declare sub setObjectForKey lib FoundationLib selector "setObject:forKey:" (obj_id as ptr, obj as ptr, key as CFStringRef)
		  setObjectForKey(dictRef, dataUsingEncoding(stringWithString(NSClassFromString("NSString"), password), NSUTF8StringEncoding), kSecValueData)
		  
		  dim result as CFTypeRef
		  dim status as Integer = SecItemAdd(dictRef, result)
		  
		  #Pragma Unused status
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Delete(item as KeychainServices.JK_KeychainItem)
		  declare sub setObjectForKey lib FoundationLib selector "setObject:forKey:" (obj_id as ptr, obj as CFStringRef, key as CFStringRef)
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as Ptr) as ptr
		  declare function init lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  dim dictRef as ptr = init(alloc(NSClassFromString("NSMutableDictionary")))
		  
		  setObjectForKey(dictRef, kSecClassGenericPassword, kSecClass)
		  
		  if not item.ServiceName.Empty then
		    setObjectForKey(dictRef, item.ServiceName, kSecAttrService)
		  end if
		  
		  dim status as Integer = SecItemDelete(dictRef)
		  
		  #Pragma Unused status
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindPassword(byref item as KeychainServices.JK_KeychainItem) As Text
		  dim serviceName as Text = item.ServiceName
		  dim dictRef as ptr = QueryDictionary(item)
		  declare sub setObjectForKey lib FoundationLib selector "setObject:forKey:" (obj_id as ptr, obj as CFStringRef, key as CFStringRef)
		  declare sub setObjectForKey lib FoundationLib selector "setObject:forKey:" (obj_id as ptr, obj as ptr, key as CFStringRef)
		  
		  Declare Function numberWithBool lib FoundationLib selector "numberWithBool:" (clsRef as ptr,value as Boolean) as ptr
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  
		  setObjectForKey(dictRef, numberWithBool(NSClassFromString("NSNumber"), true), SecurityConst("kSecReturnData"))
		  setObjectForKey(dictRef, kSecMatchLimitOne, kSecMatchLimit)
		  
		  dim result as CFTypeRef
		  dim status as Integer = SecItemCopyMatching(dictRef, result)
		  
		  if status = errSecSuccess then
		    const NSUTF8StringEncoding  = 4
		    declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		    declare function alloc lib FoundationLib selector "alloc" (clsRef as Ptr) as ptr
		    declare function initWithDataEncoding lib FoundationLib selector "initWithData:encoding:" (obj_id as ptr, data as ptr, encoding as Integer) as CFStringRef
		    dim pswd as Text = initWithDataEncoding(alloc(NSClassFromString("NSString")), result.value, NSUTF8StringEncoding)
		    
		    
		    //////////////
		    declare sub setObjectForKey lib FoundationLib selector "setObject:forKey:" (obj_id as ptr, obj as CFStringRef, key as CFStringRef)
		    declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		    declare function init lib FoundationLib selector "init" (obj_id as ptr) as ptr
		    dictRef = init(alloc(NSClassFromString("NSMutableDictionary")))
		    //////////////
		    setObjectForKey(dictRef, serviceName, kSecAttrService)
		    
		    setObjectForKey(dictRef, kSecClassGenericPassword, kSecClass)
		    
		    setObjectForKey(dictRef, numberWithBool(NSClassFromString("NSNumber"), true), SecurityConst("kSecReturnAttributes"))
		    
		    status = SecItemCopyMatching(dictRef, result)
		    if status = errSecSuccess then
		      dictRef = result.value
		      
		      item = KeychainItemForDictionary(dictRef)
		    end if
		    Return pswd
		  else
		    'dim r as new RuntimeException
		    'r.Reason = "An error occurred retrieving the password.  Error code: " + status.ToText
		    'Raise r
		    Return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function KeychainItemForDictionary(dictRef as ptr) As KeychainServices.JK_KeychainItem
		  dim result as new KeychainServices.JK_KeychainItem
		  
		  declare function objectForKey lib FoundationLib selector "objectForKey:" (obj_id as ptr, key as CFStringRef) as ptr
		  declare function self_ lib FoundationLib selector "self" (obj_id as ptr) as CFStringRef
		  
		  dim tmp as ptr = objectForKey(dictRef, kSecAttrAccount)
		  if tmp <> nil then result.AccountName = self_(tmp)
		  
		  tmp = objectForKey(dictRef, kSecAttrComment)
		  if tmp <> nil then result.Comment = self_(tmp)
		  
		  tmp = objectForKey(dictRef, kSecAttrDescription)
		  if tmp <> nil then result.Description =self_(tmp)
		  
		  tmp = objectForKey(dictRef, kSecAttrLabel)
		  if tmp <> nil then result.Label = self_(tmp)
		  
		  tmp = objectForKey(dictRef, kSecAttrService)
		  if tmp <> nil then result.ServiceName = self_(tmp)
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function QueryDictionary(item as KeychainServices.JK_KeychainItem) As ptr
		  declare sub setObjectForKey lib FoundationLib selector "setObject:forKey:" (obj_id as ptr, obj as CFStringRef, key as CFStringRef)
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as Ptr) as ptr
		  declare function init lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  dim dictRef as ptr = init(alloc(NSClassFromString("NSMutableDictionary")))
		  
		  setObjectForKey(dictRef, kSecClassGenericPassword, kSecClass)
		  
		  if not item.accountName.Empty then
		    setObjectForKey(dictRef, item.AccountName, kSecAttrAccount)
		  end if
		  if not item.Comment.Empty then
		    setObjectForKey(dictRef, item.Comment, kSecAttrComment)
		  end if
		  if not item.Description.Empty then
		    setObjectForKey(dictRef, item.Description, kSecAttrDescription)
		  end if
		  if not item.Label.Empty then
		    setObjectForKey(dictRef, item.Label, kSecAttrLabel)
		  end if
		  if not item.ServiceName.Empty then
		    setObjectForKey(dictRef, item.ServiceName, kSecAttrService)
		  end if
		  
		  Return dictRef
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SecItemAdd Lib SecurityLib (query as ptr, byref result as CFTypeRef) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SecItemCopyMatching Lib SecurityLib (query as ptr, byref result as CFTypeRef) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SecItemDelete Lib SecurityLib (query as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SecItemUpdate Lib SecurityLib (query as ptr, attributesToUpdate as Ptr) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Private Function SecurityConst(constName as Text) As Text
		  Return StrConstant("Security", constName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StrConstant(frameworkName as Text, constName as Text) As Text
		  Declare Function dlopen Lib "/usr/lib/libSystem.dylib" ( path As CString, mode As Int32 ) As Ptr
		  Declare Function dlsym Lib "/usr/lib/libSystem.dylib" ( handle As Ptr, name As CString ) As ptr
		  
		  Const RTLD_LAZY = 1
		  Const RTLD_GLOBAL = 8
		  
		  dim path as Text =  "/System/Library/Frameworks/" + frameworkName + ".framework/" + frameworkName
		  Dim libPtr As ptr = dlopen(path.ToCString(xojo.core.TextEncoding.UTF8), RTLD_LAZY Or RTLD_GLOBAL )
		  
		  
		  If libPtr <> Nil Then
		    dim constPtr as Ptr = dlsym(libPtr, constName.ToCString(xojo.core.TextEncoding.UTF8))
		    Return constPtr.CFStringRef(0)
		  end if
		  Return ""
		End Function
	#tag EndMethod


	#tag Constant, Name = errSecAllocate, Type = Double, Dynamic = False, Default = \"-108", Scope = Private
	#tag EndConstant

	#tag Constant, Name = errSecAuthFailed, Type = Double, Dynamic = False, Default = \"-25293", Scope = Private
	#tag EndConstant

	#tag Constant, Name = errSecDecode, Type = Double, Dynamic = False, Default = \"-26275", Scope = Private
	#tag EndConstant

	#tag Constant, Name = errSecDuplicateItem, Type = Double, Dynamic = False, Default = \"-25299", Scope = Private
	#tag EndConstant

	#tag Constant, Name = errSecInteractionNotAllowed, Type = Double, Dynamic = False, Default = \"-25308", Scope = Private
	#tag EndConstant

	#tag Constant, Name = errSecItemNotFound, Type = Double, Dynamic = False, Default = \"-25300", Scope = Private
	#tag EndConstant

	#tag Constant, Name = errSecParam, Type = Double, Dynamic = False, Default = \"-50", Scope = Private
	#tag EndConstant

	#tag Constant, Name = errSecSuccess, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = errSecUnimplemented, Type = Double, Dynamic = False, Default = \"-4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FoundationLib, Type = Text, Dynamic = False, Default = \"Foundation.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCFBooleanFalse, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCFBooleanTrue, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecAttrAccount, Type = Text, Dynamic = False, Default = \"acct", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecAttrComment, Type = Text, Dynamic = False, Default = \"icmt", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecAttrDescription, Type = Text, Dynamic = False, Default = \"desc", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecAttrLabel, Type = Text, Dynamic = False, Default = \"labl", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecAttrService, Type = Text, Dynamic = False, Default = \"svce", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecClass, Type = Text, Dynamic = False, Default = \"class", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecClassCertificate, Type = Text, Dynamic = False, Default = \"cert", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecClassGenericPassword, Type = Text, Dynamic = False, Default = \"genp", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecClassIdentity, Type = Text, Dynamic = False, Default = \"idnt", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecClassKey, Type = Text, Dynamic = False, Default = \"keys", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecMatchLimit, Type = Text, Dynamic = False, Default = \"m_Limit", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecMatchLimitOne, Type = Text, Dynamic = False, Default = \"m_LimitOne", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecReturnData, Type = Text, Dynamic = False, Default = \"r_Data", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecReturnRef, Type = Text, Dynamic = False, Default = \"r_Ref", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSecValueData, Type = Text, Dynamic = False, Default = \"v_Data", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SecurityLib, Type = Text, Dynamic = False, Default = \"Security.framework", Scope = Private
	#tag EndConstant


	#tag Structure, Name = CFTypeRef, Flags = &h21
		value as Ptr
	#tag EndStructure


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
End Module
#tag EndModule
