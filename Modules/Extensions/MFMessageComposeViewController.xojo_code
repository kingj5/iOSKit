#tag Class
Protected Class MFMessageComposeViewController
Inherits UIKit.UINavigationController
	#tag Method, Flags = &h0
		Function addAttachment(attachment as xojo.IO.FolderItem, MIMEType as text, fileName as Text) As Boolean
		  declare function addAttachment_ lib MessageUIKitLib selector "addAttachmentData:mimeType:fileName:" _
		  (obj_id as ptr, data as ptr, MIMEType as CFStringRef, fileName as CFStringRef) as Boolean
		  return addAttachment_(self,NSDataFromFolderitem(attachment), MIMEType, fileName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function canSendAttachments() As Boolean
		  declare function canSendAttachments_ lib MessageUIKitLib selector "canSendAttachments" (clsRef as ptr) as Boolean
		  Return canSendAttachments_(NSClassFromString("MFMessageComposeViewController"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function canSendSubject() As Boolean
		  declare function canSendSubject_ lib MessageUIKitLib selector "canSendSubject" (clsRef as ptr) as Boolean
		  Return canSendSubject_(NSClassFromString("MFMessageComposeViewController"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function canSendText() As Boolean
		  declare function canSendText_ lib MessageUIKitLib selector "canSendText" (clsRef as ptr) as Boolean
		  Return canSendText_(NSClassFromString("MFMessageComposeViewController"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(NSClassFromString("MFMessageComposeViewController"))))
		  
		  dim del as ptr = Initialize(Allocate(TargetClass))
		  setDelegate(del)
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(del) = xojo.core.WeakRef.Create(self)
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disableUserAttachments()
		  
		  declare sub disableUserAttachments_ lib MessageUIKitLib selector "disableUserAttachments:" (obj_id as ptr)
		  disableUserAttachments_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub dismiss()
		  'declare sub dismissModalViewController lib UIKitLib selector "dismissViewControllerAnimated:completion:" _
		  '(obj_id as ptr, animated as Boolean, completion as ptr)
		  'dismissModalViewController(mparentViewController.ViewControllerHandle, True, Nil)
		  
		  declare sub dismissViewControllerAnimated_ lib UIKitLib selector "dismissViewControllerAnimated:completion:" (obj_id as ptr, flag as Boolean, completion as ptr)
		  dismissViewControllerAnimated_(self, True, nil)
		  
		  'mparentViewController = nil
		  Break
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub FinishDelegate(result As MessageComposeResult)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Sub HandleDidFinish(result As MessageComposeResult)
		  
		  
		  
		  try
		    if FinishCallback <> nil then
		      FinishCallback.Invoke(result)
		    end if
		  Catch
		  end try
		  
		  
		  dismiss
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didFinishWithResult(pid as ptr, sel as ptr, composer as ptr, result as MessageComposeResult)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    MFMessageComposeViewController(w.Value).HandleDidFinish(result)
		  end if
		  
		  
		  #Pragma Unused sel
		  #Pragma Unused composer
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(mView As iOSView, completion As iOSBlock = nil)
		  declare sub presentViewController lib UIKitLib selector "presentViewController:animated:completion:" _
		  (obj_id as ptr, controller as ptr, animated as Boolean, completion as ptr)
		  
		  
		  //Forcing full modal
		  'Declare sub setModalInPresentation lib "UIKit.framework" Selector "setModalInPresentation:" (obj_id as ptr, value as Boolean)
		  'setModalInPresentation(self, true)
		  
		  
		  if completion <> nil then
		    presentViewController(mView.ViewControllerHandle, self, True, completion.Handle)
		  else
		    presentViewController(mView.ViewControllerHandle, self, True, nil)
		  end if
		  
		  'mparentViewController = mView //get a reference to dismiss ourself
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PresentInView(mView As MobileScreen, completion As iOSBlock = nil)
		  declare sub presentViewController lib UIKitLib selector "presentViewController:animated:completion:" _
		  (obj_id as ptr, controller as ptr, animated as Boolean, completion as ptr)
		  
		  
		  //Forcing full modal
		  'Declare sub setModalInPresentation lib "UIKit.framework" Selector "setModalInPresentation:" (obj_id as ptr, value as Boolean)
		  'setModalInPresentation(self, true)
		  
		  
		  if completion <> nil then
		    presentViewController(mView.ViewControllerHandle, self, True, completion.Handle)
		  else
		    presentViewController(mView.ViewControllerHandle, self, True, nil)
		  end if
		  
		  'mparentViewController = mView //get a reference to dismiss ourself
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setDelegate(del as ptr)
		  declare sub setDelegate_ lib MessageUIKitLib selector "setMessageComposeDelegate:" (obj_id as ptr, del as ptr)
		  setDelegate_(self,del)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setMessage(msg as Text)
		  declare sub setMessage_ lib MessageUIKitLib selector "setBody:" (obj_id as ptr, msg as CFStringRef)
		  setMessage_(self, msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setRecipients(recipients() as Text)
		  declare sub setRecipients_ Lib MessageUIKitLib selector "setRecipients:" (obj_id as ptr, recip as ptr)
		  setRecipients_(self,NSArraryFromTextArray(recipients))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSubject(subject as Text)
		  declare sub setSubject_ lib MessageUIKitLib selector "setSubject:" (obj_id as ptr, subject as CFStringRef)
		  setSubject_(self,subject)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("messageComposeViewController:didFinishWithResult:", AddressOf impl_didFinishWithResult, "v@:@i")
		    targetID = BuildTargetClass("NSObject","MFMessageComposeDelegate",methods)
		  end if
		  Return targetID
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		FinishCallback As FinishDelegate
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mparentViewController_ As iOSView
	#tag EndProperty


	#tag Constant, Name = MessageUIKitLib, Type = Text, Dynamic = False, Default = \"MessageUI.framework", Scope = Public
	#tag EndConstant


	#tag Enum, Name = MessageComposeResult, Type = Integer, Flags = &h0
		cancelled = 0
		  sent
		failed
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="automaticallyAdjustsScrollViewInsets"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="definesPresentationContext"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="editing"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="extendedLayoutIncludesOpaqueBars"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="hidesBottomBarWhenPushed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalInPopover"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalPresentationCapturesStatusBarAppearance"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="providesPresentationContextTransitionStyle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalPresentationStyle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UIModalPresentationStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - Fullscreen"
				"1 - PageSheet"
				"2 - FormSheet"
				"3 - CurrentContext"
				"4 - Custom"
				"5 - OverFullScreen"
				"6 - OverCurrentContext"
				"7 - Popover"
				"-1 - None"
			#tag EndEnumValues
		#tag EndViewProperty
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
