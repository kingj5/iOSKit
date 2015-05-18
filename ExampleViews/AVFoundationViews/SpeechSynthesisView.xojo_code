#tag IOSView
Begin iosView SpeechSynthesisView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Text To Speech"
   Top             =   0
   Begin iOSTextArea TextArea1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TextArea1, 8, , 0, False, +1.00, 1, 1, 129, 
      AutoLayout      =   TextArea1, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   TextArea1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   TextArea1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      Editable        =   True
      Height          =   129.0
      KeyboardType    =   "0"
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   111
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Label1, 7, , 0, False, +1.00, 1, 1, 159, 
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Enter text to be spoken:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   159.0
   End
   Begin Extensions.PickerView PickerView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PickerView1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   PickerView1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   PickerView1, 8, , 0, False, +1.00, 1, 1, 118, 
      AutoLayout      =   PickerView1, 4, <Parent>, 4, False, +1.00, 2, 1, -*kStdGapCtlToViewV, 
      Height          =   118.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   1
      Top             =   342
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 74, 
      AutoLayout      =   Button1, 3, TextArea1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Button1, 1, PickerView1, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Start"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   248
      Visible         =   True
      Width           =   74.0
   End
   Begin iOSButton Button2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button2, 7, , 0, False, +1.00, 1, 1, 74, 
      AutoLayout      =   Button2, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Button2, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button2, 10, Button1, 10, False, +1.00, 1, 1, , 
      Caption         =   "Stop"
      Enabled         =   False
      Height          =   30.0
      Left            =   226
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   248
      Visible         =   True
      Width           =   74.0
   End
   Begin iOSButton Button3
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button3, 2, Label1, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Button3, 4, Button1, 4, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Button3, 9, <Parent>, 9, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Button3, 7, , 0, False, +1.00, 2, 1, 74, 
      AutoLayout      =   Button3, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "Pause"
      Enabled         =   False
      Height          =   30.0
      Left            =   123
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   248
      Visible         =   True
      Width           =   74.0
   End
   Begin iOSSegmentedControl SegmentedControl1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   SegmentedControl1, 7, , 0, False, +1.00, 1, 1, 200, 
      AutoLayout      =   SegmentedControl1, 3, Label2, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   SegmentedControl1, 8, , 0, True, +1.00, 1, 1, 29, 
      AutoLayout      =   SegmentedControl1, 9, <Parent>, 9, False, +1.00, 1, 1, 0, 
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   60
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "Min\n\nTrue\rDefault\n\nFalse\rMax\n\nFalse"
      Top             =   324
      Value           =   0
      Visible         =   True
      Width           =   200.0
   End
   Begin iOSLabel Label2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label2, 7, , 0, False, +1.00, 1, 1, 100, 
      AutoLayout      =   Label2, 3, Button1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Label2, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   Label2, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Speech Rate:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   286
      Visible         =   True
      Width           =   100.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  language = "en-US"
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private language As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private synth As AVFoundation.AVSpeechSynthesizer
	#tag EndProperty


#tag EndWindowCode

#tag Events PickerView1
	#tag Event
		Sub Open()
		  dim voices as Foundation.NSArray
		  voices = AVFoundation.AVSpeechSynthesisVoice.SpeechVoices
		  dim count as Integer = voices.Count-1
		  dim languages() as Text
		  for i as Integer = 0 to count
		    dim voice as new AVFoundation.AVSpeechSynthesisVoice(voices.Value(i))
		    languages.Append voice.language
		  next
		  
		  me.AddColumn(languages)
		  me.SelectedRow(0) = languages.IndexOf("en-US")
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(row as integer, column as integer)
		  language = me.Text(row,column)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Action()
		  if TextArea1.Text.Empty then Return
		  
		  if synth <> nil and synth.paused then
		    if synth.ContinueSpeaking then
		      Return
		    end if
		  end if
		  
		  synth = new AVFoundation.AVSpeechSynthesizer
		  
		  dim utterance as new AVFoundation.AVSpeechUtterance(TextArea1.Text)
		  
		  if not language.Empty then
		    utterance.voice = AVFoundation.AVSpeechSynthesisVoice.VoiceWithLanguage(language)
		  end if
		  
		  select case SegmentedControl1.Value
		  case 0
		    //min
		    utterance.rate = AVFoundation.AVSpeechUtterance.MinimumSpeechRate
		  case 1
		    //default
		    utterance.rate = AVFoundation.AVSpeechUtterance.DefaultSpeechRate
		  case 3
		    //max
		    utterance.rate = AVFoundation.AVSpeechUtterance.MaximumSpeechRate
		  end select
		  
		  synth.SpeakUtterance(utterance)
		  
		  Button2.Enabled = True
		  Button3.Enabled = True
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button2
	#tag Event
		Sub Action()
		  call synth.StopSpeakingAtBoundary(AVFoundation.AVSpeechSynthesizer.AVSpeechBoundary.Word)
		  
		  synth = nil
		  Button2.Enabled = False
		  Button3.Enabled = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button3
	#tag Event
		Sub Action()
		  call synth.PauseSpeakingAtBoundary(AVFoundation.AVSpeechSynthesizer.AVSpeechBoundary.Word)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
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
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
