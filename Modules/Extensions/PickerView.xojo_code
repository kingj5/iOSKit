#tag Class
Protected Class PickerView
Inherits iOSUserControl
	#tag Event
		Function CreateView() As UInteger
		  #if Target32Bit
		    declare function initWithFrame lib FoundationLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect32) as ptr
		  #Elseif Target64Bit
		    declare function initWithFrame lib FoundationLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect64) as ptr
		  #Endif
		  
		  Declare Function alloc Lib FoundationLib selector "alloc" (classRef As Ptr) As Ptr
		  
		  Dim frame as new NSRect
		  frame.origin.x = 0.0
		  frame.origin.y = 0.0
		  frame.rsize.w = 100
		  frame.rsize.h = 100
		  
		  Declare Sub setDelegate Lib UIKitLib selector "setDelegate:" (obj_id As ptr, del As ptr)
		  Declare Sub setDataSource Lib UIKitLib selector "setDataSource:" (obj_id As ptr, source As ptr)
		  
		  #if Target32Bit
		    dim selfRef as ptr = initWithFrame(alloc(NSClassFromString("UIPickerView")), frame.Value32)
		  #Elseif Target64Bit
		    dim selfRef as ptr = initWithFrame(alloc(NSClassFromString("UIPickerView")), frame.Value64)
		  #Endif
		  
		  dataSource = new UIPickerViewDataSource
		  dataSource.myPicker = self
		  AddHandler dataSource.SelectionChanged, AddressOf HandleSelectionChange
		  
		  setDelegate(selfRef,dataSource)
		  setDataSource(selfRef,dataSource)
		  
		  Return UInteger(selfRef)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddColumn(values() as text)
		  dataSource.AddColumn(values)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HandleSelectionChange(sender as Extensions.UIPickerViewDataSource, row as integer, column as integer)
		  RaiseEvent SelectionChanged(row,column)
		  
		  #Pragma Unused sender
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveColumn(column as integer)
		  dataSource.RemoveColumn(column)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRow(Column As integer) As integer
		  Return dataSource.SelectedRow(Column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedRow(column As Integer, Assigns value As Integer)
		  dataSource.SelectedRow(column) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text(row as integer, column as integer) As Text
		  Return dataSource.TextInRowAndColumn(row,column)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event SelectionChanged(row as integer, column as integer)
	#tag EndHook


	#tag Property, Flags = &h21
		Private dataSource As Extensions.UIPickerViewDataSource
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityHint"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
