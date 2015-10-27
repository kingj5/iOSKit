#tag Class
Class CMMotionManager
Inherits NSObject
	#tag Method, Flags = &h0
		Function accelerometerActive() As Boolean
		  declare function isAccelerometerActive lib CoreMotionLib selector "isAccelerometerActive" _
		  (obj_id as ptr) as Boolean
		  Return isAccelerometerActive(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function accelerometerAvailable() As Boolean
		  declare function isAccelerometerAvailable lib CoreMotionLib selector "isAccelerometerAvailable" _
		  (obj_id as ptr) as Boolean
		  Return isAccelerometerAvailable(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor(Initialize(Allocate(NSClassFromString("CMMotionManager"))))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function deviceMotionActive() As Boolean
		  declare function isDeviceMotionActive lib CoreMotionLib selector "isDeviceMotionActive" _
		  (obj_id as ptr) as Boolean
		  Return isDeviceMotionActive(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function deviceMotionAvailable() As Boolean
		  declare function isDeviceMotionAvailable lib CoreMotionLib selector "isDeviceMotionAvailable" _
		  (obj_id as ptr) as Boolean
		  Return isDeviceMotionAvailable(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function gyroActive() As Boolean
		  declare function isGyroActive lib CoreMotionLib selector "isGyroActive" _
		  (obj_id as ptr) as Boolean
		  Return isGyroActive(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function gyroAvailable() As Boolean
		  declare function isGyroAvailable lib CoreMotionLib selector "isGyroAvailable" _
		  (obj_id as ptr) as Boolean
		  Return isGyroAvailable(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startAccelerometerUpdates()
		  declare sub startAccelerometerUpdates_ lib CoreMotionLib selector "startAccelerometerUpdates" _
		  (obj_id as ptr)
		  startAccelerometerUpdates_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startDeviceMotionUpdates()
		  declare sub startDeviceMotionUpdates_ lib CoreMotionLib selector "startDeviceMotionUpdates" _
		  (obj_id as ptr)
		  startDeviceMotionUpdates_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startGyroUpdates()
		  declare sub startGyroUpdates_ lib CoreMotionLib selector "startGyroUpdates" _
		  (obj_id as ptr)
		  startGyroUpdates_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stopAccelerometerUpdates()
		  declare sub stopAccelerometerUpdates_ lib CoreMotionLib selector "stopAccelerometerUpdates" _
		  (obj_id as ptr)
		  stopAccelerometerUpdates_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stopDeviceMotionUpdates()
		  declare sub stopdeviceMotionUpdates_ lib CoreMotionLib selector "stopDeviceMotionUpdates" _
		  (obj_id as ptr)
		  stopdeviceMotionUpdates_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stopGyroUpdates()
		  declare sub stopGyroUpdates_ lib CoreMotionLib selector "stopGyroUpdates" _
		  (obj_id as ptr)
		  stopGyroUpdates_(self)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function accelerometerData_ lib CoreMotionLib selector "accelerometerData" _
			  (obj_id as ptr) as ptr
			  Return new CMAccelerometerData(accelerometerData_(self))
			End Get
		#tag EndGetter
		accelerometerData As CMAccelerometerData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function accelerometerUpdateInterval_ lib CoreMotionLib selector "accelerometerUpdateInterval"_
			  (obj_id as ptr) as Double
			  Return accelerometerUpdateInterval_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setAccelerometerUpdateInterval lib CoreMotionLib selector "setAccelerometerUpdateInterval:" _
			  (obj_id as ptr, interval as Double)
			  setAccelerometerUpdateInterval(self,value)
			End Set
		#tag EndSetter
		accelerometerUpdateInterval As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function deviceMotion_ lib CoreMotionLib selector "deviceMotion" _
			  (obj_id as ptr) as ptr
			  Return new CMDeviceMotion(deviceMotion_(self))
			End Get
		#tag EndGetter
		deviceMotion As CMDeviceMotion
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function deviceMotionUpdateInterval_ lib CoreMotionLib selector "deviceMotionUpdateInterval" _
			  (obj_id as ptr) as Double
			  Return deviceMotionUpdateInterval_(self)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setDeviceMotionUpdateInterval lib CoreMotionLib selector "setDeviceMotionUpdateInterval:" _
			  (obj_id as ptr, interval as Double)
			  setDeviceMotionUpdateInterval(self,value)
			End Set
		#tag EndSetter
		deviceMotionUpdateInterval As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function gyroData_ lib CoreMotionLib selector "gyroData" _
			  (obj_id as ptr) as ptr
			  Return new CMGyroData(gyroData_(self))
			End Get
		#tag EndGetter
		gyroData As CMGyroData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function gyroUpdateInterval_ lib CoreMotionLib selector "gyroUpdateInterval"_
			  (obj_id as ptr) as Double
			  Return gyroUpdateInterval_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setGyroUpdateInterval lib CoreMotionLib selector "setGyroUpdateInterval:" _
			  (obj_id as ptr, interval as Double)
			  setGyroUpdateInterval(self,value)
			End Set
		#tag EndSetter
		gyroUpdateInterval As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="accelerometerUpdateInterval"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="deviceMotionUpdateInterval"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gyroUpdateInterval"
			Group="Behavior"
			Type="Double"
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
