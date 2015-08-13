#tag Class
Protected Class AVCaptureDevice
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function AuthorizationStatusForMediaType(mediaType as CFStringRef) As AVAuthorizationStatus
		  declare function authorizationStatusForMediaType_ lib AVFoundationLib selector "authorizationStatusForMediaType:" (clsRef as ptr, mediaType as CFStringRef) as AVAuthorizationStatus
		  Return (authorizationStatusForMediaType_(ClassRef, mediaType))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelVideoZoomRamp()
		  declare sub cancelVideoZoomRamp_ lib AVFoundationLib selector "cancelVideoZoomRamp" (obj_id as ptr)
		  cancelVideoZoomRamp_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureDevice")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DefaultDeviceWithMediaType(mediaType as CFStringRef) As AVCaptureDevice
		  declare function defaultDeviceWithMediaType_ lib AVFoundationLib selector "defaultDeviceWithMediaType:" (clsRef as ptr, mediaType as CFStringRef) as ptr
		  Return new AVCaptureDevice(defaultDeviceWithMediaType_(ClassRef, mediaType))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Devices() As NSArray
		  declare function devices_ lib AVFoundationLib selector "devices" (clsRef as ptr) as ptr
		  Return new NSArray(devices_(ClassRef))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DevicesWithMediaType(mediaType as CFStringRef) As NSArray
		  declare function devicesWithMediaType_ lib AVFoundationLib selector "devicesWithMediaType:" (clsRef as ptr, mediaType as CFStringRef) as ptr
		  Return new NSArray(devicesWithMediaType_(ClassRef, mediaType))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DeviceWithUniqueID(deviceUniqueID as CFStringRef) As AVCaptureDevice
		  declare function deviceWithUniqueID_ lib AVFoundationLib selector "deviceWithUniqueID:" (clsRef as ptr, deviceUniqueID as CFStringRef) as ptr
		  Return new AVCaptureDevice(deviceWithUniqueID_(ClassRef, deviceUniqueID))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasMediaType(mediaType as CFStringRef) As Boolean
		  declare function hasMediaType_ lib AVFoundationLib selector "hasMediaType:" (obj_id as ptr, mediaType as CFStringRef) as Boolean
		  Return hasMediaType_(self, mediaType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsExposureModeSupported(exposureMode as AVCaptureExposureMode) As Boolean
		  declare function isExposureModeSupported_ lib AVFoundationLib selector "isExposureModeSupported:" (obj_id as ptr, exposureMode as AVCaptureExposureMode) as Boolean
		  Return isExposureModeSupported_(self, exposureMode)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFlashModeSupported(flashMode as AVCaptureFlashMode) As Boolean
		  declare function isFlashModeSupported_ lib AVFoundationLib selector "isFlashModeSupported:" (obj_id as ptr, flashMode as AVCaptureFlashMode) as Boolean
		  Return isFlashModeSupported_(self, flashMode)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFocusModeSupported(focusMode as AVCaptureFocusMode) As Boolean
		  declare function isFocusModeSupported_ lib AVFoundationLib selector "isFocusModeSupported:" (obj_id as ptr, focusMode as AVCaptureFocusMode) as Boolean
		  Return isFocusModeSupported_(self, focusMode)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTorchModeSupported(torchMode as AVCaptureTorchMode) As Boolean
		  declare function isTorchModeSupported_ lib AVFoundationLib selector "isTorchModeSupported:" (obj_id as ptr, torchMode as AVCaptureTorchMode) as Boolean
		  Return isTorchModeSupported_(self, torchMode)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsWhiteBalanceModeSupported(whiteBalanceMode as AVCaptureWhiteBalanceMode) As Boolean
		  declare function isWhiteBalanceModeSupported_ lib AVFoundationLib selector "isWhiteBalanceModeSupported:" (obj_id as ptr, whiteBalanceMode as AVCaptureWhiteBalanceMode) as Boolean
		  Return isWhiteBalanceModeSupported_(self, whiteBalanceMode)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LockForConfiguration(byref outError as NSError) As Boolean
		  declare function lockForConfiguration_ lib AVFoundationLib selector "lockForConfiguration:" (obj_id as ptr, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = lockForConfiguration_(self, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RampToVideoZoomFactorWithRate(factor as Double, rate as Double)
		  declare sub rampToVideoZoomFactor_ lib AVFoundationLib selector "rampToVideoZoomFactor:withRate:" (obj_id as ptr, factor as Double, rate as Double)
		  rampToVideoZoomFactor_(self, factor, rate)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub RequestAccessForMediaTypeCompletionHandler(mediaType as CFStringRef, handler as iOSBlock)
		  declare sub requestAccessForMediaType_ lib AVFoundationLib selector "requestAccessForMediaType:completionHandler:" (clsRef as ptr, mediaType as CFStringRef, handler as ptr)
		  requestAccessForMediaType_(ClassRef, mediaType, handler.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExposureModeCustomWithDurationISOCompletionHandler(duration as CMTime, ISO as double, handler as iOSBlock)
		  declare sub setExposureModeCustomWithDuration_ lib AVFoundationLib selector "setExposureModeCustomWithDuration:ISO:completionHandler:" (obj_id as ptr, duration as CMTime, ISO as Double, handler as ptr)
		  setExposureModeCustomWithDuration_(self, duration, ISO, handler.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExposureTargetBiasCompletionHandler(bias as Double, handler as iOSBlock)
		  declare sub setExposureTargetBias_ lib AVFoundationLib selector "setExposureTargetBias:completionHandler:" (obj_id as ptr, bias as Double, handler as ptr)
		  setExposureTargetBias_(self, bias, handler.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetTorchModeOnWithLevelError(torchLevel as double, byref outError as NSError) As Boolean
		  declare function setTorchModeOnWithLevel_ lib AVFoundationLib selector "setTorchModeOnWithLevel:error:" (obj_id as ptr, torchLevel as double, byref outError as ptr) as Boolean
		  dim err as ptr
		  dim result as Boolean = setTorchModeOnWithLevel_(self, torchLevel, err)
		  if err <> nil then
		    outError = new Foundation.NSError(err)
		  end if
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsAVCaptureSessionPreset(preset as CFStringRef) As Boolean
		  declare function supportsAVCaptureSessionPreset_ lib AVFoundationLib selector "supportsAVCaptureSessionPreset:" (obj_id as ptr, preset as CFStringRef) as Boolean
		  Return supportsAVCaptureSessionPreset_(self, preset)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnlockForConfiguration()
		  declare sub unlockForConfiguration_ lib AVFoundationLib selector "unlockForConfiguration" (obj_id as ptr)
		  unlockForConfiguration_(self)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function activeFormat_ lib AVFoundationLib selector "activeFormat" (obj_id as ptr) as ptr
			  Return new AVCaptureDeviceFormat(activeFormat_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub activeFormat_ lib AVFoundationLib selector "setActiveFormat:" (obj_id as ptr, activeFormat as ptr)
			  activeFormat_(self, value)
			End Set
		#tag EndSetter
		activeFormat As AVCaptureDeviceFormat
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function activeVideoMaxFrameDuration_ lib AVFoundationLib selector "activeVideoMaxFrameDuration" (obj_id as ptr) as CMTime
			  Return (activeVideoMaxFrameDuration_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub activeVideoMaxFrameDuration_ lib AVFoundationLib selector "setActiveVideoMaxFrameDuration:" (obj_id as ptr, activeVideoMaxFrameDuration as CMTime)
			  activeVideoMaxFrameDuration_(self, value)
			End Set
		#tag EndSetter
		activeVideoMaxFrameDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function activeVideoMinFrameDuration_ lib AVFoundationLib selector "activeVideoMinFrameDuration" (obj_id as ptr) as CMTime
			  Return (activeVideoMinFrameDuration_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub activeVideoMinFrameDuration_ lib AVFoundationLib selector "setActiveVideoMinFrameDuration:" (obj_id as ptr, activeVideoMinFrameDuration as CMTime)
			  activeVideoMinFrameDuration_(self, value)
			End Set
		#tag EndSetter
		activeVideoMinFrameDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function adjustingExposure_ lib AVFoundationLib selector "isAdjustingExposure" (obj_id as ptr) as Boolean
			  Return adjustingExposure_(self)
			End Get
		#tag EndGetter
		adjustingExposure As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function adjustingFocus_ lib AVFoundationLib selector "isAdjustingFocus" (obj_id as ptr) as Boolean
			  Return adjustingFocus_(self)
			End Get
		#tag EndGetter
		adjustingFocus As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function adjustingWhiteBalance_ lib AVFoundationLib selector "isAdjustingWhiteBalance" (obj_id as ptr) as Boolean
			  Return adjustingWhiteBalance_(self)
			End Get
		#tag EndGetter
		adjustingWhiteBalance As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function autoFocusRangeRestriction_ lib AVFoundationLib selector "autoFocusRangeRestriction" (obj_id as ptr) as AVCaptureAutoFocusRangeRestriction
			  Return (autoFocusRangeRestriction_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub autoFocusRangeRestriction_ lib AVFoundationLib selector "setAutoFocusRangeRestriction:" (obj_id as ptr, autoFocusRangeRestriction as AVCaptureAutoFocusRangeRestriction)
			  autoFocusRangeRestriction_(self, value)
			End Set
		#tag EndSetter
		autoFocusRangeRestriction As AVCaptureAutoFocusRangeRestriction
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function autoFocusRangeRestrictionSupported_ lib AVFoundationLib selector "isAutoFocusRangeRestrictionSupported" (obj_id as ptr) as Boolean
			  Return autoFocusRangeRestrictionSupported_(self)
			End Get
		#tag EndGetter
		autoFocusRangeRestrictionSupported As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function automaticallyAdjustsVideoHDREnabled_ lib AVFoundationLib selector "automaticallyAdjustsVideoHDREnabled" (obj_id as ptr) as Boolean
			  Return automaticallyAdjustsVideoHDREnabled_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub automaticallyAdjustsVideoHDREnabled_ lib AVFoundationLib selector "setAutomaticallyAdjustsVideoHDREnabled:" (obj_id as ptr, automaticallyAdjustsVideoHDREnabled as Boolean)
			  automaticallyAdjustsVideoHDREnabled_(self, value)
			End Set
		#tag EndSetter
		automaticallyAdjustsVideoHDREnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function automaticallyEnablesLowLightBoostWhenAvailable_ lib AVFoundationLib selector "automaticallyEnablesLowLightBoostWhenAvailable" (obj_id as ptr) as Boolean
			  Return automaticallyEnablesLowLightBoostWhenAvailable_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub automaticallyEnablesLowLightBoostWhenAvailable_ lib AVFoundationLib selector "setAutomaticallyEnablesLowLightBoostWhenAvailable:" (obj_id as ptr, automaticallyEnablesLowLightBoostWhenAvailable as Boolean)
			  automaticallyEnablesLowLightBoostWhenAvailable_(self, value)
			End Set
		#tag EndSetter
		automaticallyEnablesLowLightBoostWhenAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function connected_ lib AVFoundationLib selector "isConnected" (obj_id as ptr) as Boolean
			  Return connected_(self)
			End Get
		#tag EndGetter
		connected As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exposureDuration_ lib AVFoundationLib selector "exposureDuration" (obj_id as ptr) as CMTime
			  Return (exposureDuration_(self))
			End Get
		#tag EndGetter
		exposureDuration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exposureMode_ lib AVFoundationLib selector "exposureMode" (obj_id as ptr) as AVCaptureExposureMode
			  Return (exposureMode_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub exposureMode_ lib AVFoundationLib selector "setExposureMode:" (obj_id as ptr, exposureMode as AVCaptureExposureMode)
			  exposureMode_(self, value)
			End Set
		#tag EndSetter
		exposureMode As AVCaptureExposureMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target32Bit
			    declare function exposurePointOfInterest_ lib AVFoundationLib selector "exposurePointOfInterest" (obj_id as ptr) as NSPoint32
			  #elseif Target64Bit
			    declare function exposurePointOfInterest_ lib AVFoundationLib selector "exposurePointOfInterest" (obj_id as ptr) as NSPoint64
			  #Endif
			  Return exposurePointOfInterest_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    declare sub exposurePointOfInterest_ lib AVFoundationLib selector "setExposurePointOfInterest:" (obj_id as ptr, exposurePointOfInterest as NSPoint32)
			    exposurePointOfInterest_(self, value.Value32)
			  #Elseif Target64Bit
			    declare sub exposurePointOfInterest_ lib AVFoundationLib selector "setExposurePointOfInterest:" (obj_id as ptr, exposurePointOfInterest as NSPoint64)
			    exposurePointOfInterest_(self, value.Value64)
			  #Endif
			End Set
		#tag EndSetter
		exposurePointOfInterest As NSPoint
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exposurePointOfInterestSupported_ lib AVFoundationLib selector "isExposurePointOfInterestSupported" (obj_id as ptr) as Boolean
			  Return exposurePointOfInterestSupported_(self)
			End Get
		#tag EndGetter
		exposurePointOfInterestSupported As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exposureTargetBias_ lib AVFoundationLib selector "exposureTargetBias" (obj_id as ptr) as Double
			  Return (exposureTargetBias_(self))
			End Get
		#tag EndGetter
		exposureTargetBias As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function exposureTargetOffset_ lib AVFoundationLib selector "exposureTargetOffset" (obj_id as ptr) as Double
			  Return (exposureTargetOffset_(self))
			End Get
		#tag EndGetter
		exposureTargetOffset As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function flashActive_ lib AVFoundationLib selector "isFlashActive" (obj_id as ptr) as Boolean
			  Return flashActive_(self)
			End Get
		#tag EndGetter
		flashActive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function flashAvailable_ lib AVFoundationLib selector "isFlashAvailable" (obj_id as ptr) as Boolean
			  Return flashAvailable_(self)
			End Get
		#tag EndGetter
		flashAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function flashMode_ lib AVFoundationLib selector "flashMode" (obj_id as ptr) as AVCaptureFlashMode
			  Return (flashMode_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub flashMode_ lib AVFoundationLib selector "setFlashMode:" (obj_id as ptr, flashMode as AVCaptureFlashMode)
			  flashMode_(self, value)
			End Set
		#tag EndSetter
		flashMode As AVCaptureFlashMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function focusMode_ lib AVFoundationLib selector "focusMode" (obj_id as ptr) as AVCaptureFocusMode
			  Return (focusMode_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub focusMode_ lib AVFoundationLib selector "setFocusMode:" (obj_id as ptr, focusMode as AVCaptureFocusMode)
			  focusMode_(self, value)
			End Set
		#tag EndSetter
		focusMode As AVCaptureFocusMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target32Bit
			    declare function focusPointOfInterest_ lib AVFoundationLib selector "focusPointOfInterest" (obj_id as ptr) as NSPoint32
			  #Elseif Target64Bit
			    declare function focusPointOfInterest_ lib AVFoundationLib selector "focusPointOfInterest" (obj_id as ptr) as NSPoint64
			  #Endif
			  Return focusPointOfInterest_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    declare sub focusPointOfInterest_ lib AVFoundationLib selector "setFocusPointOfInterest:" (obj_id as ptr, focusPointOfInterest as NSPoint32)
			    focusPointOfInterest_(self, value.Value32)
			  #Elseif Target64Bit
			    declare sub focusPointOfInterest_ lib AVFoundationLib selector "setFocusPointOfInterest:" (obj_id as ptr, focusPointOfInterest as NSPoint64)
			    focusPointOfInterest_(self, value.Value64)
			  #Endif
			End Set
		#tag EndSetter
		focusPointOfInterest As NSPoint
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function focusPointOfInterestSupported_ lib AVFoundationLib selector "isFocusPointOfInterestSupported" (obj_id as ptr) as Boolean
			  Return focusPointOfInterestSupported_(self)
			End Get
		#tag EndGetter
		focusPointOfInterestSupported As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function formats_ lib AVFoundationLib selector "formats" (obj_id as ptr) as ptr
			  Return new NSArray(formats_(self))
			End Get
		#tag EndGetter
		formats As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hasFlash_ lib AVFoundationLib selector "hasFlash" (obj_id as ptr) as Boolean
			  Return hasFlash_(self)
			End Get
		#tag EndGetter
		hasFlash As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hasTorch_ lib AVFoundationLib selector "hasTorch" (obj_id as ptr) as Boolean
			  Return hasTorch_(self)
			End Get
		#tag EndGetter
		hasTorch As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function ISO_ lib AVFoundationLib selector "ISO" (obj_id as ptr) as Double
			  Return (ISO_(self))
			End Get
		#tag EndGetter
		ISO As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function lensAperture_ lib AVFoundationLib selector "lensAperture" (obj_id as ptr) as Double
			  Return (lensAperture_(self))
			End Get
		#tag EndGetter
		lensAperture As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function lensPosition_ lib AVFoundationLib selector "lensPosition" (obj_id as ptr) as Double
			  Return (lensPosition_(self))
			End Get
		#tag EndGetter
		lensPosition As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function localizedName_ lib AVFoundationLib selector "localizedName" (obj_id as ptr) as CFStringRef
			  Return localizedName_(self)
			End Get
		#tag EndGetter
		localizedName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function lowLightBoostEnabled_ lib AVFoundationLib selector "isLowLightBoostEnabled" (obj_id as ptr) as Boolean
			  Return lowLightBoostEnabled_(self)
			End Get
		#tag EndGetter
		lowLightBoostEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function lowLightBoostSupported_ lib AVFoundationLib selector "isLowLightBoostSupported" (obj_id as ptr) as Boolean
			  Return lowLightBoostSupported_(self)
			End Get
		#tag EndGetter
		lowLightBoostSupported As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maxExposureTargetBias_ lib AVFoundationLib selector "maxExposureTargetBias" (obj_id as ptr) as Double
			  Return (maxExposureTargetBias_(self))
			End Get
		#tag EndGetter
		maxExposureTargetBias As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function maxWhiteBalanceGain_ lib AVFoundationLib selector "maxWhiteBalanceGain" (obj_id as ptr) as Double
			  Return (maxWhiteBalanceGain_(self))
			End Get
		#tag EndGetter
		maxWhiteBalanceGain As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function minExposureTargetBias_ lib AVFoundationLib selector "minExposureTargetBias" (obj_id as ptr) as Double
			  Return (minExposureTargetBias_(self))
			End Get
		#tag EndGetter
		minExposureTargetBias As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function modelID_ lib AVFoundationLib selector "modelID" (obj_id as ptr) as CFStringRef
			  Return modelID_(self)
			End Get
		#tag EndGetter
		modelID As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function position_ lib AVFoundationLib selector "position" (obj_id as ptr) as AVCaptureDevicePosition
			  Return (position_(self))
			End Get
		#tag EndGetter
		position As AVCaptureDevicePosition
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function rampingVideoZoom_ lib AVFoundationLib selector "isRampingVideoZoom" (obj_id as ptr) as Boolean
			  Return rampingVideoZoom_(self)
			End Get
		#tag EndGetter
		rampingVideoZoom As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function smoothAutoFocusEnabled_ lib AVFoundationLib selector "isSmoothAutoFocusEnabled" (obj_id as ptr) as Boolean
			  Return smoothAutoFocusEnabled_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub smoothAutoFocusEnabled_ lib AVFoundationLib selector "setSmoothAutoFocusEnabled:" (obj_id as ptr, smoothAutoFocusEnabled as Boolean)
			  smoothAutoFocusEnabled_(self, value)
			End Set
		#tag EndSetter
		smoothAutoFocusEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function smoothAutoFocusSupported_ lib AVFoundationLib selector "isSmoothAutoFocusSupported" (obj_id as ptr) as Boolean
			  Return smoothAutoFocusSupported_(self)
			End Get
		#tag EndGetter
		smoothAutoFocusSupported As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function subjectAreaChangeMonitoringEnabled_ lib AVFoundationLib selector "isSubjectAreaChangeMonitoringEnabled" (obj_id as ptr) as Boolean
			  Return subjectAreaChangeMonitoringEnabled_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub subjectAreaChangeMonitoringEnabled_ lib AVFoundationLib selector "setSubjectAreaChangeMonitoringEnabled:" (obj_id as ptr, subjectAreaChangeMonitoringEnabled as Boolean)
			  subjectAreaChangeMonitoringEnabled_(self, value)
			End Set
		#tag EndSetter
		subjectAreaChangeMonitoringEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function torchActive_ lib AVFoundationLib selector "isTorchActive" (obj_id as ptr) as Boolean
			  Return torchActive_(self)
			End Get
		#tag EndGetter
		torchActive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function torchAvailable_ lib AVFoundationLib selector "isTorchAvailable" (obj_id as ptr) as Boolean
			  Return torchAvailable_(self)
			End Get
		#tag EndGetter
		torchAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function torchLevel_ lib AVFoundationLib selector "torchLevel" (obj_id as ptr) as Double
			  Return (torchLevel_(self))
			End Get
		#tag EndGetter
		torchLevel As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function torchMode_ lib AVFoundationLib selector "torchMode" (obj_id as ptr) as AVCaptureTorchMode
			  Return (torchMode_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub torchMode_ lib AVFoundationLib selector "setTorchMode:" (obj_id as ptr, torchMode as AVCaptureTorchMode)
			  torchMode_(self, value)
			End Set
		#tag EndSetter
		torchMode As AVCaptureTorchMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function uniqueID_ lib AVFoundationLib selector "uniqueID" (obj_id as ptr) as CFStringRef
			  Return uniqueID_(self)
			End Get
		#tag EndGetter
		uniqueID As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoHDREnabled_ lib AVFoundationLib selector "isVideoHDREnabled" (obj_id as ptr) as Boolean
			  Return videoHDREnabled_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoHDREnabled_ lib AVFoundationLib selector "setVideoHDREnabled:" (obj_id as ptr, videoHDREnabled as Boolean)
			  videoHDREnabled_(self, value)
			End Set
		#tag EndSetter
		videoHDREnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function videoZoomFactor_ lib AVFoundationLib selector "videoZoomFactor" (obj_id as ptr) as Double
			  Return videoZoomFactor_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub videoZoomFactor_ lib AVFoundationLib selector "setVideoZoomFactor:" (obj_id as ptr, videoZoomFactor as Double)
			  videoZoomFactor_(self, value)
			End Set
		#tag EndSetter
		videoZoomFactor As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function whiteBalanceMode_ lib AVFoundationLib selector "whiteBalanceMode" (obj_id as ptr) as AVCaptureWhiteBalanceMode
			  Return (whiteBalanceMode_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub whiteBalanceMode_ lib AVFoundationLib selector "setWhiteBalanceMode:" (obj_id as ptr, whiteBalanceMode as AVCaptureWhiteBalanceMode)
			  whiteBalanceMode_(self, value)
			End Set
		#tag EndSetter
		whiteBalanceMode As AVCaptureWhiteBalanceMode
	#tag EndComputedProperty


	#tag Enum, Name = AVAuthorizationStatus, Type = Integer, Flags = &h0
		NotDetermined = 0
		  Restricted
		  Denied
		Authorized
	#tag EndEnum

	#tag Enum, Name = AVCaptureAutoFocusRangeRestriction, Type = Integer, Flags = &h0
		None = 0
		  Near = 1
		Far = 2
	#tag EndEnum

	#tag Enum, Name = AVCaptureDevicePosition, Type = Integer, Flags = &h0
		Unspecified = 0
		  Back = 1
		Front = 2
	#tag EndEnum

	#tag Enum, Name = AVCaptureExposureMode, Type = Integer, Flags = &h0
		Locked = 0
		  AutoExpose = 1
		  ContinuousAutoExposure = 2
		Custom = 3
	#tag EndEnum

	#tag Enum, Name = AVCaptureFlashMode, Type = Integer, Flags = &h0
		Off = 0
		  On = 1
		Auto = 2
	#tag EndEnum

	#tag Enum, Name = AVCaptureFocusMode, Type = Integer, Flags = &h0
		Locked = 0
		  AutoFocus = 1
		ContinuousAutoFocus = 2
	#tag EndEnum

	#tag Enum, Name = AVCaptureTorchMode, Type = Integer, Flags = &h0
		Off = 0
		  On = 1
		Auto = 2
	#tag EndEnum

	#tag Enum, Name = AVCaptureWhiteBalanceMode, Type = Integer, Flags = &h0
		Locked = 0
		  AutoWhiteBalance = 1
		ContinuousAutoWhiteBalance = 2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="adjustingExposure"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="adjustingFocus"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="adjustingWhiteBalance"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoFocusRangeRestriction"
			Group="Behavior"
			Type="AVCaptureAutoFocusRangeRestriction"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - Near"
				"2 - Far"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoFocusRangeRestrictionSupported"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="automaticallyAdjustsVideoHDREnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="automaticallyEnablesLowLightBoostWhenAvailable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="connected"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="exposureMode"
			Group="Behavior"
			Type="AVCaptureExposureMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Locked"
				"1 - AutoExpose"
				"2 - ContinuousAutoExposure"
				"3 - Custom"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="exposurePointOfInterestSupported"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="exposureTargetBias"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="exposureTargetOffset"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="flashActive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="flashAvailable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="flashMode"
			Group="Behavior"
			Type="AVCaptureFlashMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - On"
				"2 - Auto"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="focusMode"
			Group="Behavior"
			Type="AVCaptureFocusMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Locked"
				"1 - AutoFocus"
				"2 - ContinuousAutoFocus"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="focusPointOfInterestSupported"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasFlash"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasTorch"
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
			Name="ISO"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lensAperture"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lensPosition"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="localizedName"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lowLightBoostEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lowLightBoostSupported"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="maxExposureTargetBias"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="maxWhiteBalanceGain"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="minExposureTargetBias"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="position"
			Group="Behavior"
			Type="AVCaptureDevicePosition"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unspecified"
				"1 - Back"
				"2 - Front"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="rampingVideoZoom"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="smoothAutoFocusEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="smoothAutoFocusSupported"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="subjectAreaChangeMonitoringEnabled"
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
		#tag ViewProperty
			Name="torchActive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="torchAvailable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="torchLevel"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="torchMode"
			Group="Behavior"
			Type="AVCaptureTorchMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - On"
				"2 - Auto"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="uniqueID"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoHDREnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="videoZoomFactor"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="whiteBalanceMode"
			Group="Behavior"
			Type="AVCaptureWhiteBalanceMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Locked"
				"1 - AutoWhiteBalance"
				"2 - ContinuousAutoWhiteBalance"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
