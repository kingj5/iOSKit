#tag Class
Protected Class AVAudioRecorder
Inherits NSObject
	#tag Method, Flags = &h0
		Function AveragePowerForChannel(channelNumber as UInteger) As Double
		  declare function averagePowerForChannel_ lib AVFoundationLib selector "averagePowerForChannel:" (obj_id as ptr, channelNumber as UInteger) as Double
		  Return (averagePowerForChannel_(self, channelNumber))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVAudioRecorder")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url as NSURL, settings as NSDictionary, byref outError as NSError)
		  declare function initWithURL_ lib AVFoundationLib selector "initWithURL:settings:error:" (obj_id as ptr, url as ptr, settings as ptr, byref outError as ptr) as ptr
		  dim err as ptr
		  Super.Constructor( initWithURL_(Allocate(ClassRef), url, settings, err) )
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  dim target as ptr = Initialize(Allocate(TargetClass))
		  
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(target) = xojo.core.WeakRef.Create(self)
		  
		  mdelegate = target
		  
		  
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteRecording() As Boolean
		  declare function deleteRecording_ lib AVFoundationLib selector "deleteRecording" (obj_id as ptr) as Boolean
		  Return deleteRecording_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEncodeError(err as Foundation.NSError)
		  RaiseEvent EncodeError(err)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFinishedRecording(successfully as Boolean)
		  RaiseEvent FinishedRecording(successfully)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didFinishRecording(pid as ptr, sel as ptr, player as ptr, success as Boolean)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    AVAudioRecorder(w.Value).HandleFinishedRecording(success)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused player
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_encodeError(pid as ptr, sel as ptr, player as ptr, err as ptr)
		  dim error as Foundation.NSError
		  if err<> nil then
		    error = new Foundation.NSError(err)
		  end if
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    AVAudioRecorder(w.Value).HandleEncodeError(error)
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
		Function PrepareToRecord() As Boolean
		  declare function prepareToRecord_ lib AVFoundationLib selector "prepareToRecord" (obj_id as ptr) as Boolean
		  Return prepareToRecord_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Record() As Boolean
		  declare function record_ lib AVFoundationLib selector "record" (obj_id as ptr) as Boolean
		  Return record_(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecordAtTime(time as double) As Boolean
		  declare function recordAtTime_ lib AVFoundationLib selector "recordAtTime:" (obj_id as ptr, time as Double) as Boolean
		  Return recordAtTime_(self, time)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecordAtTimeForDuration(time as double, duration as double) As Boolean
		  declare function recordAtTime_ lib AVFoundationLib selector "recordAtTime:forDuration:" (obj_id as ptr, time as double, duration as Double) as Boolean
		  Return recordAtTime_(self, time, duration)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecordForDuration(duration as double) As Boolean
		  declare function recordForDuration_ lib AVFoundationLib selector "recordForDuration:" (obj_id as ptr, duration as Double) as Boolean
		  Return recordForDuration_(self, duration)
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
		    methods.Append new TargetClassMethodHelper("audioRecorderEncodeErrorDidOccur:error:", AddressOf impl_encodeError, "v@:@@")
		    methods.Append new TargetClassMethodHelper("audioRecorderDidFinishRecording:successfully:", AddressOf impl_didFinishRecording, "v@:@B")
		    
		    targetID = BuildTargetClass("NSObject","MyAVAudioRecorderDel",methods)
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
		Event EncodeError(err as Foundation.NSError)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FinishedRecording(successfully as Boolean)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function channelAssignments_ lib AVFoundationLib selector "channelAssignments" (obj_id as ptr) as ptr
			  Return new NSArray(channelAssignments_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub channelAssignments_ lib AVFoundationLib selector "setChannelAssignments:" (obj_id as ptr, channelAssignments as ptr)
			  channelAssignments_(self, value)
			End Set
		#tag EndSetter
		channelAssignments As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function currentTime_ lib AVFoundationLib selector "currentTime" (obj_id as ptr) as Double
			  Return (currentTime_(self))
			End Get
		#tag EndGetter
		currentTime As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function deviceCurrentTime_ lib AVFoundationLib selector "deviceCurrentTime" (obj_id as ptr) as Double
			  Return (deviceCurrentTime_(self))
			End Get
		#tag EndGetter
		deviceCurrentTime As double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

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
		mdelegate As ptr
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
			  declare sub meteringEnabled_ lib AVFoundationLib selector "setMeteringEnabled:" (obj_id as ptr, meteringEnabled as Boolean)
			  meteringEnabled_(self, value)
			End Set
		#tag EndSetter
		meteringEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function recording_ lib AVFoundationLib selector "isRecording" (obj_id as ptr) as Boolean
			  Return recording_(self)
			End Get
		#tag EndGetter
		recording As Boolean
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


	#tag ViewBehavior
		#tag ViewProperty
			Name="currentTime"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="deviceCurrentTime"
			Group="Behavior"
			Type="double"
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
			Name="recording"
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
