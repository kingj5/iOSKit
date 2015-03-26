#tag Module
Protected Module QRCode
	#tag Method, Flags = &h21
		Private Function Allocate(clsRef as ptr) As ptr
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  Return alloc(clsRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CGImageFrom(CIImageRef as ptr) As Ptr
		  declare function contextWithOptions lib CoreImageLib selector "contextWithOptions:" (clsRef as ptr, options as ptr) as ptr
		  dim CIContextRef as ptr = contextWithOptions(NSClassFromString("CIContext"),nil)
		  
		  #if Target32Bit
		    declare function createCGImage lib CoreGraphicsLib selector "createCGImage:fromRect:" (obj_id as ptr, image as ptr, rect as CGRect32) as ptr
		    declare function extent lib CoreImageLib selector "extent" (obj_id as ptr) as CGRect32
		  #Elseif Target64Bit
		    declare function createCGImage lib CoreGraphicsLib selector "createCGImage:fromRect:" (obj_id as ptr, image as ptr, rect as CGRect64) as ptr
		    declare function extent lib CoreImageLib selector "extent" (obj_id as ptr) as CGRect64
		  #Endif
		  
		  dim CGImageRef as ptr = createCGImage(CIContextRef,CIImageRef, extent(CIImageRef))
		  
		  Return CGImageRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CIImage(img as iOSImage) As Ptr
		  declare function initWithImage_ lib CoreImageLib selector "initWithImage:" (obj_id as ptr, image as ptr) as ptr
		  Return initWithImage_(Allocate(NSClassFromString("CIImage")),img.Handle)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Create(msg as Text, desiredWidthAndHeight as integer = 200) As iOSImage
		  dim NSStringRef as ptr = NSStringFrom(msg)
		  
		  declare function length lib FoundationLib selector "length" (obj_id as ptr) as Integer
		  if length(NSStringRef) = 0 then Return nil
		  
		  declare function dataUsingEncoding lib FoundationLib selector "dataUsingEncoding:" (obj_id as ptr, enc as Integer) as ptr
		  const UTF8Encoding = 4
		  dim NSDataRef as ptr = dataUsingEncoding(NSStringRef,UTF8Encoding)
		  if length(NSDataRef) = 0 then Return nil
		  
		  dim CIFilterRef as ptr = GetCIFilter
		  
		  declare sub setValueForKey lib CoreImageLib selector "setValue:forKey:" (obj_id as ptr, val as ptr, key as CFStringRef)
		  declare sub setValueForKey lib CoreImageLib selector "setValue:forKey:" (obj_id as ptr, val as CFStringRef, key as CFStringRef)
		  setValueForKey(CIFilterRef,NSDataRef,"inputMessage")
		  setValueForKey(CIFilterRef,"H","inputCorrectionLevel")
		  
		  declare function outputImage lib CoreImageLib selector "outputImage" (obj_id as ptr) as ptr
		  dim CIImageRef as ptr = outputImage(CIFilterRef)
		  
		  dim CGImageRef as ptr = CGImageFrom(CIImageRef)
		  
		  dim UIImageRef as ptr = UIImageFrom(CGImageRef)
		  
		  dim resizedImage as ptr = Resize(UIImageRef,6.0)
		  
		  #if Target32Bit
		    declare function size lib UIKitLib selector "size" (obj_id as ptr) as CGSize32
		    dim sz as CGSize32 = size(UIImageRef)
		  #Elseif Target64Bit
		    declare function size lib UIKitLib selector "size" (obj_id as ptr) as CGSize64
		    dim sz as CGSize64 = size(UIImageRef)
		  #Endif
		  
		  if sz.w < desiredWidthAndHeight then
		    resizedImage = Resize(UIImageRef,desiredWidthAndHeight/sz.w)
		  else
		    resizedImage = UIImageRef
		  end if
		  
		  Return iOSImage.FromHandle(resizedImage)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCIDetector() As Ptr
		  declare function detectorOfType_ lib CoreImageLib selector "detectorOfType:context:options:" (clsRef as ptr, type as CFStringRef, context as ptr, options as ptr) as ptr
		  Return detectorOfType_(NSClassFromString("CIDetector"), "CIDetectorTypeQRCode", nil, OptionsDictionary)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCIFilter() As Ptr
		  declare function filterWithName lib CoreImageLib selector "filterWithName:" (clsRef as ptr, name as CFStringRef) as ptr
		  dim CIFilterRef as ptr = filterWithName(NSClassFromString("CIFilter"),"CIQRCodeGenerator")
		  
		  declare sub setDefaults lib CoreImageLib selector "setDefaults" (obj_id as ptr)
		  setDefaults(CIFilterRef)
		  
		  Return CIFilterRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NSStringFrom(str as Text) As Ptr
		  declare function stringWithString lib FoundationLib selector "stringWithString:" (clsRef as ptr, str as CFStringRef) as ptr
		  Return stringWithString(NSClassFromString("NSString"),str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OptionsDictionary() As Ptr
		  declare function dictionaryWithObjectForKey lib FoundationLib selector "dictionaryWithObject:forKey:"  _
		  (clsRef as ptr, obj as CFStringRef, key as CFStringRef) as ptr
		  Return dictionaryWithObjectForKey(NSClassFromString("NSDictionary"), "CIDetectorAccuracyHigh", "CIDetectorAccuracy")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Read(img as iOSImage) As Text
		  dim CIImageRef as ptr = CIImage(img)
		  dim CIDetectorRef as ptr = GetCIDetector
		  
		  declare function featuresInImage_ lib CoreImageLib selector "featuresInImage:" (obj_id as ptr, image as ptr) as ptr
		  dim featuresArray as ptr = featuresInImage_(CIDetectorRef,CIImageRef)
		  
		  declare function count lib FoundationLib selector "count" (obj_id as ptr) as Integer
		  dim cnt as Integer = count(featuresArray)
		  
		  declare function objectAtIndex lib FoundationLib selector "objectAtIndex:" (obj_id as ptr, idx as Integer) as ptr
		  dim msg as Text = ""
		  if cnt > 0 then
		    dim QRFeature as ptr = objectAtIndex(featuresArray,0)
		    
		    declare function messageString lib CoreImageLib selector "messageString" (obj_id as ptr) as CFStringRef
		    msg = messageString(QRFeature)
		  end if
		  Return msg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Resize(UIImageRef as ptr, scaleFactor as Double) As Ptr
		  #if Target32Bit
		    declare function size lib UIKitLib selector "size" (obj_id as ptr) as CGSize32
		    dim sz as CGSize32 = size(UIImageRef)
		    dim newSize as CGSize32
		  #Elseif Target64Bit
		    declare function size lib UIKitLib selector "size" (obj_id as ptr) as CGSize64
		    dim sz as CGSize64 = size(UIImageRef)
		    dim newSize as CGSize64
		  #Endif
		  
		  newSize.w = sz.w * scaleFactor
		  newSize.h = sz.h * scaleFactor
		  
		  #if Target32Bit
		    declare sub UIGraphicsBeginImageContext lib UIKitLib (mSize as CGSize32)
		  #Elseif Target64Bit
		    declare sub UIGraphicsBeginImageContext lib UIKitLib (mSize as CGSize64)
		  #Endif
		  UIGraphicsBeginImageContext(newSize)
		  
		  declare function UIGraphicsGetCurrentContext lib UIKitLib () as ptr
		  dim CGContextRef as ptr = UIGraphicsGetCurrentContext
		  
		  declare sub CGContextSetInterpolationQuality lib CoreGraphicsLib (context as ptr, quality as Integer)
		  const kCGInterpolationNone = 1
		  CGContextSetInterpolationQuality(CGContextRef, kCGInterpolationNone)
		  
		  #if Target32Bit
		    declare sub drawInRect lib UIKitLib selector "drawInRect:" (obj_id as ptr, rect as CGRect32)
		    dim r as CGRect32
		  #Elseif Target64Bit
		    declare sub drawInRect lib UIKitLib selector "drawInRect:" (obj_id as ptr, rect as CGRect64)
		    dim r as CGRect64
		  #Endif
		  
		  r.x = 0
		  r.y = 0
		  r.w = newSize.w
		  r.h = newSize.h
		  
		  drawInRect(UIImageRef,r)
		  
		  declare function UIGraphicsGetImageFromCurrentImageContext lib UIKitLib () as ptr
		  dim newUIImage as Ptr = UIGraphicsGetImageFromCurrentImageContext
		  
		  declare sub UIGraphicsEndImageContext lib UIKitLib ()
		  UIGraphicsEndImageContext
		  
		  Return newUIImage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UIImageFrom(CGImageRef as ptr) As Ptr
		  declare function imageWithCGImage lib UIKitLib selector "imageWithCGImage:scale:orientation:" _
		  (clsRef as ptr, CGImage as ptr, scale as Double, orientation as Integer) as ptr
		  const UIImageOrientationUp = 0
		  dim UIImageRef as ptr = imageWithCGImage(NSClassFromString("UIImage"), CGImageRef, 1.0, UIImageOrientationUp)
		  
		  Return UIImageRef
		End Function
	#tag EndMethod


	#tag Constant, Name = CoreGraphicsLib, Type = Text, Dynamic = False, Default = \"CoreGraphics.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CoreImageLib, Type = Text, Dynamic = False, Default = \"CoreImage.framework", Scope = Private
	#tag EndConstant


	#tag Structure, Name = CGRect32, Flags = &h21
		x as single
		  y as single
		  w as single
		h as single
	#tag EndStructure

	#tag Structure, Name = CGRect64, Flags = &h21
		x as double
		  y as double
		  w as double
		h as double
	#tag EndStructure

	#tag Structure, Name = CGSize32, Flags = &h21
		w as single
		h as single
	#tag EndStructure

	#tag Structure, Name = CGSize64, Flags = &h21
		w as double
		h as double
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
