// move_to_midscreen.m
// 
// Usage: ./move_to_midscreen -- moves the mouse to the center of the screen.
// Based on http://hints.macworld.com/article.php?story=2008051406323031
// Modifications by Sean Zhu <http://szhu.me/>

#import <AppKit/NSScreen.h>
#import <ApplicationServices/ApplicationServices.h>
#import <Foundation/Foundation.h>


int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  NSUserDefaults *args = [NSUserDefaults standardUserDefaults];
  NSRect mainScreenFrame = [[NSScreen mainScreen] frame];

  int xMin = NSMinX(mainScreenFrame);
  int yMin = NSMinY(mainScreenFrame);
  int xMax = NSMaxX(mainScreenFrame);
  int yMax = NSMaxY(mainScreenFrame);
  int x = (xMin+xMax)/2;
  int y = (yMin+yMax)/2;

  CGPoint pt;
  pt.x = x;
  pt.y = y;

  // Reference: CGRemoteOperation.h
  //
  // CGPostMouseEvent( CGPoint        mouseCursorPosition,
  //                   boolean_t      updateMouseCursorPosition,
  //                   CGButtonCount  buttonCount,
  //                   boolean_t      mouseButtonDown, ... )
  //
  CGPostMouseEvent( pt, 1, 1, 0 );

  [pool release];
  return 0;
}