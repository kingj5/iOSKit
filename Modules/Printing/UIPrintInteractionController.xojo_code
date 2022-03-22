#tag Class
Protected Class UIPrintInteractionController
Inherits Foundation.NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("UIPrintInteractionController")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub CompletionDelegate(printInteractionController as ptr, completed as Boolean, error as ptr)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function PresentAnimated(animated as Boolean, optional completion as CompletionDelegate) As Boolean
		  https://developer.apple.com/documentation/uikit/uiprintinteractioncontroller/1618149-presentanimated?language=objc
		  
		  
		  Declare function presentAnimated_ lib "UIKit" selector "presentAnimated:completionHandler:" (obj as ptr, animated as boolean, completion as ptr) as Boolean
		  
		  if completion <> nil then
		    Dim blk As new ObjCBlock(completion)
		    return presentAnimated_(self, animated, blk.Handle)
		    
		  else
		    return presentAnimated_(self, animated, nil)
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PresentFromBarButton(button as MobileToolbarButton, animated as Boolean, optional completion as CompletionDelegate) As Boolean
		  https://developer.apple.com/documentation/uikit/uiprintinteractioncontroller/1618149-presentanimated?language=objc
		  
		  
		  Declare function presentAnimated_ lib "UIKit" selector "presentFromBarButtonItem:animated:completionHandler:" (obj as ptr, bt as ptr, animated as boolean, completion as ptr) as Boolean
		  
		  if completion <> nil then
		    Dim blk As new ObjCBlock(completion)
		    return presentAnimated_(self, button.Handle, animated, blk.Handle)
		    
		  else
		    return presentAnimated_(self, button.Handle, animated, nil)
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function printingAvailable() As Boolean
		  
		  Declare function printingAvailable_ lib "UIKit" selector "isPrintingAvailable" (obj as ptr) as Boolean
		  
		  Return printingAvailable_(ClassRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrintFormatter(formatter as ptr)
		  
		  declare sub setPrintFormatter_ lib "UIKit" selector "setPrintFormatter:" (obj as ptr, value as ptr)
		  
		  SetPrintFormatter_(self, formatter)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 566965772063616E2062652061204D6F62696C6554657874417265612C204D6F62696C6548544D4C5669657765722C204D6F62696C654D6170566965776572
		Sub SetPrintFormatterView(view as MobileUIControl)
		  Declare function viewPrintFormatter lib "UIKit" selector "viewPrintFormatter" (obj as ptr) as ptr
		  
		  
		  Dim printFormatter As Ptr = viewPrintFormatter(view.Handle)
		  
		  self.SetPrintFormatter(printFormatter)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function sharedPrintController() As UIPrintInteractionController
		  
		  Declare function sharedPrintController_ lib "UIKit" Selector "sharedPrintController" (obj as ptr) as ptr
		  
		  Dim value As Ptr = sharedPrintController_(ClassRef)
		  
		  if value = nil then Return nil
		  
		  Return new UIPrintInteractionController(value)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  
			  Declare sub showsNumberOfCopies_ lib "UIKit" selector "setShowsNumberOfCopies:" (obj as ptr, value as Boolean)
			  
			  showsNumberOfCopies_(self, value)
			End Set
		#tag EndSetter
		showsNumberOfCopies As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  
			  Declare sub showsPaperOrientation_ lib "UIKit" selector "setShowsPaperOrientation:" (obj as ptr, value as Boolean)
			  
			  showsPaperOrientation_(self, value)
			End Set
		#tag EndSetter
		showsPaperOrientation As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 44656661756C742069732046616C7365
		#tag Setter
			Set
			  
			  Declare sub showsPaperSelectionForLoadedPapers_ lib "UIKit" selector "setShowsPaperSelectionForLoadedPapers:" (obj as ptr, value as Boolean)
			  
			  showsPaperSelectionForLoadedPapers_(self, value)
			End Set
		#tag EndSetter
		showsPaperSelectionForLoadedPapers As Boolean
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="showsNumberOfCopies"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="showsPaperSelectionForLoadedPapers"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="showsPaperOrientation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
