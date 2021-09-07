#tag Class
Protected Class UIFontPickerViewController
Inherits UIKit.UINavigationController
	#tag Method, Flags = &h1000
		Sub Constructor(includeFaces As Boolean = False, displayUsingSystemFont As Boolean = False)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  
		  
		  'func showFontPicker(_ sender: Any) {
		  'let fontConfig = UIFontPickerViewController.Configuration()
		  'fontConfig.includeFaces = true
		  'let fontPicker = UIFontPickerViewController(configuration: fontConfig)
		  'fontPicker.delegate = self
		  'self.present(fontPicker, animated: true, completion: nil)
		  '}
		  
		  self.mdisplayUsingSystemFont = displayUsingSystemFont
		  self.mincludeFaces = includeFaces
		  
		  //Creating fontPicker configuration object
		  Dim fontConfig As ptr = Initialize(Allocate(NSClassFromString("UIFontPickerViewControllerConfiguration")))
		  Declare sub displayUsingSystemFont_ lib UIKitLib selector "setDisplayUsingSystemFont:" (obj as ptr, value as Boolean)
		  Declare sub includeFaces_ lib UIKitLib selector "setIncludeFaces:" (obj as ptr, value as Boolean)
		  
		  displayUsingSystemFont_(fontConfig, displayUsingSystemFont)
		  includeFaces_(fontConfig, includeFaces)
		  
		  Declare function initWithConfiguration lib UIKitLib selector "initWithConfiguration:" (obj as ptr, config as ptr) as ptr
		  Declare Sub setDelegate Lib UIKitLib selector "setDelegate:" (obj_id As ptr, del As ptr)
		  
		  Super.Constructor(initWithConfiguration(Allocate(NSClassFromString("UIFontPickerViewController")), fontConfig))
		  
		  dim del as ptr = Initialize(Allocate(TargetClass))
		  setDelegate(self, del)
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(del) = xojo.core.WeakRef.Create(self)
		  
		  
		  needsExtraRelease = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidPickFont()
		  
		  Declare function selectedFontDescriptor lib UIKitLib selector "selectedFontDescriptor" (obj as ptr) as ptr
		  
		  
		  Dim selectedFont As Ptr = selectedFontDescriptor(self)
		  
		  RaiseEvent DidPickFont(selectedFont)
		  
		  'self.DismissViewControllerAnimatedCompletion(True, nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didPickFont(pid as ptr, sel as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UIFontPickerViewController(w.Value).HandleDidPickFont()
		  end if
		  
		  
		  #Pragma Unused sel
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IsAvailable() As Boolean
		  
		  Dim sSystemVersion As Double
		  
		  //Get sSystemVersion only once
		  If sSystemVersion = 0.0 Then
		    
		    Declare Function currentDevice_ Lib UIKitLib selector "currentDevice" (clsRef As ptr) As ptr
		    Declare Function systemversion_ Lib UIKitLib selector "systemVersion" (obj_id As ptr) As CFStringRef
		    Dim device As Ptr = currentDevice_(NSClassFromString("UIDevice"))
		    Dim systemVersion As Text = systemversion_(device)
		    
		    Try
		      sSystemVersion = Double.FromText(systemVersion)
		    Catch
		    End Try
		    
		  End If
		  
		  if sSystemVersion >= 13.0 then Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53686F77732074686520466F6E745069636B6572
		Sub PresentInView(mView As iOSView, completion As iOSBlock = nil)
		  declare sub presentViewController lib UIKitLib selector "presentViewController:animated:completion:" _
		  (obj_id as ptr, controller as ptr, animated as Boolean, completion as ptr)
		  
		  if completion <> nil then
		    presentViewController(mView.ViewControllerHandle, self, True, completion.Handle)
		  else
		    presentViewController(mView.ViewControllerHandle, self, True, nil)
		  end if
		  
		  mparentViewController = mView //get a reference to dismiss ourself
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("fontPickerViewControllerDidPickFont:", AddressOf impl_didPickFont, "v@:@")
		    targetID = BuildTargetClass("NSObject","UIFontPickerViewControllerDelegate",methods)
		  end if
		  Return targetID
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidPickFont(fontDescriptor As Ptr)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdisplayUsingSystemFont
			End Get
		#tag EndGetter
		displayUsingSystemFont As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mincludeFaces
			End Get
		#tag EndGetter
		includeFaces As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21, Description = 53657420746869732070726F706572747920746F2059455320696620796F752077616E742074686520666F6E74207069636B657220746F20646973706C617920616C6C20666F6E74206E616D657320696E207468652073797374656D20666F6E742E
		Private mdisplayUsingSystemFont As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 44657465726D696E657320776865746865722074686520666F6E74207069636B65722073686F756C6420616C6C6F7720746865207573657220746F2073656C6563742066726F6D20666F6E742066616365732C206F72206A75737420666F6E742066616D696C6965732E
		Private mincludeFaces As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mparentViewController As iOSView
	#tag EndProperty


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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="displayUsingSystemFont"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="includeFaces"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
