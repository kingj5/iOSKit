#tag Class
Protected Class AVSpeechSynthesisVoice
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVSpeechSynthesisVoice")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  'Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CurrentLanguageCode() As Text
		  declare function currentLanguageCode_ lib AVFoundationLib selector "currentLanguageCode" (clsRef as ptr) as CFStringRef
		  Return currentLanguageCode_(ClassRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SpeechVoices() As NSArray
		  declare function speechVoices_ lib AVFoundationLib selector "speechVoices" (clsRef as ptr) as ptr
		  Return new NSArray(speechVoices_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function VoiceWithLanguage(language as Text) As AVSpeechSynthesisVoice
		  declare function voiceWithLanguage_ lib AVFoundationLib selector "voiceWithLanguage:" (clsRef as ptr, language as CFStringRef) as ptr
		  Return new AVSpeechSynthesisVoice(voiceWithLanguage_(ClassRef, language))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function language_ lib AVFoundationLib selector "language" (obj_id as ptr) as CFStringRef
			  Return language_(self)
			End Get
		#tag EndGetter
		language As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="language"
			Group="Behavior"
			Type="Text"
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
