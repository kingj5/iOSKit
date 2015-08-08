#tag Class
Protected Class MPMoviePlayerController
Inherits NSObject
	#tag Method, Flags = &h0
		Sub beginSeekingBackward()
		  declare sub beginSeekingBackward_ lib MediaPlayerLib selector "beginSeekingBackward" (obj_id as ptr)
		  beginSeekingBackward_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub beginSeekingForward()
		  declare sub beginSeekingForward_ lib MediaPlayerLib selector "beginSeekingForward" (obj_id as ptr)
		  beginSeekingForward_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("MPMoviePlayerController")
		  Return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(contentURL as Foundation.NSURL)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  declare function initWithContentURL lib MediaPlayerLib selector "initWithContentURL:" (obj_id as ptr, url as ptr) as ptr
		  Super.Constructor(initWithContentURL(Allocate(ClassRef), contentURL))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub endSeeking()
		  declare sub endSeeking_ lib MediaPlayerLib selector "endSeeking" (obj_id as ptr)
		  endSeeking_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pause()
		  declare sub pause_ lib MediaPlayerLib selector "pause" (obj_id as ptr)
		  pause_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub play()
		  declare sub play_ lib MediaPlayerLib selector "play" (obj_id as ptr)
		  play_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub prepareToPlay()
		  declare sub prepareToPlay_ lib MediaPlayerLib selector "prepareToPlay" (obj_id as ptr)
		  prepareToPlay_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stop()
		  declare sub stop_ lib MediaPlayerLib selector "stop" (obj_id as ptr)
		  stop_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function view() As Ptr
		  declare function view_ lib MediaPlayerLib selector "view" (obj_id as ptr) as ptr
		  Return view_(self)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function currentPlaybackRate_ lib MediaPlayerLib selector "currentPlaybackRate" (obj_id as ptr) as Single
			  Return currentPlaybackRate_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub currentPlaybackRate_ lib MediaPlayerLib selector "setCurrentPlaybackRate:" (obj_id as ptr, val as Single)
			  currentPlaybackRate_(self,value)
			End Set
		#tag EndSetter
		currentPlaybackRate As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function currentPlaybackTime_ lib MediaPlayerLib selector "currentPlaybackTime" (obj_id as ptr) as Double
			  Return currentPlaybackTime_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub currentPlaybackTime_ lib MediaPlayerLib selector "setCurrentPlaybackTime:" (obj_id as Ptr, val as Double)
			  currentPlaybackTime_(self,value)
			End Set
		#tag EndSetter
		currentPlaybackTime As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function fullscreen_ lib MediaPlayerLib selector "isFullscreen" (obj_id as Ptr) as Boolean
			  Return fullscreen_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub fullscreen_ lib MediaPlayerLib selector "setFullscreen:" (obj_id as ptr, val as Boolean)
			  fullscreen_(self,value)
			End Set
		#tag EndSetter
		fullscreen As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function isPreparedToPlay_ lib MediaPlayerLib selector "isPreparedToPlay" (obj_id as ptr) as Boolean
			  Return isPreparedToPlay_(self)
			End Get
		#tag EndGetter
		isPreparedToPlay As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = MediaPlayerLib, Type = Text, Dynamic = False, Default = \"MediaPlayer.framework", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="currentPlaybackRate"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentPlaybackTime"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="fullscreen"
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
			Name="isPreparedToPlay"
			Group="Behavior"
			Type="Boolean"
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
