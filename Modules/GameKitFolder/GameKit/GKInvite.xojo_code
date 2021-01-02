#tag Class
Protected Class GKInvite
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKInvite")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function hosted_ lib GameKitLib selector "isHosted" (obj_id as ptr) as Boolean
			  Return hosted_(self)
			End Get
		#tag EndGetter
		hosted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function playerAttributes_ lib GameKitLib selector "playerAttributes" (obj_id as ptr) as UInt32
			  Return (playerAttributes_(self))
			End Get
		#tag EndGetter
		playerAttributes As uint32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function playerGroup_ lib GameKitLib selector "playerGroup" (obj_id as ptr) as UInteger
			  Return playerGroup_(self)
			End Get
		#tag EndGetter
		playerGroup As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function sender_ lib GameKitLib selector "sender" (obj_id as ptr) as ptr
			  Return new GKPlayer(sender_(self))
			End Get
		#tag EndGetter
		sender As GKPlayer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="hosted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="playerAttributes"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="uint32"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="playerGroup"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInteger"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
