#tag Class
Class UIColor
Inherits NSObject
	#tag Method, Flags = &h0, Description = 52657475726E732061204347436F6C6F7220726570726573656E746174696F6E206F6620746865205549436F6C6F72
		Function CGColor() As Ptr
		  
		  Declare Function cgcolor Lib UIKitLib selector "cgColor" (obj_id As ptr) as ptr
		  Return CGColor(self)
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function ClassMethodDelegate(class_id as Ptr) As Ptr
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function ClearColor() As UIColor
		  
		  
		  return MakeObjectFromClassMethod(AddressOf m_clearColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorValue() As Color
		  //jly: Fixed. Now returns the correct color with alpha value
		  declare function getComponents lib UIKitLib selector "getRed:green:blue:alpha:" (obj_id as ptr, byref red as Double, byref green as Double, byref blue as Double, byref alpha as Double) as Boolean
		  dim r, g, b, a as Double
		  dim success as Boolean = getComponents(self, r,g,b,a)
		  if success then
		    Return Color.RGBA(r*255,g*255,b*255, 255*(1-a))
		  end if
		  Break
		  Return Color.Black
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(fromColor as Color)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  self.Constructor(fromColor.red,fromColor.Green, fromColor.Blue, fromColor.Alpha)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(red as Integer, green as integer, blue as Integer, alpha as Integer)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  #if Target32Bit
		    declare function initWithComponents lib UIKitLib selector "initWithRed:green:blue:alpha:" _
		    (obj_id as ptr, red as single, green as Single, blue as Single, alpha as Single) as ptr
		  #elseif Target64Bit
		    declare function initWithComponents lib UIKitLib selector "initWithRed:green:blue:alpha:" _
		    (obj_id as ptr, red as Double, green as Double, blue as Double, alpha as Double) as ptr
		  #Endif
		  
		  Super.Constructor(initWithComponents(Allocate(NSClassFromString("UIColor")),red/255,green/255,blue/255,(255-alpha)/255))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Cyan() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_cyanColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DarkGray() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_darkGrayColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Gray() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_grayColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Green() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_greenColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LightGray() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_lightGrayColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Magenta() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_magentaColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeObjectFromClassMethod(d as ClassMethodDelegate) As UIColor
		  
		  return new UIColor(d.Invoke(NSClassFromString("UIColor")))
		  
		  #pragma unused d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_blackColor(class_id as Ptr) As Ptr
		  
		  declare function blackColor lib UIKitLib selector "blackColor" (id as Ptr) as Ptr
		  
		  return blackColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_blueColor(class_id as Ptr) As Ptr
		  
		  declare function blueColor lib UIKitLib selector "blueColor" (id as Ptr) as Ptr
		  
		  return blueColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_brownColor(class_id as Ptr) As Ptr
		  
		  declare function brownColor lib UIKitLib selector "brownColor" (id as Ptr) as Ptr
		  
		  return brownColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_clearColor(class_id as Ptr) As Ptr
		  
		  declare function clearColor lib UIKitLib selector "clearColor" (id as Ptr) as Ptr
		  
		  return clearColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_cyanColor(class_id as Ptr) As Ptr
		  
		  declare function cyanColor lib UIKitLib selector "cyanColor" (id as Ptr) as Ptr
		  
		  return cyanColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_darkGrayColor(class_id as Ptr) As Ptr
		  
		  declare function darkGrayColor lib UIKitLib selector "darkGrayColor" (id as Ptr) as Ptr
		  
		  return darkGrayColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_grayColor(class_id as Ptr) As Ptr
		  
		  declare function grayColor lib UIKitLib selector "grayColor" (id as Ptr) as Ptr
		  
		  return grayColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_greenColor(class_id as Ptr) As Ptr
		  
		  declare function greenColor lib UIKitLib selector "greenColor" (id as Ptr) as Ptr
		  
		  return greenColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_lightGrayColor(class_id as Ptr) As Ptr
		  
		  declare function lightGrayColor lib UIKitLib selector "lightGrayColor" (id as Ptr) as Ptr
		  
		  return lightGrayColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_magentaColor(class_id as Ptr) As Ptr
		  
		  declare function magentaColor lib UIKitLib selector "magentaColor" (id as Ptr) as Ptr
		  
		  return magentaColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_orangeColor(class_id as Ptr) As Ptr
		  
		  declare function orangeColor lib UIKitLib selector "orangeColor" (id as Ptr) as Ptr
		  
		  return orangeColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_purpleColor(class_id as Ptr) As Ptr
		  
		  declare function purpleColor lib UIKitLib selector "purpleColor" (id as Ptr) as Ptr
		  
		  return purpleColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_redColor(class_id as Ptr) As Ptr
		  
		  declare function redColor lib UIKitLib selector "redColor" (id as Ptr) as Ptr
		  
		  return redColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_whiteColor(class_id as Ptr) As Ptr
		  
		  declare function whiteColor lib UIKitLib selector "whiteColor" (id as Ptr) as Ptr
		  
		  return whiteColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_yellowColor(class_id as Ptr) As Ptr
		  
		  declare function yellowColor lib UIKitLib selector "yellowColor" (id as Ptr) as Ptr
		  
		  return yellowColor(class_id)
		  
		  
		  #pragma unused class_id
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Orange() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_orangeColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Purple() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_purpleColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Red() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_redColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function White() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_whiteColor)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Yellow() As UIColor
		  
		  return MakeObjectFromClassMethod(AddressOf m_yellowColor)
		  
		End Function
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
