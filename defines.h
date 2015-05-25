/*


Created by drewsdunne


*/

@interface UIDevice (de)
- (BOOL)iOSVersionIsAtLeast:(NSString *)vers;
@end

#define IS_IOS_71_OR_LATER() [[UIDevice currentDevice] iOSVersionIsAtLeast: @"7.1"]
#define IS_IOS_70()          ([[UIDevice currentDevice] iOSVersionIsAtLeast: @"7.0"] && !IS_IOS_71_OR_LATER())

@interface SBLockScreenBounceAnimator
- (void)_handleTapGesture:(id)arg1;
@end

@interface SBLockScreenView
@property(readonly, nonatomic) UIScrollView *scrollView;
- (BOOL)_disallowScrollingInTouchedView:(id)fp8;
- (void)_layoutScrollView;
- (float)hintDisplacement;
@end