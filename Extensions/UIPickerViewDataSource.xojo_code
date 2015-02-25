#tag Class
Protected Class UIPickerViewDataSource
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddColumn(values() as text)
		  Columns.Append values
		  ReloadColumn(Columns.Ubound)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(ref as ptr) -- From NSObject
		  
		  dim targetCls as ptr = TargetClass
		  dim selfRef as ptr = Allocate(targetCls)
		  selfRef = Initialize(selfRef)
		  Super.Constructor(selfref)
		  
		  using Xojo.Core
		  if dispatch = nil then dispatch = new Dictionary
		  dispatch.Value(selfRef) = self
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_attributedTitleForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as Integer) As ptr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didSelectRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as integer)
		  UIPickerViewDataSource(dispatch.Value(pid)).SelectRowAndComponent(row,component)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_numberOfComponents(pid as ptr, sel as ptr, picker as ptr) As Integer
		  return UIPickerViewDataSource(dispatch.Value(pid)).Columns.Ubound+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_numberOfRowsInComponent(pid as ptr, sel as ptr, picker as ptr, component as integer) As Integer
		  dim rows() as text = UIPickerViewDataSource(dispatch.Value(pid)).Columns(component)
		  Return rows.Ubound+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_rowHeightForComponent(pid as ptr, sel as ptr, picker as ptr, compentent as integer) As Double
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_titleForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as Integer, component as integer) As CFStringRef
		  return UIPickerViewDataSource(dispatch.Value(pid)).TextInRowAndColumn(row,component)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_viewForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as integer, view as ptr) As ptr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_widthForComponent(pid as ptr, sel as ptr, picker as ptr, compentent as integer) As Double
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reload()
		  Declare Sub reloadAllComponents lib "Cocoa" selector "reloadAllComponents:" (obj_ref As Ptr)
		  
		  reloadAllComponents(myPicker.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReloadColumn(column as integer)
		  Declare Sub reloadComponent lib "Cocoa" selector "reloadComponent:" (obj_ref As Ptr, component As Integer)
		  
		  reloadComponent(myPicker.Handle, column)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveColumn(column as integer)
		  if column<0 or column>columns.Ubound then Return
		  columns.Remove column
		  Reload
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRow(Column As integer) As integer
		  Declare Function selectedRowInComponent lib "Cocoa" selector "selectedRowInComponent:" (obj_ref As Ptr, component As Integer) As Integer
		  
		  Return selectedRowInComponent(myPicker.Handle, Column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedRow(column As Integer, Assigns value As Integer)
		  Declare Sub selectRowinComponentanimated lib "Cocoa" selector "selectRow:inComponent:animated:" (obj_ref As Ptr, row As Integer, component As Integer, animated As Boolean)
		  
		  selectRowinComponentanimated(myPicker.Handle, value, column, true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectRowAndComponent(row as integer, component as integer)
		  RaiseEvent SelectionChanged(row,component)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    using UIKit
		    dim methods() as TargetClassMethodHelper
		    //delegate methods
		    'methods.Append new TargetClassMethodHelper("pickerView:rowHeightForComponent:", AddressOf impl_rowHeightForComponent, "f@:@i")
		    'methods.Append new TargetClassMethodHelper("pickerView:widthForComponent:", AddressOf impl_widthForComponent, "f@:@@")
		    methods.Append new TargetClassMethodHelper("pickerView:titleForRow:forComponent:", AddressOf impl_titleForRowAndComponent, "*@:@ii")
		    'methods.Append new TargetClassMethodHelper("pickerView:attributedTitleForRow:forComponent:", AddressOf impl_attributedTitleForRowAndComponent, "@@:@ii")
		    'methods.Append new TargetClassMethodHelper("pickerView:viewForRow:forComponent:reusingView:", AddressOf impl_viewForRowAndComponent, "@@:@ii@")
		    methods.Append new TargetClassMethodHelper("pickerView:didSelectRow:inComponent:", AddressOf impl_didSelectRowAndComponent, "v@:@ii")
		    
		    //datasource methods
		    methods.Append new TargetClassMethodHelper("numberOfComponentsInPickerView:", AddressOf impl_numberOfComponents, "i@:@")
		    methods.Append new TargetClassMethodHelper("pickerView:numberOfRowsInComponent:", AddressOf impl_numberOfRowsInComponent, "i@:@i")
		    
		    targetID = BuildTargetClass("NSObject","MyUIPickerDelegateClass",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextInRowAndColumn(row as integer, column as integer) As Text
		  if column < 0 or column>columns.Ubound then Return " "
		  dim rows() as Text = columns(column)
		  if row < 0 or row > rows.Ubound then Return " " 
		  Return rows(row)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event SelectionChanged(row as integer, column as integer)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected Columns() As Auto
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As Xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		myPicker As Extensions.PickerView
	#tag EndProperty


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
