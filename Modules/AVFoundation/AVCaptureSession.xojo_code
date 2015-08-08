#tag Class
Protected Class AVCaptureSession
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddConnection(connection as AVCaptureConnection)
		  declare sub addConnection_ lib AVFoundationLib selector "addConnection:" (obj_id as ptr, connection as ptr)
		  addConnection_(self, connection)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddInput(input as AVCaptureInput)
		  declare sub addInput_ lib AVFoundationLib selector "addInput:" (obj_id as ptr, input as ptr)
		  addInput_(self, input)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddInputWithNoConnections(input as AVCaptureInput)
		  declare sub addInputWithNoConnections_ lib AVFoundationLib selector "addInputWithNoConnections:" (obj_id as ptr, input as ptr)
		  addInputWithNoConnections_(self, input)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddOutput(output as AVCaptureOutput)
		  declare sub addOutput_ lib AVFoundationLib selector "addOutput:" (obj_id as ptr, output as ptr)
		  addOutput_(self, output)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddOutputWithNoConnections(output as AVCaptureOutput)
		  declare sub addOutputWithNoConnections_ lib AVFoundationLib selector "addOutputWithNoConnections:" (obj_id as ptr, output as ptr)
		  addOutputWithNoConnections_(self, output)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginConfiguration()
		  declare sub beginConfiguration_ lib AVFoundationLib selector "beginConfiguration" (obj_id as ptr)
		  beginConfiguration_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanAddConnection(connection as AVCaptureConnection) As Boolean
		  declare function canAddConnection_ lib AVFoundationLib selector "canAddConnection:" (obj_id as ptr, connection as ptr) as Boolean
		  Return canAddConnection_(self, connection)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanAddInput(input as AVCaptureInput) As Boolean
		  declare function canAddInput_ lib AVFoundationLib selector "canAddInput:" (obj_id as ptr, input as ptr) as Boolean
		  Return canAddInput_(self, input)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanAddOutput(output as AVCaptureOutput) As Boolean
		  declare function canAddOutput_ lib AVFoundationLib selector "canAddOutput:" (obj_id as ptr, output as ptr) as Boolean
		  Return canAddOutput_(self, output)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanSetSessionPreset(preset as CFStringRef) As Boolean
		  declare function canSetSessionPreset_ lib AVFoundationLib selector "canSetSessionPreset:" (obj_id as ptr, preset as CFStringRef) as Boolean
		  Return canSetSessionPreset_(self, preset)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureSession")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CommitConfiguration()
		  declare sub commitConfiguration_ lib AVFoundationLib selector "commitConfiguration" (obj_id as ptr)
		  commitConfiguration_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  Super.Constructor( Initialize(Allocate(ClassRef)) )
		  
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveConnection(connection as AVCaptureConnection)
		  declare sub removeConnection_ lib AVFoundationLib selector "removeConnection:" (obj_id as ptr, connection as ptr)
		  removeConnection_(self, connection)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveInput(input as AVCaptureInput)
		  declare sub removeInput_ lib AVFoundationLib selector "removeInput:" (obj_id as ptr, input as ptr)
		  removeInput_(self, input)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveOutput(output as AVCaptureOutput)
		  declare sub removeOutput_ lib AVFoundationLib selector "removeOutput:" (obj_id as ptr, output as ptr)
		  removeOutput_(self, output)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartRunning()
		  declare sub startRunning_ lib AVFoundationLib selector "startRunning" (obj_id as ptr)
		  startRunning_(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopRunning()
		  declare sub stopRunning_ lib AVFoundationLib selector "stopRunning" (obj_id as ptr)
		  stopRunning_(self)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function automaticallyConfiguresApplicationAudioSession_ lib AVFoundationLib selector "automaticallyConfiguresApplicationAudioSession" (obj_id as ptr) as Boolean
			  Return automaticallyConfiguresApplicationAudioSession_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub automaticallyConfiguresApplicationAudioSession_ lib AVFoundationLib selector "setAutomaticallyConfiguresApplicationAudioSession:" (obj_id as ptr, automaticallyConfiguresApplicationAudioSession as Boolean)
			  automaticallyConfiguresApplicationAudioSession_(self, value)
			End Set
		#tag EndSetter
		automaticallyConfiguresApplicationAudioSession As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function inputs_ lib AVFoundationLib selector "inputs" (obj_id as ptr) as ptr
			  Return new NSArray(inputs_(self))
			End Get
		#tag EndGetter
		inputs As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function interrupted_ lib AVFoundationLib selector "isInterrupted" (obj_id as ptr) as Boolean
			  Return interrupted_(self)
			End Get
		#tag EndGetter
		interrupted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function outputs_ lib AVFoundationLib selector "outputs" (obj_id as ptr) as ptr
			  Return new NSArray(outputs_(self))
			End Get
		#tag EndGetter
		outputs As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function running_ lib AVFoundationLib selector "isRunning" (obj_id as ptr) as Boolean
			  Return running_(self)
			End Get
		#tag EndGetter
		running As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sessionPreset_ lib AVFoundationLib selector "sessionPreset" (obj_id as ptr) as CFStringRef
			  Return sessionPreset_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub sessionPreset_ lib AVFoundationLib selector "setSessionPreset:" (obj_id as ptr, sessionPreset as CFStringRef)
			  sessionPreset_(self, value)
			End Set
		#tag EndSetter
		sessionPreset As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function usesApplicationAudioSession_ lib AVFoundationLib selector "usesApplicationAudioSession" (obj_id as ptr) as Boolean
			  Return usesApplicationAudioSession_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub usesApplicationAudioSession_ lib AVFoundationLib selector "setUsesApplicationAudioSession:" (obj_id as ptr, usesApplicationAudioSession as Boolean)
			  usesApplicationAudioSession_(self, value)
			End Set
		#tag EndSetter
		usesApplicationAudioSession As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="automaticallyConfiguresApplicationAudioSession"
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
			Name="interrupted"
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
			Name="running"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sessionPreset"
			Group="Behavior"
			Type="Text"
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
			Name="usesApplicationAudioSession"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
