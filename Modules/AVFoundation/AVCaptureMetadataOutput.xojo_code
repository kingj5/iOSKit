#tag Class
Protected Class AVCaptureMetadataOutput
Inherits AVFoundation.AVCaptureOutput
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("AVCaptureMetadataOutput")
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
		  Super.Constructor( Initialize(Allocate(ClassRef)) )
		  
		  dim target as ptr = Initialize(Allocate(TargetClass))
		  if dispatch = nil then dispatch = new xojo.Core.Dictionary
		  dispatch.Value(Target) = self
		  
		  Declare Function dlopen Lib "/usr/lib/libSystem.dylib" ( path As CString, mode As Int32 ) As Ptr
		  Declare Function dlsym Lib "/usr/lib/libSystem.dylib" ( handle As Ptr, name As CString ) As ptr
		  
		  dim sysLib as ptr = dlopen("/usr/lib/libSystem.B.dylib",5)
		  dim disp as ptr = dlsym(sysLib,"_dispatch_main_q")
		  
		  SetMetadataObjectsDelegateQueue(Target, disp)
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidOutputMetadataObjects(output as ptr, metaDataObjects as ptr, connection as ptr)
		  #Pragma StackOverflowChecking false
		  #Pragma DisableBackgroundTasks
		  
		  pOutput = output
		  pMetadataObjects = metaDataObjects
		  pConnection = connection
		  done = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didOutputMetadataObjectFromConnection(pid as ptr, sel as ptr, captureOutput as ptr, metadataObjects as ptr, connection as ptr)
		  #Pragma StackOverflowChecking
		  #Pragma DisableBackgroundTasks
		  
		  declare function retain lib FoundationLib selector "retain" (obj_id as ptr) as ptr
		  
		  #Pragma warning "this method may leak memory"
		  if metadataObjects <> nil then
		    AVCaptureMetadataOutput(dispatch.Value(pid)).HandleDidOutputMetadataObjects( retain(captureOutput), retain(metadataObjects), retain(connection) )
		  end if
		  
		  #Pragma unused sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OutputHandler()
		  if done then
		    RaiseEvent DidOutputMetadataObjects(new AVFoundation.AVCaptureOutput(pOutput), new Foundation.NSArray(pMetadataObjects), new AVFoundation.AVCaptureConnection(pConnection))
		    
		    declare sub release lib FoundationLib selector "release" (obj_id as ptr)
		    release pConnection
		    release pMetadataObjects
		    release pOutput
		  else
		    xojo.core.Timer.CallLater( 2, AddressOf OutputHandler )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMetadataObjectsDelegateQueue(objectsDelegate as ptr, objectsCallbackQueue as ptr)
		  declare sub setMetadataObjectsDelegate_ lib AVFoundationLib selector "setMetadataObjectsDelegate:queue:" (obj_id as ptr, objectsDelegate as ptr, objectsCallbackQueue as ptr)
		  setMetadataObjectsDelegate_(self, objectsDelegate, objectsCallbackQueue)
		  
		  xojo.core.Timer.CallLater( 2, AddressOf OutputHandler )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("captureOutput:didOutputMetadataObjects:fromConnection:", AddressOf impl_didOutputMetadataObjectFromConnection, "v@:@@@")
		    
		    targetID = BuildTargetClass("NSObject","AVCaptureMetadataDelegate",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidOutputMetadataObjects(output as AVFoundation.AVCaptureOutput , metadataObjects as Foundation.NSArray, connection as AVFoundation.AVCaptureConnection)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function availableMetadataObjectTypes_ lib AVFoundationLib selector "availableMetadataObjectTypes" (obj_id as ptr) as ptr
			  Return new NSArray(availableMetadataObjectTypes_(self))
			End Get
		#tag EndGetter
		availableMetadataObjectTypes As NSArray
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private done As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function metadataObjectsCallbackQueue_ lib AVFoundationLib selector "metadataObjectsCallbackQueue" (obj_id as ptr) as ptr
			  Return (metadataObjectsCallbackQueue_(self))
			End Get
		#tag EndGetter
		metadataObjectsCallbackQueue As ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function metadataObjectsDelegate_ lib AVFoundationLib selector "metadataObjectsDelegate" (obj_id as ptr) as ptr
			  Return (metadataObjectsDelegate_(self))
			End Get
		#tag EndGetter
		metadataObjectsDelegate As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function metadataObjectTypes_ lib AVFoundationLib selector "metadataObjectTypes" (obj_id as ptr) as ptr
			  Return new NSArray(metadataObjectTypes_(self))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub metadataObjectTypes_ lib AVFoundationLib selector "setMetadataObjectTypes:" (obj_id as ptr, metadataObjectTypes as ptr)
			  metadataObjectTypes_(self, value)
			End Set
		#tag EndSetter
		metadataObjectTypes As NSArray
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private pConnection As ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pMetadataObjects As ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pOutput As ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target32Bit
			    declare function rectOfInterest_ lib AVFoundationLib selector "rectOfInterest" (obj_id as ptr) as NSRect32
			  #elseif Target64Bit
			    declare function rectOfInterest_ lib AVFoundationLib selector "rectOfInterest" (obj_id as ptr) as NSRect64
			  #Endif
			  Return rectOfInterest_(self)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    declare sub rectOfInterest_ lib AVFoundationLib selector "setRectOfInterest:" (obj_id as ptr, rectOfInterest as NSRect32)
			    rectOfInterest_(self, value.Value32)
			  #elseif Target64Bit
			    declare sub rectOfInterest_ lib AVFoundationLib selector "setRectOfInterest:" (obj_id as ptr, rectOfInterest as NSRect64)
			    rectOfInterest_(self, value.Value64)
			  #Endif
			  
			End Set
		#tag EndSetter
		rectOfInterest As NSRect
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
