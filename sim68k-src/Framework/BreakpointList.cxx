///////////////////////////////////////////////////////////////////////////////
//
// BreakpointList.cxx
//
//   This class manages a list of breakpoints
//
//
// BSVC "A Microprocessor Simulation Framework"
// Copyright (c) 1993
// By: Bradford W. Mott
// November 23,1993
//
///////////////////////////////////////////////////////////////////////////////
// $Id: BreakpointList.cxx,v 1.1 1996/08/07 19:15:53 bwmott Exp $
///////////////////////////////////////////////////////////////////////////////

#include "BreakpointList.hxx"

///////////////////////////////////////////////////////////////////////////////
// The class constructor
///////////////////////////////////////////////////////////////////////////////
BreakpointList::BreakpointList()
{
}

///////////////////////////////////////////////////////////////////////////////
// Add a breakpoint to the list
///////////////////////////////////////////////////////////////////////////////
void BreakpointList::Add(unsigned long address)
{
  myBreakpoints.insert(address);
}

///////////////////////////////////////////////////////////////////////////////
// Delete a break point from the list. Answers true iff successful
///////////////////////////////////////////////////////////////////////////////
bool BreakpointList::Delete(unsigned long address)
{
  set<unsigned long, less<unsigned long> >::iterator i;

  i = myBreakpoints.find(address);
  if(i != myBreakpoints.end())
  {
    myBreakpoints.erase(i);
    return true;
  }
  else
  {
    return false;
  }
} 

///////////////////////////////////////////////////////////////////////////////
// Answers the number of breakpoints
///////////////////////////////////////////////////////////////////////////////
unsigned int BreakpointList::NumberOfBreakpoints() const
{
  return myBreakpoints.size();
}

///////////////////////////////////////////////////////////////////////////////
// Get the breakpoint with the given index. Answers true iff successful
///////////////////////////////////////////////////////////////////////////////
bool BreakpointList::GetBreakpoint(unsigned int index, 
    unsigned long& address) const
{
  // Make sure it's a valid index
  if(index < NumberOfBreakpoints())
  {
    unsigned int t;
    set<unsigned long, less<unsigned long> >::iterator i;

    // Scan to the indexed breakpoint
    for(t = 0, i = myBreakpoints.begin();  t < index; ++t, ++i);

    address = *i;
    return true;
  }
  else
  {
    return false;
  }
}  

///////////////////////////////////////////////////////////////////////////////
// Answers true iff the given address is a breakpoint
///////////////////////////////////////////////////////////////////////////////
bool BreakpointList::Check(unsigned long address) const
{
  return (myBreakpoints.find(address) != myBreakpoints.end());
}

