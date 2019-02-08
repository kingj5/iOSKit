#tag Class
Protected Class UIDocumentPickerViewController
Inherits UIKit.UIViewController
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UIDocumentPickerViewController")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(allowedUTIs as NSArray, mode as UIDocumentPickerMode)
		  declare function initWithDocumentTypes_ lib UIKitLib selector "initWithDocumentTypes:inMode:" (obj_id as ptr, allowedUTIs as ptr, mode as UIDocumentPickerMode) as ptr
		  Super.Constructor( initWithDocumentTypes_(Allocate(ClassRef), allowedUTIs, mode) )
		  
		  dim target as Ptr = Initialize(Allocate(TargetClass))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(target) = xojo.Core.WeakRef.Create(self)
		  
		  del = Target
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url as NSURL, mode as UIDocumentPickerMode)
		  declare function initWithURL_ lib UIKitLib selector "initWithURL:inMode:" (obj_id as ptr, url as ptr, mode as UIDocumentPickerMode) as ptr
		  Super.Constructor( initWithURL_(Allocate(ClassRef), url, mode) )
		  
		  dim target as Ptr = Initialize(Allocate(TargetClass))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(target) = xojo.Core.WeakRef.Create(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandledocumentPickerdidPickDocumentAtURL(controller as UIDocumentPickerViewController, url as NSURL)
		  RaiseEvent DidPickDocument(url)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandledocumentPickerWasCancelled(controller as UIDocumentPickerViewController)
		  RaiseEvent Cancelled()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub impl_documentPickerdidPickDocumentAtURL(pid as ptr, sel as ptr, controller as ptr, url as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    UIDocumentPickerViewController(w.value).HandledocumentPickerdidPickDocumentAtURL(new UIDocumentPickerViewController(controller), new NSURL(url))
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub impl_documentPickerWasCancelled(pid as ptr, sel as ptr, controller as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if not(w.Value = nil) then
		    UIDocumentPickerViewController(w.value).HandledocumentPickerWasCancelled(new UIDocumentPickerViewController(controller))
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("documentPicker:didPickDocumentAtURL:", AddressOf impl_documentPickerdidPickDocumentAtURL, "v:@@")
		    methods.Append new TargetClassMethodHelper("documentPickerWasCancelled:", AddressOf impl_documentPickerWasCancelled, "v:@")
		    targetID = BuildTargetClass("NSObject","MyUIDocumentPickerDelegate",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Cancelled()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidPickDocument(url as NSURL)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function delegate_ lib UIKitLib selector "delegate" (obj_id as ptr) as ptr
			  Return (delegate_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub delegate_ lib UIKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
			  delegate_(self, value)
			End Set
		#tag EndSetter
		del As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function documentPickerMode_ lib UIKitLib selector "documentPickerMode" (obj_id as ptr) as UIDocumentPickerMode
			  Return (documentPickerMode_(self))
			End Get
		#tag EndGetter
		documentPickerMode As UIDocumentPickerMode
	#tag EndComputedProperty


	#tag Enum, Name = UIDocumentPickerMode, Type = UInteger, Flags = &h0
		Import
		  Open
		  ExportToService
		MoveToService
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="modalPresentationStyle"
			Group="Behavior"
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
			Name="automaticallyAdjustsScrollViewInsets"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="definesPresentationContext"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="documentPickerMode"
			Group="Behavior"
			Type="UIDocumentPickerMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Import"
				"1 - Open"
				"2 - ExportToService"
				"3 - MoveToService"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="editing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extendedLayoutIncludesOpaqueBars"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hidesBottomBarWhenPushed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="modalInPopover"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="modalPresentationCapturesStatusBarAppearance"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="providesPresentationContextTransitionStyle"
			Group="Behavior"
			Type="Boolean"
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
