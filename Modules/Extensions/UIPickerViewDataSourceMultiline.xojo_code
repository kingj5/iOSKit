#tag Class
Protected Class UIPickerViewDataSourceMultiline
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
		  if viewsDictionary = nil then viewsDictionary = new Dictionary
		  dispatch.Value(selfRef) = xojo.core.WeakRef.Create(self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_attributedTitleForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as Integer) As ptr
		  #Pragma Unused pid
		  #Pragma Unused sel
		  #Pragma Unused picker
		  #Pragma Unused row
		  #Pragma Unused component
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didSelectRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as integer)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UIPickerViewDataSourceMultiline(w.Value).SelectRowAndComponent(row,component)
		  end if
		  
		  #Pragma Unused sel
		  #Pragma Unused picker
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_numberOfComponents(pid as ptr, sel as ptr, picker as ptr) As Integer
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    return UIPickerViewDataSourceMultiline(w.Value).Columns.Ubound+1
		  end if
		  
		  #Pragma Unused sel
		  #Pragma Unused picker
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_numberOfRowsInComponent(pid as ptr, sel as ptr, picker as ptr, component as integer) As Integer
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    dim rows() as text = UIPickerViewDataSourceMultiline(w.Value).Columns(component)
		    Return rows.Ubound+1
		  end if
		  
		  #Pragma Unused sel
		  #Pragma Unused picker
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_rowHeightForComponent(pid as ptr, sel as ptr, picker as ptr, component as integer) As Double
		  Return 44
		  
		  #Pragma Unused pid
		  #Pragma Unused sel
		  #Pragma Unused picker
		  #Pragma Unused component
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_titleForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as Integer, component as integer) As CFStringRef
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    return UIPickerViewDataSourceMultiline(w.Value).TextInRowAndColumn(row,component)
		  end if
		  
		  #Pragma Unused sel
		  #Pragma Unused picker
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_viewForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as integer, view as ptr) As ptr
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    dim theView as iOSTextArea
		    theView = new iOSTextArea
		    theView.Editable = False
		    
		    #if Target32Bit
		      declare sub setFrame lib UIKitLib selector "setFrame:" (obj_id as ptr, frame as NSRect32)
		    #Elseif Target64Bit
		      declare sub setFrame lib UIKitLib selector "setFrame:" (obj_id as ptr, frame as NSRect64)
		    #Endif
		    dim rect as new NSRect
		    rect.rsize.w = UIPickerViewDataSourceMultiline(w.Value).myPicker.Width/impl_numberOfComponents(pid,sel,picker)
		    rect.rsize.h = 44
		    
		    #if Target32Bit
		      setFrame(theView.Handle, rect.Value32)
		    #Elseif Target64Bit
		      setFrame(theView.Handle, rect.Value64)
		    #Endif
		    
		    theView.Text = UIPickerViewDataSourceMultiline(w.Value).TextInRowAndColumn(row,component)
		    Return theView.Handle
		  End if
		  
		  #Pragma Unused view
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_widthForComponent(pid as ptr, sel as ptr, picker as ptr, component as integer) As Double
		  #Pragma Unused pid
		  #Pragma Unused sel
		  #Pragma Unused picker
		  #Pragma Unused component
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reload()
		  if viewsDictionary.HasKey(myPicker.Handle) then
		    viewsDictionary.Remove(myPicker.Handle)
		  end if
		  
		  Declare Sub reloadAllComponents lib UIKitLib selector "reloadAllComponents" (obj_ref As Ptr)
		  
		  reloadAllComponents(myPicker.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReloadColumn(column as integer)
		  if viewsDictionary.HasKey(myPicker.Handle) then
		    viewsDictionary.Remove(myPicker.Handle)
		  end if
		  
		  Declare Sub reloadComponent lib UIKitLib selector "reloadComponent:" (obj_ref As Ptr, component As Integer)
		  
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
		Function SelectedRowInColumn(Column As integer) As integer
		  Declare Function selectedRowInComponent lib UIKitLib selector "selectedRowInComponent:" (obj_ref As Ptr, component As Integer) As Integer
		  
		  Return selectedRowInComponent(myPicker.Handle, Column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedRowInColumn(column As Integer, Assigns value As Integer)
		  Declare Sub selectRowinComponentanimated lib UIKitLib selector "selectRow:inComponent:animated:" (obj_ref As Ptr, row As Integer, component As Integer, animated As Boolean)
		  
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
		    methods.Append new TargetClassMethodHelper("pickerView:rowHeightForComponent:", AddressOf impl_rowHeightForComponent, "f@:@l")
		    'methods.Append new TargetClassMethodHelper("pickerView:widthForComponent:", AddressOf impl_widthForComponent, "f@:@@")
		    'methods.Append new TargetClassMethodHelper("pickerView:titleForRow:forComponent:", AddressOf impl_titleForRowAndComponent, "*@:@ii")
		    'methods.Append new TargetClassMethodHelper("pickerView:attributedTitleForRow:forComponent:", AddressOf impl_attributedTitleForRowAndComponent, "@@:@ll")
		    methods.Append new TargetClassMethodHelper("pickerView:viewForRow:forComponent:reusingView:", AddressOf impl_viewForRowAndComponent, "@@:@ll@")
		    methods.Append new TargetClassMethodHelper("pickerView:didSelectRow:inComponent:", AddressOf impl_didSelectRowAndComponent, "v@:@ii")
		    
		    //datasource methods
		    methods.Append new TargetClassMethodHelper("numberOfComponentsInPickerView:", AddressOf impl_numberOfComponents, "i@:@")
		    methods.Append new TargetClassMethodHelper("pickerView:numberOfRowsInComponent:", AddressOf impl_numberOfRowsInComponent, "i@:@i")
		    
		    targetID = BuildTargetClass("NSObject","MyUIPickerMultilineDelegateClass",methods)
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
		myPicker As Extensions.PickerViewMultiline
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared viewsDictionary As xojo.Core.Dictionary
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
