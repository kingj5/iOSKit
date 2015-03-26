#tag Class
Protected Class UIActivity
Inherits NSObject
	#tag Constant, Name = UIActivityTypeAddToReadingList, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.AddToReadingList", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypeAirDrop, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.AirDrop", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypeAssignToContact, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.AssignToContact", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypeCopyToPasteboard, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.CopyToPasteboard", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypeMail, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.Mail", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypeMessage, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.Message", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypePostToFacebook, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.PostToFacebook", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypePostToFlickr, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.PostToFlickr", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypePostToTencentWeibo, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.PostToTencentWeibo", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypePostToTwitter, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.PostToTwitter", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypePostToVimeo, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.PostToVimeo", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypePostToWeibo, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.PostToWeibo", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypePrint, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.Print", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIActivityTypeSaveToCameraRoll, Type = Text, Dynamic = False, Default = \"com.apple.UIKit.activity.SaveToCameraRoll", Scope = Public
	#tag EndConstant


	#tag Enum, Name = UIActivityCategory, Type = Integer, Flags = &h0
		Action = 0
		Share = 1
	#tag EndEnum


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
