#tag Module
Protected Module Printing
	#tag Method, Flags = &h0
		Function printingAvailable() As Boolean
		  
		  Return UIPrintInteractionController.printingAvailable
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrintMapView(jobName As String, view As MobileMapViewer) As Boolean
		  
		  myPrintInfo = UIPrintInfo.GetInstance
		  myprintInfo.jobName = jobName
		  
		  myPrintInteractionController = UIPrintInteractionController.sharedPrintController
		  
		  
		  myPrintInteractionController.SetPrintFormatterView(view)
		  
		  
		  if myPrintInteractionController.PresentAnimated(true, AddressOf Result) then
		    
		    Return True
		    
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrintTextView(jobName As String, view As MobileTextArea) As Boolean
		  
		  myPrintInfo = UIPrintInfo.GetInstance
		  myprintInfo.jobName = jobName
		  
		  myPrintInteractionController = UIPrintInteractionController.sharedPrintController
		  
		  
		  myPrintInteractionController.SetPrintFormatterView(view)
		  
		  
		  if myPrintInteractionController.PresentAnimated(true, AddressOf Result) then
		    
		    Return True
		    
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrintWebView(jobName As String, view As iOSHTMLViewer) As Boolean
		  
		  myPrintInfo = UIPrintInfo.GetInstance
		  myprintInfo.jobName = jobName
		  
		  myPrintInteractionController = UIPrintInteractionController.sharedPrintController
		  
		  
		  Declare function viewPrintFormatter lib "UIKit" selector "viewPrintFormatter" (obj as ptr) as ptr
		  
		  Dim printFormatter As Ptr = viewPrintFormatter(view.Handle)
		  
		  myPrintInteractionController.SetPrintFormatter(printFormatter)
		  
		  
		  
		  
		  if myPrintInteractionController.PresentAnimated(true, AddressOf Result) then
		    
		    Return True
		    
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrintWebView(jobName As String, view As MobileHTMLViewer) As Boolean
		  
		  myPrintInfo = UIPrintInfo.GetInstance
		  myprintInfo.jobName = jobName
		  
		  myPrintInteractionController = UIPrintInteractionController.sharedPrintController
		  
		  
		  myPrintInteractionController.SetPrintFormatterView(view)
		  
		  
		  if myPrintInteractionController.PresentAnimated(true, AddressOf Result) then
		    
		    Return True
		    
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Result(printInteractionController as ptr, completed as Boolean, error as ptr)
		  
		  if error <> nil then
		    
		    Dim nserr as new Foundation.NSError(error)
		    
		    
		    MessageBox(nserr.localizedDescription)
		    
		  end if
		  
		  myPrintInfo = nil
		  myPrintInteractionController = nil
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		
		Provides basic printing capabilities from a MobileTextArea, MobileHTMLViewer, MobileMapViewer.
		
		Written by Jeremie Leroy.
		
		More features can be added upon request.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected myPrintInfo As UIPrintInfo
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myPrintInteractionController As UIPrintInteractionController
	#tag EndProperty


	#tag ViewBehavior
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
	#tag EndViewBehavior
End Module
#tag EndModule
