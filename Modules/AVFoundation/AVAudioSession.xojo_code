#tag Class
Protected Class AVAudioSession
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVAudioSession")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor(ref as ptr)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(ref)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverrideOutputAudioPortError(portOverride as AVAudioSessionPortOverride, byref outError as NSError) As Boolean
		  declare function overrideOutputAudioPort_ lib AVFoundationLib selector "overrideOutputAudioPort:error:" (obj_id as ptr, portOverride as AVAudioSessionPortOverride, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = overrideOutputAudioPort_(self, portOverride, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecordPermission() As AVAudioSessionRecordPermission
		  declare function recordPermission_ lib AVFoundationLib selector "recordPermission" (obj_id as ptr) as AVAudioSessionRecordPermission
		  Return (recordPermission_(self))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetActive(beActive as Boolean, byref outError as NSError) As Boolean
		  declare function setActive_ lib AVFoundationLib selector "setActive:error:" (obj_id as ptr, beActive as Boolean, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setActive_(self, beActive, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetActiveWithOptionsError(active as Boolean, options as AVAudioSessionSetActiveOptions, byref outError as NSError) As Boolean
		  declare function setActive_ lib AVFoundationLib selector "setActive:withOptions:error:" (obj_id as ptr, active as Boolean, options as AVAudioSessionSetActiveOptions, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setActive_(self, active, options, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetCategory(theCategory as CFStringRef, byref outError as NSError) As Boolean
		  declare function setCategory_ lib AVFoundationLib selector "setCategory:error:" (obj_id as ptr, theCategory as CFStringRef, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setCategory_(self, theCategory, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetCategoryWithOptions(category as CFStringRef, options as AVAudioSessionCategoryOptions, byref outError as NSError) As Boolean
		  declare function setCategory_ lib AVFoundationLib selector "setCategory:withOptions:error:" (obj_id as ptr, category as CFStringRef, options as AVAudioSessionCategoryOptions, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setCategory_(self, category, options, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetInputDataSource(dataSource as AVAudioSessionDataSourceDescription, byref outError as NSError) As Boolean
		  declare function setInputDataSource_ lib AVFoundationLib selector "setInputDataSource:error:" (obj_id as ptr, dataSource as ptr, outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setInputDataSource_(self, dataSource, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetInputGain(gain as double, byref outError as NSError) As Boolean
		  declare function setInputGain_ lib AVFoundationLib selector "setInputGain:error:" (obj_id as ptr, gain as double, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setInputGain_(self, gain, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetMode(theMode as CFStringRef, byref outError as NSError) As Boolean
		  declare function setMode_ lib AVFoundationLib selector "setMode:error:" (obj_id as ptr, theMode as CFStringRef, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setMode_(self, theMode, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetOutputDataSourceError(dataSource as AVAudioSessionDataSourceDescription, byref outError as NSError) As Boolean
		  declare function setOutputDataSource_ lib AVFoundationLib selector "setOutputDataSource:error:" (obj_id as ptr, dataSource as ptr, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setOutputDataSource_(self, dataSource, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPreferredInputError(inPort as AVAudioSessionPortDescription, byref outError as NSError) As Boolean
		  declare function setPreferredInput_ lib AVFoundationLib selector "setPreferredInput:error:" (obj_id as ptr, inPort as ptr, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setPreferredInput_(self, inPort, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPreferredInputNumberOfChannelsError(count as Integer, byref outError as NSError) As Boolean
		  declare function setPreferredInputNumberOfChannels_ lib AVFoundationLib selector "setPreferredInputNumberOfChannels:error:" (obj_id as ptr, count as Integer, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setPreferredInputNumberOfChannels_(self, count, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPreferredIOBufferDurationError(duration as double, byref outError as NSError) As Boolean
		  declare function setPreferredIOBufferDuration_ lib AVFoundationLib selector "setPreferredIOBufferDuration:error:" (obj_id as ptr, duration as Double, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setPreferredIOBufferDuration_(self, duration, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPreferredOutputNumberOfChannelsError(count as Integer, byref outError as NSError) As Boolean
		  declare function setPreferredOutputNumberOfChannels_ lib AVFoundationLib selector "setPreferredOutputNumberOfChannels:error:" (obj_id as ptr, count as Integer, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setPreferredOutputNumberOfChannels_(self, count, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPreferredSampleRateError(sampleRate as Double, byref outError as NSError) As Boolean
		  declare function setPreferredSampleRate_ lib AVFoundationLib selector "setPreferredSampleRate:error:" (obj_id as ptr, sampleRate as Double, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setPreferredSampleRate_(self, sampleRate, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SharedInstance() As AVAudioSession
		  declare function sharedInstance_ lib AVFoundationLib selector "sharedInstance" (clsRef as ptr) as ptr
		  Return new AVAudioSession(sharedInstance_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    //collect the notifications about audio state by adding methods to handle them
		    
		    targetID = BuildTargetClass("NSObject","MyAVAudioSessionDel",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function availableInputs_ lib AVFoundationLib selector "availableInputs" (obj_id as ptr) as ptr
			  Return new NSArray(availableInputs_(self))
			End Get
		#tag EndGetter
		availableInputs As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function category_ lib AVFoundationLib selector "category" (obj_id as ptr) as CFStringRef
			  Return category_(self)
			End Get
		#tag EndGetter
		category As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function categoryOptions_ lib AVFoundationLib selector "categoryOptions" (obj_id as ptr) as AVAudioSessionCategoryOptions
			  Return (categoryOptions_(self))
			End Get
		#tag EndGetter
		categoryOptions As AVAudioSessionCategoryOptions
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function currentRoute_ lib AVFoundationLib selector "currentRoute" (obj_id as ptr) as ptr
			  Return new AVAudioSessionRouteDescription(currentRoute_(self))
			End Get
		#tag EndGetter
		currentRoute As AVAudioSessionRouteDescription
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inputAvailable_ lib AVFoundationLib selector "isInputAvailable" (obj_id as ptr) as Boolean
			  Return inputAvailable_(self)
			End Get
		#tag EndGetter
		inputAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inputDataSource_ lib AVFoundationLib selector "inputDataSource" (obj_id as ptr) as ptr
			  Return new AVAudioSessionDataSourceDescription(inputDataSource_(self))
			End Get
		#tag EndGetter
		inputDataSource As AVAudioSessionDataSourceDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inputDataSources_ lib AVFoundationLib selector "inputDataSources" (obj_id as ptr) as ptr
			  Return new NSArray(inputDataSources_(self))
			End Get
		#tag EndGetter
		inputDataSources As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inputGain_ lib AVFoundationLib selector "inputGain" (obj_id as ptr) as Double
			  Return (inputGain_(self))
			End Get
		#tag EndGetter
		inputGain As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inputGainSettable_ lib AVFoundationLib selector "isInputGainSettable" (obj_id as ptr) as Boolean
			  Return inputGainSettable_(self)
			End Get
		#tag EndGetter
		inputGainSettable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inputLatency_ lib AVFoundationLib selector "inputLatency" (obj_id as ptr) as Double
			  Return (inputLatency_(self))
			End Get
		#tag EndGetter
		inputLatency As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inputNumberOfChannels_ lib AVFoundationLib selector "inputNumberOfChannels" (obj_id as ptr) as Integer
			  Return inputNumberOfChannels_(self)
			End Get
		#tag EndGetter
		inputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function IOBufferDuration_ lib AVFoundationLib selector "IOBufferDuration" (obj_id as ptr) as Double
			  Return (IOBufferDuration_(self))
			End Get
		#tag EndGetter
		IOBufferDuration As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maximumInputNumberOfChannels_ lib AVFoundationLib selector "maximumInputNumberOfChannels" (obj_id as ptr) as Integer
			  Return maximumInputNumberOfChannels_(self)
			End Get
		#tag EndGetter
		maximumInputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maximumOutputNumberOfChannels_ lib AVFoundationLib selector "maximumOutputNumberOfChannels" (obj_id as ptr) as Integer
			  Return maximumOutputNumberOfChannels_(self)
			End Get
		#tag EndGetter
		maximumOutputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function mode_ lib AVFoundationLib selector "mode" (obj_id as ptr) as CFStringRef
			  Return mode_(self)
			End Get
		#tag EndGetter
		mode As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function otherAudioPlaying_ lib AVFoundationLib selector "isOtherAudioPlaying" (obj_id as ptr) as Boolean
			  Return otherAudioPlaying_(self)
			End Get
		#tag EndGetter
		otherAudioPlaying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function outputDataSource_ lib AVFoundationLib selector "outputDataSource" (obj_id as ptr) as ptr
			  Return new AVAudioSessionDataSourceDescription(outputDataSource_(self))
			End Get
		#tag EndGetter
		outputDataSource As AVAudioSessionDataSourceDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function outputDataSources_ lib AVFoundationLib selector "outputDataSources" (obj_id as ptr) as ptr
			  Return new NSArray(outputDataSources_(self))
			End Get
		#tag EndGetter
		outputDataSources As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function outputLatency_ lib AVFoundationLib selector "outputLatency" (obj_id as ptr) as Double
			  Return (outputLatency_(self))
			End Get
		#tag EndGetter
		outputLatency As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function outputNumberOfChannels_ lib AVFoundationLib selector "outputNumberOfChannels" (obj_id as ptr) as Integer
			  Return outputNumberOfChannels_(self)
			End Get
		#tag EndGetter
		outputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function outputVolume_ lib AVFoundationLib selector "outputVolume" (obj_id as ptr) as Double
			  Return (outputVolume_(self))
			End Get
		#tag EndGetter
		outputVolume As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredInput_ lib AVFoundationLib selector "preferredInput" (obj_id as ptr) as ptr
			  Return new AVAudioSessionPortDescription(preferredInput_(self))
			End Get
		#tag EndGetter
		preferredInput As AVAudioSessionPortDescription
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredInputNumberOfChannels_ lib AVFoundationLib selector "preferredInputNumberOfChannels" (obj_id as ptr) as Integer
			  Return preferredInputNumberOfChannels_(self)
			End Get
		#tag EndGetter
		preferredInputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredIOBufferDuration_ lib AVFoundationLib selector "preferredIOBufferDuration" (obj_id as ptr) as Double
			  Return (preferredIOBufferDuration_(self))
			End Get
		#tag EndGetter
		preferredIOBufferDuration As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredOutputNumberOfChannels_ lib AVFoundationLib selector "preferredOutputNumberOfChannels" (obj_id as ptr) as Integer
			  Return preferredOutputNumberOfChannels_(self)
			End Get
		#tag EndGetter
		preferredOutputNumberOfChannels As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function preferredSampleRate_ lib AVFoundationLib selector "preferredSampleRate" (obj_id as ptr) as Double
			  Return preferredSampleRate_(self)
			End Get
		#tag EndGetter
		preferredSampleRate As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sampleRate_ lib AVFoundationLib selector "sampleRate" (obj_id as ptr) as Double
			  Return sampleRate_(self)
			End Get
		#tag EndGetter
		sampleRate As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function secondaryAudioShouldBeSilencedHint_ lib AVFoundationLib selector "secondaryAudioShouldBeSilencedHint" (obj_id as ptr) as Boolean
			  Return secondaryAudioShouldBeSilencedHint_(self)
			End Get
		#tag EndGetter
		secondaryAudioShouldBeSilencedHint As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = AVAudioSessionCategoryOptions, Type = Integer, Flags = &h0
		MixWithOthers = 1
		  DuckOthers = 2
		  AllowBluetooth = 4
		DefaultToSpeaker = 8
	#tag EndEnum

	#tag Enum, Name = AVAudioSessionPortOverride, Type = Integer, Flags = &h0
		None = 0
		Speaker = 1936747378
	#tag EndEnum

	#tag Enum, Name = AVAudioSessionRecordPermission, Type = Integer, Flags = &h0
		Undetermined
		  Denied
		Granted
	#tag EndEnum

	#tag Enum, Name = AVAudioSessionSetActiveOptions, Type = Integer, Flags = &h0
		NotifyOthersOnDeactivation = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="category"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="categoryOptions"
			Group="Behavior"
			Type="AVAudioSessionCategoryOptions"
			EditorType="Enum"
			#tag EnumValues
				"1 - MixWithOthers"
				"2 - DuckOthers"
				"4 - AllowBluetooth"
				"8 - DefaultToSpeaker"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="inputAvailable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="inputGain"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="inputGainSettable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="inputLatency"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="inputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IOBufferDuration"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="maximumInputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="maximumOutputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mode"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="otherAudioPlaying"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="outputLatency"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="outputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="outputVolume"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="preferredInputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="preferredIOBufferDuration"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="preferredOutputNumberOfChannels"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="preferredSampleRate"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sampleRate"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="secondaryAudioShouldBeSilencedHint"
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
