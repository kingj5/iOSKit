#tag IOSView
Begin iosView RecordPlayAudioView
   BackButtonTitle =   "Back"
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Record and Play Audio"
   Top             =   0
   Begin iOSButton RecordPauseButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   RecordPauseButton, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   RecordPauseButton, 3, <Parent>, 3, False, +1.00, 1, 1, 169, , True
      AutoLayout      =   RecordPauseButton, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   RecordPauseButton, 8, , 0, False, +1.00, 1, 1, 30, , True
      Caption         =   "Record"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   169
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton StopButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   StopButton, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   StopButton, 10, RecordPauseButton, 10, False, +1.00, 1, 1, , , True
      AutoLayout      =   StopButton, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   StopButton, 8, , 0, False, +1.00, 1, 1, 30, , True
      Caption         =   "Stop"
      Enabled         =   False
      Height          =   30.0
      Left            =   200
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   169
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSButton PlayButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PlayButton, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   PlayButton, 3, <Parent>, 3, False, +1.00, 1, 1, 270, , True
      AutoLayout      =   PlayButton, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   PlayButton, 8, , 0, False, +1.00, 1, 1, 30, , True
      Caption         =   "Play"
      Enabled         =   False
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   270
      Visible         =   True
      Width           =   100.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Close()
		  RemoveHandler recorder.FinishedRecording, AddressOf RecorderFinished
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  //create a destination FolderItem and NSURL representation of it
		  dim f as xojo.IO.FolderItem = xojo.io.SpecialFolder.Documents.Child("MyRecordingDemo.m4a")
		  dim outputFile as new Foundation.NSURL(f)
		  
		  //configure the audio session
		  dim session as AVFoundation.AVAudioSession = AVFoundation.AVAudioSession.SharedInstance
		  dim err as Foundation.NSError
		  call session.SetCategory(AVFoundation.AVStringConstant("AVAudioSessionCategoryPlayAndRecord"),err)
		  
		  //get the values of settings constants
		  dim formatIDKey as Text = AVFoundation.AVStringConstant("AVFormatIDKey")
		  dim sampleRateKey as Text = AVFoundation.AVStringConstant("AVSampleRateKey")
		  dim numberOfChannelsKey as Text = AVFoundation.AVStringConstant("AVNumberOfChannelsKey")
		  
		  //haven't implemented NSNumber yet so need a few declares here to create them
		  declare function numberWithInt lib FoundationLib selector "numberWithInt:" (clsRef as ptr, int as Integer) as ptr
		  declare function numberWithFloat lib FoundationLib selector "numberWithFloat:" (clsRef as ptr, float as single) as ptr
		  dim numberClass as ptr = NSClassFromString("NSNumber")
		  
		  dim recordSettings as new Foundation.NSMutableDictionary
		  const kAudioFormatMPEG4AAC = 1633772320
		  recordSettings.Value(new NSString(formatIDKey)) = numberWithInt(numberClass,kAudioFormatMPEG4AAC)
		  recordSettings.Value(new NSString(sampleRateKey)) = numberWithFloat(numberClass, 44100.0)
		  recordSettings.Value(new NSString(numberOfChannelsKey)) = numberWithInt(numberClass, 2)
		  
		  //create the recorder object
		  recorder = new AVFoundation.AVAudioRecorder(outputFile,recordSettings,err)
		  recorder.meteringEnabled = True
		  if not recorder.PrepareToRecord then
		    MsgBox "error preparing to record"
		  end if
		  
		  AddHandler recorder.FinishedRecording, AddressOf RecorderFinished
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub RecorderFinished(sender as AVFoundation.AVAudioRecorder, successfully as Boolean)
		  RecordPauseButton.Caption = "Record"
		  
		  StopButton.Enabled = False
		  PlayButton.Enabled = True
		  
		  #Pragma Unused sender
		  #Pragma Unused successfully
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		player As AVFoundation.AVAudioPlayer
	#tag EndProperty

	#tag Property, Flags = &h0
		recorder As AVFoundation.AVAudioRecorder
	#tag EndProperty


#tag EndWindowCode

#tag Events RecordPauseButton
	#tag Event
		Sub Action()
		  
		  if player <> nil and player.playing then
		    player.Stop
		  end if
		  
		  if not recorder.recording then
		    dim session as AVFoundation.AVAudioSession = AVFoundation.AVAudioSession.SharedInstance
		    dim err as Foundation.NSError
		    if not session.SetActive(True,err) then
		      MsgBox "failed to make session active"
		    end if
		    if not recorder.Record then
		      MsgBox "failed to start recording"
		    end if
		    me.Caption = "Pause"
		  else
		    recorder.Pause
		    me.Caption = "Record"
		  end if
		  
		  PlayButton.Enabled = False
		  StopButton.Enabled = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  recorder.Stop
		  
		  dim session as AVFoundation.AVAudioSession = AVFoundation.AVAudioSession.SharedInstance
		  dim err as Foundation.NSError
		  call session.SetActive(false,err)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayButton
	#tag Event
		Sub Action()
		  if not recorder.recording then
		    dim err as Foundation.NSError
		    player = new AVFoundation.AVAudioPlayer(recorder.url,err)
		    call player.Play
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
		EditorType=""
	#tag EndViewProperty
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
