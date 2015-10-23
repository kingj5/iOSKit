#tag Class
Protected Class AuthenticationHelper
	#tag Method, Flags = &h21
		Private Sub authenticateMethod(viewController as ptr, err as ptr)
		  if viewController <> nil then
		    authenticationViewController = viewController
		    NotificationCenter.MainCenter.PostNotification(GameKitNeedsToAuthenticateNotification, self)
		  else
		    if localPlayer.authenticated then
		      gameCenterIsEnabled = True
		      NotificationCenter.MainCenter.PostNotification(GameKitSucessfullyAuthenticatedNotification, self)
		    else
		      gameCenterIsEnabled = False
		      NotificationCenter.MainCenter.PostNotification(GameKitFailedToAuthenticateNotification, self)
		    end if
		  end if
		  
		  #Pragma Unused err
		  #Pragma warning "should we store the error somewhere?"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor()
		  mlocalPlayer = GameKit.GKLocalPlayer.LocalPlayer
		  //register listener
		  
		  Declare sub setAuthenticateHandler lib GameKitLib selector "setAuthenticateHandler:" (obj_id as ptr, handler as ptr) 
		  dim blk as new iOSBlock(AddressOf authenticateMethod)
		  setAuthenticateHandler(localPlayer, blk.Handle)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GameCenterEnabled() As Boolean
		  Return gameCenterIsEnabled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetInstance() As AuthenticationHelper
		  static helper as new AuthenticationHelper
		  Return helper
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NeedsToAuthenticate() As Boolean
		  Return (authenticationViewController <> nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentAuthenticationViewController(inView as iOSView)
		  if authenticationViewController <> nil then
		    declare sub presentViewController_ lib FoundationLib selector "presentViewController:animated:completion:" (obj_id as ptr, viewControllerToPresent as ptr, flag as Boolean, completion as ptr)
		    presentViewController_(inView.ViewControllerHandle, authenticationViewController, True, nil)
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private authenticationViewController As ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private gameCenterIsEnabled As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mlocalPlayer
			End Get
		#tag EndGetter
		localPlayer As GameKit.GKLocalPlayer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mlocalPlayer As GameKit.GKLocalPlayer
	#tag EndProperty


	#tag Constant, Name = GameKitFailedToAuthenticateNotification, Type = Text, Dynamic = False, Default = \"gkfailedAuth", Scope = Public
	#tag EndConstant

	#tag Constant, Name = GameKitNeedsToAuthenticateNotification, Type = Text, Dynamic = False, Default = \"gkneedsAuth", Scope = Public
	#tag EndConstant

	#tag Constant, Name = GameKitSucessfullyAuthenticatedNotification, Type = Text, Dynamic = False, Default = \"gksucceededAuth", Scope = Public
	#tag EndConstant


	#tag Using, Name = GameKit
	#tag EndUsing


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
