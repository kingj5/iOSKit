#tag Class
Protected Class AVSpeechSynthesizer
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVSpeechSynthesizer")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(ClassRef)))
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContinueSpeaking() As Boolean
		  declare function continueSpeaking_ lib AVFoundationLib selector "continueSpeaking" (obj_id as ptr) as Boolean
		  Return continueSpeaking_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PauseSpeakingAtBoundary(boundary as AVSpeechBoundary) As Boolean
		  declare function pauseSpeakingAtBoundary_ lib AVFoundationLib selector "pauseSpeakingAtBoundary:" (obj_id as ptr, boundary as AVSpeechBoundary) as Boolean
		  Return pauseSpeakingAtBoundary_(self, boundary)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SpeakUtterance(utterance as AVSpeechUtterance)
		  declare sub speakUtterance_ lib AVFoundationLib selector "speakUtterance:" (obj_id as ptr, utterance as ptr)
		  speakUtterance_(self, utterance)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StopSpeakingAtBoundary(boundary as AVSpeechBoundary) As Boolean
		  declare function stopSpeakingAtBoundary_ lib AVFoundationLib selector "stopSpeakingAtBoundary:" (obj_id as ptr, boundary as AVSpeechBoundary) as Boolean
		  Return stopSpeakingAtBoundary_(self, boundary)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function delegate_ lib AVFoundationLib selector "delegate" (obj_id as ptr) as ptr
			  Return (delegate_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub delegate_ lib AVFoundationLib selector "setDelegate:" (obj_id as ptr, del as ptr)
			  delegate_(self, value)
			End Set
		#tag EndSetter
		mdelegate As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function paused_ lib AVFoundationLib selector "isPaused" (obj_id as ptr) as Boolean
			  Return paused_(self)
			End Get
		#tag EndGetter
		paused As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function speaking_ lib AVFoundationLib selector "isSpeaking" (obj_id as ptr) as Boolean
			  Return speaking_(self)
			End Get
		#tag EndGetter
		speaking As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = AVSpeechBoundary, Type = Integer, Flags = &h0
		Immediate = 0
		Word = 1
	#tag EndEnum


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
			Name="paused"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="speaking"
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
