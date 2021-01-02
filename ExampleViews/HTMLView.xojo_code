#tag IOSView
Begin iosView HTMLView
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "HTML Viewer"
   Top             =   0
   Begin iOSHTMLViewer HTMLViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   HTMLViewer1, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   HTMLViewer1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   HTMLViewer1, 2, <Parent>, 2, False, +1.00, 4, 1, -0, , True
      AutoLayout      =   HTMLViewer1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      Height          =   503.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
      Begin iOSProgressWheel ProgressWheel1
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   ProgressWheel1, 7, , 0, True, +1.00, 4, 1, 24, , True
         AutoLayout      =   ProgressWheel1, 9, HTMLViewer1, 9, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   ProgressWheel1, 10, HTMLViewer1, 10, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   ProgressWheel1, 8, , 0, True, +1.00, 4, 1, 24, , True
         Height          =   24.0
         Left            =   148
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "HTMLViewer1"
         Scope           =   0
         Shade           =   0
         Top             =   304
         Visible         =   False
         Width           =   24.0
      End
   End
   Begin WebKit.WKNavigationDelegate WKWebViewDelegate
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   0
      Top             =   0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  
		  #If XojoVersion >= 2018.02
		    
		    
		    Declare Sub setDelegate Lib UIKitLib selector "setNavigationDelegate:" (obj_id As ptr, del As ptr)
		    setDelegate(HTMLViewer1.Handle, WKWebViewDelegate)
		    
		    
		  #EndIf
		  
		  
		  
		  
		  HTMLViewer1.LoadURL( "https://www.xojo.com/")
		  
		  
		  '
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function urlencode(url As Text) As Text
		  // Remove newline characters.
		  url = url.ReplaceAll ( &u0A, "" )
		  
		  // Make substitutions...
		  url = url.ReplaceAll ( "%", "%25" )
		  url = url.ReplaceAll ( " ", "%20" )
		  url = url.ReplaceAll ( "!", "%21" )
		  url = url.ReplaceAll ( """", "%22" )
		  url = url.ReplaceAll ( "#", "%23" )
		  url = url.ReplaceAll ( "$", "%24" )
		  url = url.ReplaceAll ( "&", "%26" )
		  url = url.ReplaceAll ( "'", "%27" )
		  url = url.ReplaceAll ( "( ", "%28" )
		  url = url.ReplaceAll ( ")", "%29" )
		  url = url.ReplaceAll ( "*", "%2A" )
		  url = url.ReplaceAll ( "+", "%2B" )
		  url = url.ReplaceAll ( ",", "%2C" )
		  url = url.ReplaceAll ( "-", "%2D" )
		  url = url.ReplaceAll ( ".", "%2E" )
		  url = url.ReplaceAll ( "/", "%2F" )
		  url = url.ReplaceAll ( ":", "%3A" )
		  url = url.ReplaceAll ( ";", "%3B" )
		  url = url.ReplaceAll ( "<", "%3C" )
		  url = url.ReplaceAll ( "=", "%3D" )
		  url = url.ReplaceAll ( ">", "%3E" )
		  url = url.ReplaceAll ( "?", "%3F" )
		  url = url.ReplaceAll ( "@", "%40" )
		  url = url.ReplaceAll ( "[", "%5B" )
		  url = url.ReplaceAll ( "\\", "%5C" )
		  url = url.ReplaceAll ( "]", "%5D" )
		  url = url.ReplaceAll ( "^", "%5E" )
		  url = url.ReplaceAll ( "`", "%60" )
		  url = url.ReplaceAll ( "{", "%7B" )
		  url = url.ReplaceAll ( "|", "%7C" )
		  url = url.ReplaceAll ( "}", "%7D" )
		  
		  return url
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected progress As iOSProgressWheel
	#tag EndProperty


#tag EndWindowCode

#tag Events WKWebViewDelegate
	#tag Event
		Function CancelLoad(url as Text, userAction As Boolean) As Boolean
		  #pragma Unused userAction
		  
		  
		  
		  
		  if url.BeginsWith("data:text") then Return False
		  if url = "https://www.xojo.com/" then return false
		  if url = "about:blank" then Return False
		  if userAction = False then Return False
		  
		  call Extensions.OpenURL(url)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub DocumentBegin(navigation As ptr)
		  
		  ProgressWheel1.Visible = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub DocumentComplete(navigation as ptr)
		  
		  ProgressWheel1.Visible = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(errorCode as integer, errorMessage as Text)
		  
		  
		  MsgBox(errorMessage, "Error: " + errorCode.ToText)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="LargeTitleMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="NavigationBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
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
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
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
