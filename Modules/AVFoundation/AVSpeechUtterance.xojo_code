#tag Class
Protected Class AVSpeechUtterance
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVSpeechUtterance")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(str as Text)
		  declare function initWithString_ lib AVFoundationLib selector "initWithString:" (obj_id as ptr, str as CFStringRef) as ptr
		  Super.Constructor( initWithString_(Allocate(ClassRef), str) )
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SpeechUtteranceWithString(string as Text) As AVFoundation.AVSpeechUtterance
		  declare function speechUtteranceWithString_ lib AVFoundationLib selector "speechUtteranceWithString:" (clsRef as ptr, string as CFStringRef) as ptr
		  Return new AVSpeechUtterance(speechUtteranceWithString_(ClassRef, string))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function pitchMultiplier_ lib AVFoundationLib selector "pitchMultiplier" (obj_id as ptr) as Double
			  Return pitchMultiplier_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub pitchMultiplier_ lib AVFoundationLib selector "setPitchMultiplier:" (obj_id as ptr, pitchMultiplier as Double)
			  pitchMultiplier_(self, value)
			End Set
		#tag EndSetter
		pitchMultiplier As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function postUtteranceDelay_ lib AVFoundationLib selector "postUtteranceDelay" (obj_id as ptr) as Double
			  Return postUtteranceDelay_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub postUtteranceDelay_ lib AVFoundationLib selector "setPostUtteranceDelay:" (obj_id as ptr, postUtteranceDelay as Double)
			  postUtteranceDelay_(self, value)
			End Set
		#tag EndSetter
		postUtteranceDelay As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preUtteranceDelay_ lib AVFoundationLib selector "preUtteranceDelay" (obj_id as ptr) as Double
			  Return preUtteranceDelay_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub preUtteranceDelay_ lib AVFoundationLib selector "setPreUtteranceDelay:" (obj_id as ptr, preUtteranceDelay as Double)
			  preUtteranceDelay_(self, value)
			End Set
		#tag EndSetter
		preUtteranceDelay As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function rate_ lib AVFoundationLib selector "rate" (obj_id as ptr) as Double
			  Return rate_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub rate_ lib AVFoundationLib selector "setRate:" (obj_id as ptr, rate as Double)
			  rate_(self, value)
			End Set
		#tag EndSetter
		rate As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function speechString_ lib AVFoundationLib selector "speechString" (obj_id as ptr) as CFStringRef
			  Return speechString_(self)
			End Get
		#tag EndGetter
		speechString As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function voice_ lib AVFoundationLib selector "voice" (obj_id as ptr) as ptr
			  Return new AVSpeechSynthesisVoice(voice_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub voice_ lib AVFoundationLib selector "setVoice:" (obj_id as ptr, voice as ptr)
			  voice_(self, value)
			End Set
		#tag EndSetter
		voice As AVSpeechSynthesisVoice
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function volume_ lib AVFoundationLib selector "volume" (obj_id as ptr) as Double
			  Return volume_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub volume_ lib AVFoundationLib selector "setVolume:" (obj_id as ptr, volume as Double)
			  volume_(self, value)
			End Set
		#tag EndSetter
		volume As Double
	#tag EndComputedProperty


	#tag Constant, Name = DefaultSpeechRate, Type = Double, Dynamic = False, Default = \"0.5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MaximumSpeechRate, Type = Double, Dynamic = False, Default = \"1.0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MinimumSpeechRate, Type = Double, Dynamic = False, Default = \"0.0", Scope = Public
	#tag EndConstant


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
			Name="pitchMultiplier"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="postUtteranceDelay"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="preUtteranceDelay"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rate"
			Group="Behavior"
			Type="Double"
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
		#tag ViewProperty
			Name="volume"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
