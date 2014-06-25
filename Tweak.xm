//
//
//    Created by drewsdunne 
//         Apr 4 2014
//
//

@interface SBLockScreenBounceAnimator
- (void)_handleTapGesture:(id)arg1;
@end

@interface SBLockScreenView
@property(readonly, nonatomic) UIScrollView *scrollView;
- (void)_layoutScrollView;
@end

%hook SBLockScreenBounceAnimator

- (void)_handleTapGesture:(id)arg1 {
	//Release argument
	arg1 = NULL;
	//Don't handle the gesture
}

%end

%hook SBLockScreenView

- (void)_layoutScrollView {
	%orig;
	//Turn off scrolling on lockscreen
	[self.scrollView setScrollEnabled:NO];
	//Turn off scroll view bouncing
	[self.scrollView setBounces:NO];
}

%end