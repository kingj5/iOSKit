#tag Class
Protected Class GKNotificationBanner
Inherits NSObject
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub BannerCompletionHandler()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKNotificationBanner")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ShowBannerWithTitleMessageCompletionHandler(title as Text, message as Text, completionHandler as BannerCompletionHandler)
		  declare sub showBannerWithTitle_ lib GameKitLib selector "showBannerWithTitle:message:completionHandler:" (clsRef as ptr, title as CFStringRef, message as CFStringRef, completionHandler as ptr)
		  if completionHandler <> nil then
		    dim blk as new iOSBlock(completionHandler)
		    showBannerWithTitle_(ClassRef, title, message, blk.Handle)
		  else
		    showBannerWithTitle_(ClassRef, title, message, nil)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ShowBannerWithTitleMessageDurationCompletionHandler(title as Text, message as Text, duration as double, completionHandler as BannerCompletionHandler)
		  declare sub showBannerWithTitle_ lib GameKitLib selector "showBannerWithTitle:message:duration:completionHandler:" (clsRef as ptr, title as CFStringRef, message as CFStringRef, duration as double, completionHandler as ptr)
		  if completionHandler <> nil Then
		    dim blk as new iOSBlock(completionHandler)
		    showBannerWithTitle_(ClassRef, title, message, duration, blk.Handle)
		  else
		    showBannerWithTitle_(ClassRef, title, message, duration, nil)
		  end if
		  
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
