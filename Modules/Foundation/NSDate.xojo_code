#tag Class
Class NSDate
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = NSClassFromString("NSDate")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(anotherDate as NSDate) As NSComparisonResult
		  //# Returns an NSComparisonResult value that indicates the temporal ordering of the NSDate and another given date.
		  
		  //@return: _
		  // The NSDate and anotherDate are exactly equal to each other, NSOrderedSame. (0) _
		  // The NSDate is later in time than anotherDate, NSOrderedDescending. (1)_
		  // The NSDate is earlier in time than anotherDate, NSOrderedAscending. (-1)
		  
		  
		  declare function compare lib FoundationLib selector "compare:" (obj_id as Ptr, anotherDate as Ptr) as NSComparisonResult
		  
		  dim anotherDateRef as Ptr
		  if anotherDate <> nil then
		    anotherDateRef = anotherDate
		  end if
		  
		  return compare(self, anotherDateRef)
		  
		  #pragma unused anotherDate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  super.Constructor(Initialize(Allocate(NSClassFromString("NSDate"))))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(secondsSinceNow as Double)
		  //# Returns an NSDate object initialized relative to the current date and time by a given number of seconds.
		  
		  //@param secondsSinceNow: The number of seconds from relative to the current date and time to which the NSDate should be initialized. _
		  // A negative value means the returned object will represent a date in the past.
		  
		  
		  declare function initWithTimeIntervalSinceNow lib FoundationLib selector "initWithTimeIntervalSinceNow:" (obj_id as Ptr, seconds as Double) as Ptr
		  
		  super.Constructor(initWithTimeIntervalSinceNow(Allocate(NSClassFromString("NSDate")), secondsSinceNow))
		  
		  #pragma unused secondsSinceNow
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(seconds as Double, sinceDate as NSDate)
		  //# Returns an NSDate object initialized relative to another given date by a given number of seconds.
		  
		  
		  declare function initWithTimeInterval lib FoundationLib selector "initWithTimeInterval:sinceDate:" (obj_id as Ptr, seconds as Double, refDate as Ptr) as Ptr
		  
		  dim sinceDateRef as Ptr
		  if sinceDate <> nil then
		    sinceDateRef = sinceDate
		  end if
		  
		  super.Constructor(initWithTimeInterval(Allocate(NSClassFromString("NSDate")), seconds, sinceDateRef))
		  
		  #pragma unused seconds
		  #pragma unused sinceDate
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as xojo.core.Date)
		  //# Creates and returns an NSDate object set to the given number of seconds from the first instant of 1 January 1970, GMT.
		  
		  
		  declare function dateWithTimeIntervalSince1970 lib FoundationLib selector "dateWithTimeIntervalSince1970:" (class_id as Ptr, seconds as Double) as Ptr
		  
		  dim seconds as Double = value.SecondsFrom1970
		  
		  super.Constructor(dateWithTimeIntervalSince1970( NSClassFromString( "NSDate" ), seconds ))
		  
		  needsExtraRelease = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DateSince1970(seconds as Double) As NSDate
		  //# Creates and returns an NSDate object set to the given number of seconds from the first instant of 1 January 1970, GMT.
		  
		  
		  declare function dateWithTimeIntervalSince1970 lib FoundationLib selector "dateWithTimeIntervalSince1970:" (class_id as Ptr, seconds as Double) as Ptr
		  
		  dim dateRef as Ptr = dateWithTimeIntervalSince1970(ClassRef, seconds)
		  if dateRef <> nil then
		    return new NSDate(dateRef)
		  end if
		  
		  
		  #pragma unused seconds
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DateSinceNow(seconds as Double) As NSDate
		  //# Creates and returns an NSDate object set to a given number of seconds from the current date and time.
		  
		  
		  declare function dateWithTimeIntervalSinceNow lib FoundationLib selector "dateWithTimeIntervalSinceNow:" (class_id as Ptr, seconds as Double) as Ptr
		  
		  dim dateRef as Ptr = dateWithTimeIntervalSinceNow(ClassRef, seconds)
		  if dateRef <> nil then
		    return new NSDate(dateRef)
		  end if
		  
		  
		  #pragma unused seconds
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DateSinceReference(seconds as Double) As NSDate
		  //# Creates and returns an NSDate object set to a given number of seconds from the first instant of 1 January 2001, GMT.
		  
		  
		  declare function dateWithTimeIntervalSinceReferenceDate lib FoundationLib selector "dateWithTimeIntervalSinceReferenceDate:" (class_id as Ptr, seconds as Double) as Ptr
		  
		  dim dateRef as Ptr = dateWithTimeIntervalSinceReferenceDate(ClassRef, seconds)
		  if dateRef <> nil then
		    return new NSDate(dateRef)
		  end if
		  
		  
		  #pragma unused seconds
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DistantFuture() As NSDate
		  //# Creates and returns an NSDate object representing a date in the distant future.
		  
		  
		  declare function distantFuture lib FoundationLib selector "distantFuture" (class_id as Ptr) as Ptr
		  
		  dim dateRef as Ptr = distantFuture(ClassRef)
		  if dateRef <> nil then
		    return new NSDate(dateRef)
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DistantPast() As NSDate
		  //# Creates and returns an NSDate object representing a date in the distant past.
		  
		  
		  declare function distantPast lib FoundationLib selector "distantPast" (class_id as Ptr) as Ptr
		  
		  dim dateRef as Ptr = distantPast(ClassRef)
		  if dateRef <> nil then
		    return new NSDate(dateRef)
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function Earlier(anotherDate as NSDate) As NSDate
		  //# Returns the earlier of the NSDate and another given date.
		  
		  
		  declare function earlierDate lib FoundationLib selector "earlierDate:" (obj_id as Ptr, anotherDate as Ptr) as Ptr
		  
		  dim anotherDateRef as Ptr
		  if anotherDate <> nil then
		    anotherDateRef = anotherDate
		  end if
		  
		  dim earlierRef as Ptr = earlierDate(self, anotherDateRef)
		  if earlierRef <> nil then
		    if earlierRef = self.id then
		      return self
		    else
		      return anotherDate
		    end if
		  end if
		  
		  
		  #pragma unused anotherDate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(anotherDate as NSDate) As Boolean
		  //# Returns a Boolean value that indicates whether a given object is an NSDate object and exactly equal the NSDate.
		  
		  
		  declare function isEqualToDate lib FoundationLib selector "isEqualToDate:" (obj_id as Ptr, anotherDate as Ptr) as Boolean
		  
		  dim anotherDateRef as Ptr
		  if anotherDate <> nil then
		    anotherDateRef = anotherDate
		  end if
		  
		  return isEqualToDate(self, anotherDateRef)
		  
		  #pragma unused anotherDate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function later(anotherDate as NSDate) As NSDate
		  //# Returns the later of the NSDate and another given date.
		  
		  
		  declare function laterDate lib FoundationLib selector "laterDate:" (obj_id as Ptr, anotherDate as Ptr) as Ptr
		  
		  dim anotherDateRef as Ptr
		  if anotherDate <> nil then
		    anotherDateRef = anotherDate
		  end if
		  
		  dim laterRef as Ptr = laterDate(self, anotherDateRef)
		  if laterRef <> nil then
		    if laterRef = self.id then
		      return self
		    else
		      return anotherDate
		    end if
		  end if
		  
		  
		  #pragma unused anotherDate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Now() As NSDate
		  //# Creates and returns a new date set to the current date and time.
		  
		  
		  soft declare function date lib FoundationLib selector "date" (class_id as Ptr) as Ptr
		  
		  return new NSDate(date(NSClassFromString("NSDate")))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Date
		  
		  //Returns the interval between the NSDate and the first instant of 1 January 1970, GMT.
		  declare function timeIntervalSince1970 lib FoundationLib selector "timeIntervalSince1970" (id as Ptr) as Double
		  
		  dim d as new Date(timeIntervalSince1970(self),TimeZone.Current)
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Operator_Convert(value as Date)
		  
		  self.Constructor(value)
		  
		  '
		  'declare function dateWithTimeIntervalSince1970 lib FoundationLib selector "dateWithTimeIntervalSince1970:" (class_id as Ptr, seconds as Double) as Ptr
		  '
		  'dim d as new Date
		  'd.SQLDateTime = "1970-01-01 00:00:00"
		  'dim seconds as Double = value.TotalSeconds - d.TotalSeconds - 3600.0*value.GMTOffset
		  'dim p as Ptr = dateWithTimeIntervalSince1970(NSClassFromString("NSDate"), seconds)
		  'super.Constructor(p)
		  '
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeInterval() As Double
		  //# Returns the interval between the NSDate and the current date and time.
		  
		  
		  declare function timeIntervalSinceNow lib FoundationLib selector "timeIntervalSinceNow" (obj_id as Ptr) as Double
		  
		  return timeIntervalSinceNow(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeInterval(sinceDate as NSDate) As Double
		  //# Returns the interval between the NSDate and another given date.
		  
		  
		  declare function timeIntervalSinceDate lib FoundationLib selector "timeIntervalSinceDate:" (obj_id as Ptr, anotherDate as Ptr) as Double
		  
		  dim sinceDateRef as Ptr
		  if sinceDate <> nil then
		    sinceDateRef = sinceDate
		  end if
		  
		  return timeIntervalSinceDate(self, sinceDateRef)
		  
		  #pragma unused sinceDate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeIntervalSince1970() As Double
		  //# Returns the interval between the NSDate and the first instant of 1 January 1970, GMT.
		  
		  
		  declare function timeIntervalSince1970 lib FoundationLib selector "timeIntervalSince1970" (obj_id as Ptr) as Double
		  
		  return timeIntervalSince1970(self)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeIntervalSinceReference() As Double
		  //# Returns the interval between the first instant of 1 January 2001, GMT and the current date and time.
		  
		  
		  declare function timeIntervalSinceReferenceDate lib FoundationLib selector "timeIntervalSinceReferenceDate" (obj_id as Ptr) as Double
		  
		  return timeIntervalSinceReferenceDate(self)
		  
		End Function
	#tag EndMethod


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
