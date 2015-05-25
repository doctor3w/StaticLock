//
//
//    Created by drewsdunne 
//         Apr 4 2014
//
//

#include "defines.h"

@implementation UIDevice (OSVersion)
- (BOOL)iOSVersionIsAtLeast:(NSString*)version {
    NSComparisonResult result = [[self systemVersion] compare:version options:NSNumericSearch];
    return (result == NSOrderedDescending || result == NSOrderedSame);
}
@end

%group iOS7
%hook SBLockScreenView
- (void)_layoutScrollView {
	%orig;
	//Turn off scrolling on lockscreen
	[self.scrollView setScrollEnabled:NO];
	//Turn off scroll view bouncing
	[self.scrollView setBounces:NO];
}
%end
%hook SBLockScreenBounceAnimator
- (void)_handleTapGesture:(id)arg1 {
	//Release argument
	arg1 = NULL;
	//Don't handle the gesture
}
%end
%end

%group iOS71
%hook SBLockScreenView
- (BOOL)_disallowScrollingInTouchedView:(id)fp8 {
	return YES;
}
- (float)hintDisplacement {
	return 0;
}
%end
%hook SBLockScreenBounceAnimator
- (void)_handleTapGesture:(id)arg1 {
	//Release argument
	arg1 = NULL;
	//Don't handle the gesture
}
%end
%end

%ctor {
	if (IS_IOS_71_OR_LATER())
	{
		%init(iOS71);
	} else if (IS_IOS_70()) {
		%init(iOS7);
	} else {

	}
}