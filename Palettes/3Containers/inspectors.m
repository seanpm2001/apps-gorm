/* inspectors - Various inspectors for control elements

   Copyright (C) 2001 Free Software Foundation, Inc.

   Author:  Laurent Julliard <laurent@julliard-online.org>
   Author:  Gregory John Casamento <greg_casamento@yahoo.com>
   Date: Aug 2001. 2003, 2004
   
   This file is part of GNUstep.
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 USA.
*/

#include <Foundation/Foundation.h>
#include <AppKit/NSTableColumn.h>
#include <AppKit/NSBrowser.h>
#include <InterfaceBuilder/IBInspector.h>
#include <GormCore/GormPrivate.h>
#include <GormCore/NSColorWell+GormExtensions.h>
#include "GormNSTableView.h"

/* This macro makes sure that the string contains a value, even if @"" */
#define VSTR(str) ({id _str = str; (_str) ? _str : @"";})



@interface GormViewSizeInspector : IBInspector
{
  NSButton	*top;
  NSButton	*bottom;
  NSButton	*left;
  NSButton	*right;
  NSButton	*width;
  NSButton	*height;
  NSForm        *sizeForm;
}
@end

@interface GormTableViewSizeInspector : GormViewSizeInspector
@end

@implementation GormTableViewSizeInspector
- (void) setObject: (id)anObject
{
  id scrollView;
  scrollView = [anObject enclosingScrollView];

  [super setObject: scrollView];
}
@end

/*----------------------------------------------------------------------------
 * NSTableColumn
 */
@implementation NSTableColumn (IBObjectAdditionsSize)

- (NSString*) sizeInspectorClassName
{
  return @"GormTableColumnSizeInspector";
}

@end

@interface GormTableColumnSizeInspector : IBInspector
{
  id widthForm;
}
- (void) _getValuesFromObject: (id)anObject;
- (void) _setValuesFromControl: (id)anObject;
@end

@implementation GormTableColumnSizeInspector

- (id) init
{
  if ([super init] == nil)
    {
      return nil;
    }

  if ([NSBundle loadNibNamed: @"GormNSTableColumnSizeInspector" owner: self] == NO)
    {
      NSLog(@"Could not gorm GormTableColumnSizeInspector");
      return nil;
    }

  return self;
}

- (void) ok: (id)sender
{
  [super ok: sender];
  [self _setValuesFromControl: sender];
}

- (void) setObject: (id)anObject
{
  [super setObject: anObject];
  [self _getValuesFromObject: anObject];
}
- (void) _getValuesFromObject: anObject
{
  [[widthForm cellAtRow: 0 column: 0] setFloatValue:
					[anObject minWidth]];
  [[widthForm cellAtRow: 1 column: 0] setFloatValue:
					[anObject width]];
  [[widthForm cellAtRow: 2 column: 0] setFloatValue:
					[anObject maxWidth]];
}

- (void) _setValuesFromControl: (id) control
{
  [object setMinWidth:
	    [[widthForm cellAtRow: 0 column: 0] floatValue]];
  [object setWidth:
	    [[widthForm cellAtRow: 1 column: 0] floatValue]];
  [object setMaxWidth:
	    [[widthForm cellAtRow: 2 column: 0] floatValue]];

  [self _getValuesFromObject: object];
}
@end

/*----------------------------------------------------------------------------
 * NSTableView (possibly embedded in a Scroll view)
 */
@implementation	NSTableView (IBObjectAdditionsSize)
- (NSString*) sizeInspectorClassName
{
  return @"GormTableViewSizeInspector";
}
@end


/*----------------------------------------------------------------------------
 * NSTabView (possibly embedded in a Scroll view)
 */

static NSString *ITEM=@"item";

@implementation	NSTabView (IBObjectAdditionsEditor)

- (NSString*) editorClassName
{
  return @"GormTabViewEditor";
}

@end



