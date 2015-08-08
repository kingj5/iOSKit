#tag Class
Protected Class AVAudioPlayer
Inherits NSObject
	#tag Method, Flags = &h0
		Function AveragePowerForChannel(channelNumber as UInteger) As Double
		  declare function averagePowerForChannel_ lib AVFoundationLib selector "averagePowerForChannel:" (obj_id as ptr, channelNumber as UInteger) as Double
		  Return (averagePowerForChannel_(self, channelNumber))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVAudioPlayer")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data as NSData, byref outError as NSError)
		  declare function initWithData_ lib AVFoundationLib selector "initWithData:error:" (obj_id as ptr, data as ptr, byref outError as ptr) as ptr
		  
		  dim err as Ptr
		  
		  Super.Constructor( initWithData_(Allocate(ClassRef), data, err) )
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  
		  CreateDelegate
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data as NSData, utiString as Text, byref outError as NSError)
		  declare function initWithData_ lib AVFoundationLib selector "initWithData:fileTypeHint:error:" (obj_id as ptr, data as ptr, utiString as CFStringRef, byref outError as ptr) as ptr
		  dim err as Ptr
		  Super.Constructor( initWithData_(Allocate(ClassRef), data, utiString, err) )
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  CreateDelegate
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url as NSURL, utiString as CFStringRef, byref outError as NSError)
		  declare function initWithContentsOfURL_ lib AVFoundationLib selector "initWithContentsOfURL:fileTypeHint:error:" (obj_id as ptr, url as ptr, utiString as CFStringRef, byref outError as ptr) as ptr
		  dim err as ptr
		  Super.Constructor( initWithContentsOfURL_(Allocate(ClassRef), url, utiString, err) )
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  CreateDelegate
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url as NSURL, byref outError as NSError)
		  declare function initWithContentsOfURL_ lib AVFoundationLib selector "initWithContentsOfURL:error:" (obj_id as ptr, url as ptr, byref outError as ptr) as ptr
		  dim err as ptr
		  Super.Constructor( initWithContentsOfURL_(Allocate(ClassRef), url, err) )
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  CreateDelegate
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateDelegate()
		  dim target as ptr = Initialize(Allocate(TargetClass))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(target) = xojo.core.WeakRef.Create(self)
		  
		  mdelegate = target
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDecodeError(err as Foundation.NSError)
		  RaiseEvent DecodeError(err)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFinishedPlaying(successfully as Boolean)
		  RaiseEvent FinishedPlaying(successfully)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_decodeError(pid as ptr, sel as ptr, player as ptr, err as ptr)
		  dim error as Foundation.NSError
		  if err <> nil then
		    error = new Foundation.NSError(err)
		  end if
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    AVAudioPlayer(w.Value).HandleDecodeError(error)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused player
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didFinishPlaying(pid as ptr, sel as ptr, player as ptr, success as Boolean)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    AVAudioPlayer(w.Value).HandleFinishedPlaying(success)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused player
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  declare sub pause_ lib AVFoundationLib selector "pause" (obj_id as ptr)
		  pause_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PeakPowerForChannel(channelNumber as UInteger) As Double
		  declare function peakPowerForChannel_ lib AVFoundationLib selector "peakPowerForChannel:" (obj_id as ptr, channelNumber as UInteger) as Double
		  Return (peakPowerForChannel_(self, channelNumber))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Play() As Boolean
		  declare function play_ lib AVFoundationLib selector "play" (obj_id as ptr) as Boolean
		  Return play_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlayAtTime(time as Double) As Boolean
		  declare function playAtTime_ lib AVFoundationLib selector "playAtTime:" (obj_id as ptr, time as Double) as Boolean
		  Return playAtTime_(self, time)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrepareToPlay() As Boolean
		  declare function prepareToPlay_ lib AVFoundationLib selector "prepareToPlay" (obj_id as ptr) as Boolean
		  Return prepareToPlay_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  declare sub stop_ lib AVFoundationLib selector "stop" (obj_id as ptr)
		  stop_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    //delegate methods
		    methods.Append new TargetClassMethodHelper("audioPlayerDecodeErrorDidOccur:error:", AddressOf impl_decodeError, "v@:@@")
		    methods.Append new TargetClassMethodHelper("audioPlayerDidFinishPlaying:successfully:", AddressOf impl_didFinishPlaying, "v@:@B")
		    
		    targetID = BuildTargetClass("NSObject","MyAVAudioPlayerDel",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMeters()
		  declare sub updateMeters_ lib AVFoundationLib selector "updateMeters" (obj_id as ptr)
		  updateMeters_(self)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DecodeError(err as Foundation.NSError)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FinishedPlaying(successfully as Boolean)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function currentTime_ lib AVFoundationLib selector "currentTime" (obj_id as ptr) as Double
			  Return currentTime_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub currentTime_ lib AVFoundationLib selector "setCurrentTime:" (obj_id as ptr, val as Double)
			  currentTime_(self,value)
			End Set
		#tag EndSetter
		currentTime As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function data_ lib AVFoundationLib selector "data" (obj_id as ptr) as ptr
			  Return new NSData(data_(self))
			End Get
		#tag EndGetter
		data As NSData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function deviceCurrentTime_ lib AVFoundationLib selector "deviceCurrentTime" (obj_id as ptr) as Double
			  Return (deviceCurrentTime_(self))
			End Get
		#tag EndGetter
		deviceCurrentTime As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function duration_ lib AVFoundationLib selector "duration" (obj_id as ptr) as Double
			  Return (duration_(self))
			End Get
		#tag EndGetter
		duration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function enableRate_ lib AVFoundationLib selector "enableRate" (obj_id as ptr) as Boolean
			  Return enableRate_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub enableRate_ lib AVFoundationLib selector "setEnabledRate:" (obj_id as ptr, val as Boolean)
			  enableRate_(self,value)
			End Set
		#tag EndSetter
		enableRate As Boolean
	#tag EndComputedProperty

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
			  declare function meteringEnabled_ lib AVFoundationLib selector "isMeteringEnabled" (obj_id as ptr) as Boolean
			  Return meteringEnabled_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setMeteringEnabled_ lib AVFoundationLib selector "setMeteringEnabled:" (obj_id as ptr, YES as Boolean)
			  setMeteringEnabled_(self, value)
			End Set
		#tag EndSetter
		meteringEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function numberOfChannels_ lib AVFoundationLib selector "numberOfChannels" (obj_id as ptr) as UInteger
			  Return numberOfChannels_(self)
			End Get
		#tag EndGetter
		numberOfChannels As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function numberOfLoops_ lib AVFoundationLib selector "numberOfLoops" (obj_id as ptr) as Integer
			  Return numberOfLoops_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub numberOfLoops_ lib AVFoundationLib selector "setNumberOfLoops:" (obj_id as ptr, num as Integer)
			  numberOfLoops_(self,value)
			End Set
		#tag EndSetter
		numberOfLoops As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function pan_ lib AVFoundationLib selector "pan" (obj_id as ptr) as Double
			  Return pan_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setPan lib AVFoundationLib selector "setPan:" (obj_id as ptr, pan as Double)
			  setPan(self,value)
			End Set
		#tag EndSetter
		pan As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function playing_ lib AVFoundationLib selector "isPlaying" (obj_id as ptr) as Boolean
			  Return playing_(self)
			End Get
		#tag EndGetter
		playing As Boolean
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
			  declare sub setRate lib AVFoundationLib selector "setRate:" (obj_id as ptr, rate as Double)
			  setRate(self,value)
			End Set
		#tag EndSetter
		rate As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function settings_ lib AVFoundationLib selector "settings" (obj_id as ptr) as ptr
			  Return new NSDictionary(settings_(self))
			End Get
		#tag EndGetter
		settings As NSDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function url_ lib AVFoundationLib selector "url" (obj_id as ptr) as ptr
			  Return new NSURL(url_(self))
			End Get
		#tag EndGetter
		url As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare Function volume_ lib AVFoundationLib selector "volume" (obj_id as ptr) as Double
			  Return volume_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setVolume lib AVFoundationLib selector "setVolume:" (obj_id as ptr, vol as Double)
			  setVolume(self,value)
			End Set
		#tag EndSetter
		volume As double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="currentTime"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="deviceCurrentTime"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="enableRate"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="meteringEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="numberOfLoops"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pan"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="playing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rate"
			Group="Behavior"
			Type="double"
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
			Type="double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
