//
//  SideMenuViewController.h
//  Camel
//
//  Created by Nicholas Zhao on 15/5/19.
//  Copyright (c) 2015年 Nicholas Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SideMenuViewController;

@protocol SideMenuViewControllerDelegate <NSObject>
@optional
- (void)sideMenuViewControllerWillOpenMenu:(SideMenuViewController *)sideMenuViewController;
- (void)sideMenuViewControllerDidOpenMenu:(SideMenuViewController *)sideMenuViewController;
- (void)sideMenuViewControllerWillCloseMenu:(SideMenuViewController *)sideMenuViewController;
- (void)sideMenuViewControllerDidCloseMenu:(SideMenuViewController *)sideMenuViewController;
@end

@interface SideMenuViewController : UIViewController

typedef NS_ENUM(NSInteger, SideMenuAnimationType) {
    SideMenuAnimationTypeSlideOver, //Default - new view controllers slide over the old view controller.
    SideMenuAnimationTypeFadeIn //New View controllers fade in over the old view controller.
};

/** Apply to this delegate to get several side menu events */
@property (nonatomic, weak) id<SideMenuViewControllerDelegate> delegate;

/** The animation type - will default to Slide Over. */
@property (nonatomic, assign) SideMenuAnimationType animationType;

/** Time interval for opening and closing the side menu */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/** Time interval for swapping main view controllers */
@property (nonatomic, assign) NSTimeInterval animationSwapDuration;

/** Is the menu currently open? */
@property (nonatomic, assign, getter = isOpen) BOOL open;

/** Offset to position the menu in open position */
@property (nonatomic, assign) UIOffset edgeOffset;

/** The scale for zooming the viewport. 0.0 to 1.0 */
@property (nonatomic, assign) CGFloat zoomScale;

/** The color of the shadow to display behind the scaled main view */
@property (nonatomic, strong) UIColor *shadowColor;

/** Left side menu view */
@property (nonatomic, strong) IBOutlet UIViewController *menuViewController;

/** Main View */
@property (nonatomic, strong) IBOutlet UIViewController *mainViewController;

/** When the menu is opened, a transparent button is displayed over the main view. This property gives the opportunity to modify it's accessibility label. */
@property (nonatomic, copy) NSString *closeOverlayAccessibilityLabel;

/** When the menu is opened, a transparent button is displayed over the main view. This property gives the opportunity to modify it's accessibility hint. */
@property (nonatomic, copy) NSString *closeOverlayAccessibilityHint;

/** Initializer that sets up a menuViewController and a mainViewController
 @param menuViewController The view controller to display in the left view
 @param mainViewController The view controller to display in the right view
 @return TWTMenuViewController A view that manages a menu view and opening/closing animations
 */
- (id)initWithMenuViewController:(UIViewController *)menuViewController mainViewController:(UIViewController *)mainViewController;

@end

@interface SideMenuViewController (MenuActions)

/** Open the left side menu; animated or not
 @param animated Is the menu open action animated
 */
- (void)openMenuAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

/** Close the left side menu; animated or not
 @param animated Is the menu close action animated
 */
- (void)closeMenuAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

/** Toggle the state of the left side menu
 @param animated Is the toggle action animated
 */
- (void)toggleMenuAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

@end

@interface SideMenuViewController (MainViewActions)

- (void)setMainViewController:(UIViewController *)mainViewController animated:(BOOL)animated closeMenu:(BOOL)closeMenu;

@end

@interface UIViewController (SideMenuViewController)

@property (nonatomic, weak) SideMenuViewController *sideMenuViewController;

@end