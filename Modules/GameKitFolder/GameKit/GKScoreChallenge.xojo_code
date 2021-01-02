#tag Class
Protected Class GKScoreChallenge
Inherits GameKit.GKChallenge
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("GKScoreChallenge")
		  return ref
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function score_ lib GameKitLib selector "score" (obj_id as ptr) as ptr
			  Return new GKScore(score_(self))
			End Get
		#tag EndGetter
		score As GKScore
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="state"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="GKChallengeState"
			EditorType="Enum"
			#tag EnumValues
				"0 - Invalid"
				"1 - Pending"
				"2 - Completed"
				"3 - Declined"
			#tag EndEnumValues
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
