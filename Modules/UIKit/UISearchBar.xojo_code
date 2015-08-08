#tag Class
Class UISearchBar
Inherits iOSUserControl
	#tag Event
		Function CreateView() As UInteger
		  #If Target32Bit
		    declare function initWithFrame lib UIKitLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect32) as ptr
		  #Elseif Target64Bit
		    declare function initWithFrame lib UIKitLib selector "initWithFrame:" (obj_id as ptr, frame as NSRect64) as ptr
		  #Endif
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  dim frame as new NSRect
		  frame.rsize.w = 100
		  frame.rsize.h = 100
		  #if Target32Bit
		    dim selfRef as ptr = initWithFrame(alloc(ClassRef),frame.Value32)
		  #Elseif Target64Bit
		    dim selfRef as ptr = initWithFrame(alloc(ClassRef),frame.Value64)
		  #Endif
		  
		  declare function init lib FoundationLib selector "init" (obj_id as ptr) as ptr
		  dim del as ptr = init(alloc(TargetClass))
		  
		  declare sub setDelegate lib UIKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
		  setDelegate(selfRef,del)
		  
		  using Xojo.Core
		  if dispatch = nil then dispatch = new Dictionary
		  dispatch.Value(del) = xojo.core.WeakRef.Create(self)
		  
		  Return UInteger(selfRef)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BackgroundImageForBarPositionBarMetrics(barPosition as UIBarPosition, barMetrics as UIBarMetrics) As iOSImage
		  declare function backgroundImageForBarPosition_ lib UIKitLib selector "backgroundImageForBarPosition:barMetrics:" (obj_id as ptr, barPosition as UIBarPosition, barMetrics as UIBarMetrics) as ptr
		  Return iOSImage.fromHandle(backgroundImageForBarPosition_(self.Handle, barPosition, barMetrics))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as ptr = NSClassFromString("UISearchBar")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ref as ptr)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From iOSUserControl
		  // Constructor() -- From iOSControl
		  // Constructor(deserializer As xojo.Core._Deserializer) -- From iOSControl
		  Super.Constructor
		  m_id = ref
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DismissKeyboard()
		  declare sub resignFirstResponder lib FoundationLib selector "resignFirstResponder" (obj_id as ptr)
		  resignFirstResponder(self.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  if m_id = Nil then
		    Return Super.Handle
		  else
		    Return m_id
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleBookmarkButton()
		  RaiseEvent BookmarkButtonPressed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleCancelButton()
		  RaiseEvent CancelButtonPressed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidBeginEditing()
		  RaiseEvent GotFocus
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleResultListButton()
		  RaiseEvent ResultListButtonPressed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleScopeButtonChanged(newIndex as Integer)
		  RaiseEvent ScopeButtonChanged(newindex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSearchButton()
		  RaiseEvent SearchButtonPressed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTextChanged(newText as Text)
		  RaiseEvent TextChanged(newtext)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageForSearchBarIconState(icon as UISearchBarIcon, state as UIControlState) As iOSImage
		  declare function imageForSearchBarIcon_ lib UIKitLib selector "imageForSearchBarIcon:state:" (obj_id as ptr, icon as UISearchBarIcon, state as UIControlState) as ptr
		  Return iOSImage.fromHandle(imageForSearchBarIcon_(self.Handle, icon, state))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_bookmarkButtonPressed(pid as ptr, sel as ptr, searchbar as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UISearchBar(w.Value).HandleBookmarkButton
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused searchbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_cancelButtonPressed(pid as ptr, sel as ptr, searchbar as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UISearchBar(w.Value).HandleCancelButton
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused searchbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didBeginEditing(pid as ptr, sel as ptr, searchbar as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UISearchBar(w.Value).HandleDidBeginEditing
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused searchbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_resultListButtonPressed(pid as ptr, sel as ptr, searchbar as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UISearchBar(w.Value).HandleResultListButton
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused searchbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_scopeButtonChanged(pid as ptr, sel as ptr, searchbar as ptr, newIndex as Integer)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UISearchBar(w.Value).HandleScopeButtonChanged(newIndex)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused searchbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_searchButtonPressed(pid as ptr, sel as ptr, searchbar as ptr)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UISearchBar(w.Value).HandleSearchButton
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused searchbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_shouldReplaceText(pid as ptr, sel as ptr, searchbar as ptr, range as NSRange, newText as CFStringRef) As Boolean
		  Return True
		  
		  #Pragma unused pid
		  #Pragma unused sel
		  #Pragma unused searchbar
		  #Pragma unused range
		  #Pragma unused newText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_TextChanged(pid as ptr, sel as ptr, searchbar as ptr, newText as CFStringRef)
		  dim w as xojo.Core.WeakRef = xojo.core.WeakRef(dispatch.Value(pid))
		  if w.Value <> nil Then
		    UISearchBar(w.Value).HandleTextChanged(newText)
		  end if
		  
		  #Pragma unused sel
		  #Pragma unused searchbar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PositionAdjustmentForSearchBarIcon(icon as UISearchBarIcon) As UIOffset
		  declare function positionAdjustmentForSearchBarIcon_ lib UIKitLib selector "positionAdjustmentForSearchBarIcon:" (obj_id as ptr, icon as UISearchBarIcon) as UIOffset
		  Return (positionAdjustmentForSearchBarIcon_(self.Handle, icon))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScopeBarButtonBackgroundImageForState(state as UIControlState) As iOSImage
		  declare function scopeBarButtonBackgroundImageForState_ lib UIKitLib selector "scopeBarButtonBackgroundImageForState:" (obj_id as ptr, state as UIControlState) as ptr
		  Return iOSImage.fromHandle(scopeBarButtonBackgroundImageForState_(self.Handle, state))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScopeBarButtonDividerImageForLeftSegmentStateRightSegmentState(leftState as UIControlState, rightState as UIControlState) As iOSImage
		  declare function scopeBarButtonDividerImageForLeftSegmentState_ lib UIKitLib selector "scopeBarButtonDividerImageForLeftSegmentState:rightSegmentState:" (obj_id as ptr, leftState as UIControlState, rightState as UIControlState) as ptr
		  Return iOSImage.fromHandle(scopeBarButtonDividerImageForLeftSegmentState_(self.Handle, leftState, rightState))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScopeBarButtonTitleTextAttributesForState(state as UIControlState) As NSDictionary
		  declare function scopeBarButtonTitleTextAttributesForState_ lib UIKitLib selector "scopeBarButtonTitleTextAttributesForState:" (obj_id as ptr, state as UIControlState) as ptr
		  Return new NSDictionary(scopeBarButtonTitleTextAttributesForState_(self.Handle, state))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SearchFieldBackgroundImageForState(state as UIControlState) As iOSImage
		  declare function searchFieldBackgroundImageForState_ lib UIKitLib selector "searchFieldBackgroundImageForState:" (obj_id as ptr, state as UIControlState) as ptr
		  Return iOSImage.fromHandle(searchFieldBackgroundImageForState_(self.Handle, state))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBackgroundImageForBarPositionBarMetrics(backgroundImage as iOSImage, barPosition as UIBarPosition, barMetrics as UIBarMetrics)
		  declare sub setBackgroundImage_ lib UIKitLib selector "setBackgroundImage:forBarPosition:barMetrics:" (obj_id as ptr, backgroundImage as ptr, barPosition as UIBarPosition, barMetrics as UIBarMetrics)
		  setBackgroundImage_(self.Handle, backgroundImage.Handle, barPosition, barMetrics)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetImageForSearchBarIconState(iconImage as iOSImage, icon as UISearchBarIcon, state as UIControlState)
		  declare sub setImage_ lib UIKitLib selector "setImage:forSearchBarIcon:state:" (obj_id as ptr, iconImage as ptr, icon as UISearchBarIcon, state as UIControlState)
		  setImage_(self.Handle, iconImage.Handle, icon, state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPositionAdjustmentForSearchBarIcon(adjustment as UIOffset, icon as UISearchBarIcon)
		  declare sub setPositionAdjustment_ lib UIKitLib selector "setPositionAdjustment:forSearchBarIcon:" (obj_id as ptr, adjustment as UIOffset, icon as UISearchBarIcon)
		  setPositionAdjustment_(self.Handle, adjustment, icon)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScopeBarButtonBackgroundImageForState(backgroundImage as iOSImage, state as UIControlState)
		  declare sub setScopeBarButtonBackgroundImage_ lib UIKitLib selector "setScopeBarButtonBackgroundImage:forState:" (obj_id as ptr, backgroundImage as ptr, state as UIControlState)
		  setScopeBarButtonBackgroundImage_(self.Handle, backgroundImage.Handle, state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScopeBarButtonDividerImageForLeftSegmentStateRightSegmentState(dividerImage as iOSImage, leftState as UIControlState, rightState as UIControlState)
		  declare sub setScopeBarButtonDividerImage_ lib UIKitLib selector "setScopeBarButtonDividerImage:forLeftSegmentState:rightSegmentState:" (obj_id as ptr, dividerImage as ptr, leftState as UIControlState, rightState as UIControlState)
		  setScopeBarButtonDividerImage_(self.Handle, dividerImage.Handle, leftState, rightState)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScopeBarButtonTitleTextAttributesForState(attribute as NSDictionary, state as UIControlState)
		  declare sub setScopeBarButtonTitleTextAttributes_ lib UIKitLib selector "setScopeBarButtonTitleTextAttributes:forState:" (obj_id as ptr, attribute as ptr, state as UIControlState)
		  setScopeBarButtonTitleTextAttributes_(self.Handle, attribute, state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSearchFieldBackgroundImageForState(backgroundImage as iOSImage, state as UIControlState)
		  declare sub setSearchFieldBackgroundImage_ lib UIKitLib selector "setSearchFieldBackgroundImage:forState:" (obj_id as ptr, backgroundImage as ptr, state as UIControlState)
		  setSearchFieldBackgroundImage_(self.Handle, backgroundImage.Handle, state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetShowsCancelButtonAnimated(showsCancelButton as Boolean, animated as Boolean)
		  declare sub setShowsCancelButton_ lib UIKitLib selector "setShowsCancelButton:animated:" (obj_id as ptr, showsCancelButton as Boolean, animated as Boolean)
		  setShowsCancelButton_(self.Handle, showsCancelButton, animated)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static targetID as ptr
		  if targetID = Nil then
		    dim methods() as TargetClassMethodHelper
		    methods.Append new TargetClassMethodHelper("searchBar:textDidChange:", AddressOf impl_TextChanged, "v@:@@")
		    'methods.Append new TargetClassMethodHelper("searchBar:shouldChangeTextInRange:replacementText:", AddressOf impl_shouldReplaceText, "b@:@:{NSRange=LL}@")
		    methods.Append new TargetClassMethodHelper("searchBarBookmarkButtonClicked:", AddressOf impl_bookmarkButtonPressed, "v@:@")
		    methods.Append new TargetClassMethodHelper("searchBarCancelButtonClicked:", AddressOf impl_cancelButtonPressed, "v@:@")
		    methods.Append new TargetClassMethodHelper("searchBarSearchButtonClicked:", AddressOf impl_searchButtonPressed, "v@:@")
		    methods.Append new TargetClassMethodHelper("searchBarResultsListButtonClicked:", AddressOf impl_resultListButtonPressed, "v@:@")
		    methods.Append new TargetClassMethodHelper("searchBar:selectedScopeButtonIndexDidChange:", AddressOf impl_scopeButtonChanged, "v@:@i")
		    methods.Append new TargetClassMethodHelper("searchBarTextDidBeginEditing:", AddressOf impl_didBeginEditing, "v@:@")
		    
		    
		    targetID = BuildTargetClass("NSObject","UISearchBarNSObjectDelegate",methods)
		  end if
		  Return targetID
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event BookmarkButtonPressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CancelButtonPressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResultListButtonPressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ScopeButtonChanged(newIndex as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SearchButtonPressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged(newText as Text)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function autocapitalizationType_ lib UIKitLib selector "autocapitalizationType" (obj_id as ptr) as UITextAutocapitalizationType
			  Return (autocapitalizationType_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub autocapitalizationType_ lib UIKitLib selector "setAutocapitalizationType:" (obj_id as ptr, autocapitalizationType as UITextAutocapitalizationType)
			  autocapitalizationType_(self.Handle, value)
			End Set
		#tag EndSetter
		autocapitalizationType As UITextAutocapitalizationType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function autocorrectionType_ lib UIKitLib selector "autocorrectionType" (obj_id as ptr) as UITextAutocorrectionType
			  Return (autocorrectionType_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub autocorrectionType_ lib UIKitLib selector "setAutocorrectionType:" (obj_id as ptr, autocorrectionType as UITextAutocorrectionType)
			  autocorrectionType_(self.Handle, value)
			End Set
		#tag EndSetter
		autocorrectionType As UITextAutocorrectionType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function backgroundImage_ lib UIKitLib selector "backgroundImage" (obj_id as ptr) as ptr
			  Return iOSImage.fromHandle(backgroundImage_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub backgroundImage_ lib UIKitLib selector "setBackgroundImage:" (obj_id as ptr, backgroundImage as ptr)
			  backgroundImage_(self.Handle, value.Handle)
			End Set
		#tag EndSetter
		backgroundImage As iOSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function barStyle_ lib UIKitLib selector "barStyle" (obj_id as ptr) as UIBarStyle
			  Return (barStyle_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub barStyle_ lib UIKitLib selector "setBarStyle:" (obj_id as ptr, barStyle as UIBarStyle)
			  barStyle_(self.Handle, value)
			End Set
		#tag EndSetter
		barStyle As UIBarStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function barTintColor_ lib UIKitLib selector "barTintColor" (obj_id as ptr) as ptr
			  Return new UIColor(barTintColor_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub barTintColor_ lib UIKitLib selector "setBarTintColor:" (obj_id as ptr, barTintColor as ptr)
			  barTintColor_(self.Handle, value)
			End Set
		#tag EndSetter
		barTintColor As UIColor
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared dispatch As xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function keyboardType_ lib UIKitLib selector "keyboardType" (obj_id as ptr) as UIKeyboardType
			  Return (keyboardType_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub keyboardType_ lib UIKitLib selector "setKeyboardType:" (obj_id as ptr, keyboardType as UIKeyboardType)
			  keyboardType_(self.Handle, value)
			End Set
		#tag EndSetter
		keyboardType As UIKeyboardType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function delegate_ lib UIKitLib selector "delegate" (obj_id as ptr) as ptr
			  Return (delegate_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub delegate_ lib UIKitLib selector "setDelegate:" (obj_id as ptr, del as ptr)
			  delegate_(self.Handle, value)
			End Set
		#tag EndSetter
		mDelegate As ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private m_id As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function placeholder_ lib UIKitLib selector "placeholder" (obj_id as ptr) as CFStringRef
			  Return placeholder_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub placeholder_ lib UIKitLib selector "setPlaceholder:" (obj_id as ptr, placeholder as CFStringRef)
			  placeholder_(self.Handle, value)
			End Set
		#tag EndSetter
		placeholder As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function prompt_ lib UIKitLib selector "prompt" (obj_id as ptr) as CFStringRef
			  Return prompt_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub prompt_ lib UIKitLib selector "setPrompt:" (obj_id as ptr, prompt as CFStringRef)
			  prompt_(self.Handle, value)
			End Set
		#tag EndSetter
		prompt As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function scopeBarBackgroundImage_ lib UIKitLib selector "scopeBarBackgroundImage" (obj_id as ptr) as ptr
			  Return iOSImage.fromHandle(scopeBarBackgroundImage_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub scopeBarBackgroundImage_ lib UIKitLib selector "setScopeBarBackgroundImage:" (obj_id as ptr, scopeBarBackgroundImage as ptr)
			  scopeBarBackgroundImage_(self.Handle, value.Handle)
			End Set
		#tag EndSetter
		scopeBarBackgroundImage As iOSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function scopeButtonTitles_ lib UIKitLib selector "scopeButtonTitles" (obj_id as ptr) as ptr
			  Return new NSArray(scopeButtonTitles_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub scopeButtonTitles_ lib UIKitLib selector "setScopeButtonTitles:" (obj_id as ptr, scopeButtonTitles as ptr)
			  scopeButtonTitles_(self.Handle, value)
			End Set
		#tag EndSetter
		scopeButtonTitles As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function searchBarStyle_ lib UIKitLib selector "searchBarStyle" (obj_id as ptr) as UISearchBarStyle
			  Return (searchBarStyle_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub searchBarStyle_ lib UIKitLib selector "setSearchBarStyle:" (obj_id as ptr, searchBarStyle as UISearchBarStyle)
			  searchBarStyle_(self.Handle, value)
			End Set
		#tag EndSetter
		searchBarStyle As UISearchBarStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function searchFieldBackgroundPositionAdjustment_ lib UIKitLib selector "searchFieldBackgroundPositionAdjustment" (obj_id as ptr) as UIOffset
			  Return (searchFieldBackgroundPositionAdjustment_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub searchFieldBackgroundPositionAdjustment_ lib UIKitLib selector "setSearchFieldBackgroundPositionAdjustment:" (obj_id as ptr, searchFieldBackgroundPositionAdjustment as UIOffset)
			  searchFieldBackgroundPositionAdjustment_(self.Handle, value)
			End Set
		#tag EndSetter
		searchFieldBackgroundPositionAdjustment As UIOffset
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function searchResultsButtonSelected_ lib UIKitLib selector "isSearchResultsButtonSelected" (obj_id as ptr) as Boolean
			  Return searchResultsButtonSelected_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub searchResultsButtonSelected_ lib UIKitLib selector "setSearchResultsButtonSelected:" (obj_id as ptr, searchResultsButtonSelected as Boolean)
			  searchResultsButtonSelected_(self.Handle, value)
			End Set
		#tag EndSetter
		searchResultsButtonSelected As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function searchTextPositionAdjustment_ lib UIKitLib selector "searchTextPositionAdjustment" (obj_id as ptr) as UIOffset
			  Return (searchTextPositionAdjustment_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub searchTextPositionAdjustment_ lib UIKitLib selector "setSearchTextPositionAdjustment:" (obj_id as ptr, searchTextPositionAdjustment as UIOffset)
			  searchTextPositionAdjustment_(self.Handle, value)
			End Set
		#tag EndSetter
		searchTextPositionAdjustment As UIOffset
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function selectedScopeButtonIndex_ lib UIKitLib selector "selectedScopeButtonIndex" (obj_id as ptr) as Integer
			  Return selectedScopeButtonIndex_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub selectedScopeButtonIndex_ lib UIKitLib selector "setSelectedScopeButtonIndex:" (obj_id as ptr, selectedScopeButtonIndex as Integer)
			  selectedScopeButtonIndex_(self.Handle, value)
			End Set
		#tag EndSetter
		selectedScopeButtonIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function showsBookmarkButton_ lib UIKitLib selector "showsBookmarkButton" (obj_id as ptr) as Boolean
			  Return showsBookmarkButton_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub showsBookmarkButton_ lib UIKitLib selector "setShowsBookmarkButton:" (obj_id as ptr, showsBookmarkButton as Boolean)
			  showsBookmarkButton_(self.Handle, value)
			End Set
		#tag EndSetter
		showsBookmarkButton As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function showsCancelButton_ lib UIKitLib selector "showsCancelButton" (obj_id as ptr) as Boolean
			  Return showsCancelButton_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub showsCancelButton_ lib UIKitLib selector "setShowsCancelButton:" (obj_id as ptr, showsCancelButton as Boolean)
			  showsCancelButton_(self.Handle, value)
			End Set
		#tag EndSetter
		showsCancelButton As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function showsScopeBar_ lib UIKitLib selector "showsScopeBar" (obj_id as ptr) as Boolean
			  Return showsScopeBar_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub showsScopeBar_ lib UIKitLib selector "setShowsScopeBar:" (obj_id as ptr, showsScopeBar as Boolean)
			  showsScopeBar_(self.Handle, value)
			End Set
		#tag EndSetter
		showsScopeBar As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function showsSearchResultsButton_ lib UIKitLib selector "showsSearchResultsButton" (obj_id as ptr) as Boolean
			  Return showsSearchResultsButton_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub showsSearchResultsButton_ lib UIKitLib selector "setShowsSearchResultsButton:" (obj_id as ptr, showsSearchResultsButton as Boolean)
			  showsSearchResultsButton_(self.Handle, value)
			End Set
		#tag EndSetter
		showsSearchResultsButton As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function spellCheckingType_ lib UIKitLib selector "spellCheckingType" (obj_id as ptr) as UITextSpellCheckingType
			  Return (spellCheckingType_(self.Handle))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub spellCheckingType_ lib UIKitLib selector "setSpellCheckingType:" (obj_id as ptr, spellCheckingType as UITextSpellCheckingType)
			  spellCheckingType_(self.Handle, value)
			End Set
		#tag EndSetter
		spellCheckingType As UITextSpellCheckingType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function text_ lib UIKitLib selector "text" (obj_id as ptr) as CFStringRef
			  Return text_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub text_ lib UIKitLib selector "setText:" (obj_id as ptr, text as CFStringRef)
			  text_(self.Handle, value)
			End Set
		#tag EndSetter
		text As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function tintColor_ lib UIKitLib selector "tintColor" (obj_id as ptr) as ptr
			  return new UIColor(tintColor_(self.Handle))
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub tintColor_ lib UIKitLib selector "setTintColor:" (obj_id as ptr, tintColor as ptr)
			  tintColor_(self.Handle, value)
			End Set
		#tag EndSetter
		tintColor As UIKit.UIColor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function translucent_ lib UIKitLib selector "isTranslucent" (obj_id as ptr) as Boolean
			  Return translucent_(self.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub translucent_ lib UIKitLib selector "setTranslucent:" (obj_id as ptr, translucent as Boolean)
			  translucent_(self.Handle, value)
			End Set
		#tag EndSetter
		translucent As Boolean
	#tag EndComputedProperty


	#tag Structure, Name = UIOffset, Flags = &h0
		horizontal as single
		vertical as single
	#tag EndStructure


	#tag Enum, Name = UIBarMetrics, Type = Integer, Flags = &h0
		Default
		  LandscapePhone
		  DefaultPrompt = 101
		LandscapePhonePrompt
	#tag EndEnum

	#tag Enum, Name = UIBarPosition, Type = Integer, Flags = &h0
		Any = 0
		  Bottom = 1
		  Top = 2
		TopAttached = 3
	#tag EndEnum

	#tag Enum, Name = UIBarStyle, Type = Integer, Flags = &h0
		Default = 0
		Black = 1
	#tag EndEnum

	#tag Enum, Name = UIControlState, Flags = &h0
		Normal = 0
		  Highlighted = 1
		  Disabled = 2
		Selected = 4
	#tag EndEnum

	#tag Enum, Name = UIKeyboardType, Type = Integer, Flags = &h0
		Default
		  ASCIICapable
		  NumbersAndPunctuation
		  URL
		  NumberPad
		  PhonePad
		  NamePhonePad
		  EmailAddress
		  DecimalPad
		  Twitter
		WebSearch
	#tag EndEnum

	#tag Enum, Name = UISearchBarIcon, Type = Integer, Flags = &h0
		Search
		  Clear
		  Bookmark
		ResultsList
	#tag EndEnum

	#tag Enum, Name = UISearchBarStyle, Type = Integer, Flags = &h0
		Default
		  Prominent
		Minimal
	#tag EndEnum

	#tag Enum, Name = UITextAutocapitalizationType, Type = Integer, Flags = &h0
		None
		  Words
		  Sentences
		AllCharacters
	#tag EndEnum

	#tag Enum, Name = UITextAutocorrectionType, Type = Integer, Flags = &h0
		Default
		  No
		Yes
	#tag EndEnum

	#tag Enum, Name = UITextSpellCheckingType, Type = Integer, Flags = &h0
		Default
		  No
		Yes
	#tag EndEnum


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
			Name="autocapitalizationType"
			Visible=true
			Group="Behavior"
			Type="UITextAutocapitalizationType"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - Words"
				"2 - Sentences"
				"3 - AllCharacters"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="autocorrectionType"
			Visible=true
			Group="Behavior"
			Type="UITextAutocorrectionType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - No"
				"2 - Yes"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="barStyle"
			Visible=true
			Group="Behavior"
			Type="UIBarStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Black"
			#tag EndEnumValues
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
			Name="keyboardType"
			Visible=true
			Group="Behavior"
			Type="UIKeyboardType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - ASCIICapable"
				"2 - NumbersAndPunctuation"
				"3 - URL"
				"4 - NumberPad"
				"5 - PhonePad"
				"6 - NamePhonePad"
				"7 - EmailAddress"
				"8 - DecimalPad"
				"9 - Twitter"
				"10 - WebSearch"
			#tag EndEnumValues
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
			Name="placeholder"
			Visible=true
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="prompt"
			Visible=true
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="searchBarStyle"
			Visible=true
			Group="Behavior"
			Type="UISearchBarStyle"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Prominent"
				"2 - Minimal"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="searchResultsButtonSelected"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="selectedScopeButtonIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="showsBookmarkButton"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="showsCancelButton"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="showsScopeBar"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="showsSearchResultsButton"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="spellCheckingType"
			Visible=true
			Group="Behavior"
			Type="UITextSpellCheckingType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - No"
				"2 - Yes"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="text"
			Visible=true
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="translucent"
			Visible=true
			Group="Behavior"
			Type="Boolean"
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
