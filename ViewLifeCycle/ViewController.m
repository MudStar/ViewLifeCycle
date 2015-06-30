//
//  ViewController.m
//  ViewLifeCycle
//
//  Created by Neil on 6/5/15.
//  Copyright (c) 2015 Prevideo. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewCycle.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - @protocol UIContentContainer <NSObject>

- (void)preferredContentSizeDidChangeForChildContentContainer:(id <UIContentContainer>)container NS_AVAILABLE_IOS(8_0)
{
    DLog(@"container:%@", container);

    [super preferredContentSizeDidChangeForChildContentContainer:container];
}

/*
 Intended as a bridge for a view controller that does not use auto layout presenting a child that does use auto layout.
 
 If the child's view is using auto layout and the -systemLayoutSizeFittingSize: of the view
 changes, -systemLayoutFittingSizeDidChangeForChildContentContainer: will be sent to the view controller's parent.
 */
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id <UIContentContainer>)container NS_AVAILABLE_IOS(8_0)
{
    DLog(@"container:%@", container);

    [super systemLayoutFittingSizeDidChangeForChildContentContainer:container];
}

/*
 When the content container forwards viewWillTransitionToSize:withTransitionCoordinator: to its children, it will call this method to determine what size to send them.
 
 If the returned size is the same as the child container's current size, viewWillTransitionToSize:withTransitionCoordinator: will not be called.
 */
- (CGSize)sizeForChildContentContainer:(id <UIContentContainer>)container withParentContainerSize:(CGSize)parentSize NS_AVAILABLE_IOS(8_0)
{
    DLog(@"container:%@, parentSize width:%f hight:%f", container, parentSize.width, parentSize.height);

    return [super sizeForChildContentContainer:container withParentContainerSize:parentSize];
}

/*
 This method is called when the view controller's view's size is changed by its parent (i.e. for the root view controller when its window rotates or is resized).
 
 If you override this method, you should either call super to propagate the change to children or manually forward the change to children.
 */
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator NS_AVAILABLE_IOS(8_0)
{
    DLog(@"coordinator:%@, size width:%f hight:%f", coordinator, size.width, size.height);

    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

/*
 This method is called when the view controller's trait collection is changed by its parent.
 
 If you override this method, you should either call super to propagate the change to children or manually forward the change to children.
 */
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator NS_AVAILABLE_IOS(8_0)
{
    DLog(@"newCollection:%@ coordinator:%@", newCollection, coordinator);

    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    DLog(@"nibNameOrNil:%@, nibBundleOrNil:%@", nibNameOrNil, nibBundleOrNil);

    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
}


- (void)loadView // This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
{
    DLog();

    [super loadView];
}

- (void)viewDidLoad; // Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
{
    DLog();

    [super viewDidLoad];
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender NS_AVAILABLE_IOS(5_0)
{
    DLog(@"identifier:%@ sender:%@", identifier, sender);

    [super performSegueWithIdentifier:identifier sender:sender];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender NS_AVAILABLE_IOS(6_0) // Invoked immediately prior to initiating a segue. Return NO to prevent the segue from firing. The default implementation returns YES. This method is not invoked when -performSegueWithIdentifier:sender: is used.
{
    DLog(@"identifier:%@ sender:%@", identifier, sender);

    return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender NS_AVAILABLE_IOS(5_0)
{
    DLog(@"segue:%@ sender:%@", segue, sender);

    [super prepareForSegue:segue sender:sender];
}

// View controllers will receive this message during segue unwinding. The default implementation returns the result of -respondsToSelector: - controllers can override this to perform any ancillary checks, if necessary.
- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender NS_AVAILABLE_IOS(6_0)
{
    DLog(@"action:%@, fromViewController:%@, sender:%@", NSStringFromSelector(action), fromViewController, sender);

    return [super canPerformUnwindSegueAction:action fromViewController:fromViewController withSender:sender];
}

// Custom containers should override this method and search their children for an action handler (using -canPerformUnwindSegueAction:fromViewController:sender:). If a handler is found, the controller should return it. Otherwise, the result of invoking super's implementation should be returned.
- (UIViewController *)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender NS_AVAILABLE_IOS(6_0)
{
    DLog(@"action:%@, fromViewController:%@, sender:%@", NSStringFromSelector(action), fromViewController, sender);

    return [super viewControllerForUnwindSegueAction:action fromViewController:fromViewController withSender:sender];
}

// Custom container view controllers should override this method and return segue instances that will perform the navigation portion of segue unwinding.
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0)
{
    DLog(@"toViewController:%@, fromViewController:%@, identifier:%@", toViewController, fromViewController, identifier);

   return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
}

- (void)viewWillAppear:(BOOL)animated    // Called when the view is about to made visible. Default does nothing
{
    DLog();

    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated     // Called when the view has been fully transitioned onto the screen. Default does nothing
{
    DLog();

    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
{
    DLog();

    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
{
    DLog();

    [super viewDidDisappear:animated];
}

// Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
- (void)viewWillLayoutSubviews NS_AVAILABLE_IOS(5_0)
{
    DLog();

    [super viewWillLayoutSubviews];
}

// Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
- (void)viewDidLayoutSubviews NS_AVAILABLE_IOS(5_0)
{
    DLog();

    [super viewDidLayoutSubviews];
}


- (void)didReceiveMemoryWarning // Called when the parent application receives a memory warning. On iOS 6.0 it will no longer clear the view by default.
{
    DLog();
}

/*
 The next two methods are replacements for presentModalViewController:animated and
 dismissModalViewControllerAnimated: The completion handler, if provided, will be invoked after the presented
 controllers viewDidAppear: callback is invoked.
 */
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0)
{
    DLog(@"viewControllerToPresent:%@, flag:%d", viewControllerToPresent, flag);

    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

// The completion handler, if provided, will be invoked after the dismissed controller's viewDidDisappear: callback is invoked.
- (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^)(void))completion NS_AVAILABLE_IOS(5_0)
{
    DLog();

    [super dismissViewControllerAnimated:flag completion:completion];
}

/* This method returns either itself or the nearest ancestor that responds to the action. View controllers can return NO from canPerformAction:withSender: to opt out of being a target for a given action. */
- (UIViewController *)targetViewControllerForAction:(SEL)action sender:(id)sender NS_AVAILABLE_IOS(8_0)
{
    DLog(@"action:%@, sender:%@", NSStringFromSelector(action), sender);

    return [super targetViewControllerForAction:action sender:sender];
}

/* This method will show a view controller appropriately for the current size-class environment. It's implementation calls
 `[self targetViewControllerForAction:sender:]` first and redirects accordingly if the return value is not `self`, otherwise it will present the vc. */
- (void)showViewController:(UIViewController *)vc sender:(id)sender NS_AVAILABLE_IOS(8_0)
{
    DLog(@"vc:%@, sender:%@", vc, sender);

    [super showViewController:vc sender:sender];
}

/* This method will show a view controller within the semantic "detail" UI associated with the current size-class environment. It's implementation calls  `[self targetViewControllerForAction:sender:]` first and redirects accordingly if the return value is not `self`, otherwise it will present the vc.  */
- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender NS_AVAILABLE_IOS(8_0)
{
    DLog(@"vc:%@, sender:%@", vc, sender);

    [super showDetailViewController:vc sender:sender];
}

/*
 The methods in the UIContainerViewControllerProtectedMethods and the UIContainerViewControllerCallbacks
 categories typically should only be called by subclasses which are implementing new container view
 controllers. They may be overridden but must call super.
 */
#pragma mark - @interface UIViewController (UIContainerViewControllerProtectedMethods)

/*
 If the child controller has a different parent controller, it will first be removed from its current parent
 by calling removeFromParentViewController. If this method is overridden then the super implementation must
 be called.
 */
- (void)addChildViewController:(UIViewController *)childController NS_AVAILABLE_IOS(5_0)
{
    DLog(@"%@", childController);

    [super addChildViewController:childController];
}

/*
 This method can be used to transition between sibling child view controllers. The receiver of this method is
 their common parent view controller. (Use [UIViewController addChildViewController:] to create the
 parent/child relationship.) This method will add the toViewController's view to the superview of the
 fromViewController's view and the fromViewController's view will be removed from its superview after the
 transition completes. It is important to allow this method to add and remove the views. The arguments to
 this method are the same as those defined by UIView's block animation API. This method will fail with an
 NSInvalidArgumentException if the parent view controllers are not the same as the receiver, or if the
 receiver explicitly forwards its appearance and rotation callbacks to its children. Finally, the receiver
 should not be a subclass of an iOS container view controller. Note also that it is possible to use the
 UIView APIs directly. If they are used it is important to ensure that the toViewController's view is added
 to the visible view hierarchy while the fromViewController's view is removed.
 */
- (void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(5_0)
{
    DLog(@"fromViewController:%@, toViewController:%@, duration:%f, options:%lu", fromViewController, toViewController, duration, (unsigned long)options);

    [super transitionFromViewController:fromViewController toViewController:toViewController duration:duration options:options animations:animations completion:completion];
}

// If a custom container controller manually forwards its appearance callbacks, then rather than calling
// viewWillAppear:, viewDidAppear: viewWillDisappear:, or viewDidDisappear: on the children these methods
// should be used instead. This will ensure that descendent child controllers appearance methods will be
// invoked. It also enables more complex custom transitions to be implemented since the appearance callbacks are
// now tied to the final matching invocation of endAppearanceTransition.
- (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0)
{
    DLog();

    [super beginAppearanceTransition:isAppearing animated:animated];
}

- (void)endAppearanceTransition __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0)
{
    DLog();

    [super endAppearanceTransition];
}

// Call to modify the trait collection for child view controllers.
- (void)setOverrideTraitCollection:(UITraitCollection *)collection forChildViewController:(UIViewController *)childViewController NS_AVAILABLE_IOS(8_0)
{
    DLog();

    [super setOverrideTraitCollection:collection forChildViewController:childViewController];
}

- (UITraitCollection *)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController NS_AVAILABLE_IOS(8_0);
{
    DLog();

    return [super overrideTraitCollectionForChildViewController:childViewController];
}

#pragma mark - @interface UIViewController (UIContainerViewControllerCallbacks)

/*
 This method is consulted to determine if a view controller manually forwards its containment callbacks to
 any children view controllers. Subclasses of UIViewController that implement containment logic may override
 this method. The default implementation returns YES. If it is overridden and returns NO, then the subclass is
 responsible for forwarding the following methods as appropriate - viewWillAppear: viewDidAppear: viewWillDisappear:
 viewDidDisappear: willRotateToInterfaceOrientation:duration:
 willAnimateRotationToInterfaceOrientation:duration: didRotateFromInterfaceOrientation:
 */

- (BOOL)shouldAutomaticallyForwardAppearanceMethods NS_AVAILABLE_IOS(6_0)
{
    DLog();

    return [super shouldAutomaticallyForwardAppearanceMethods];
}


/*
 These two methods are public for container subclasses to call when transitioning between child
 controllers. If they are overridden, the overrides should ensure to call the super. The parent argument in
 both of these methods is nil when a child is being removed from its parent; otherwise it is equal to the new
 parent view controller.
 
 addChildViewController: will call [child willMoveToParentViewController:self] before adding the
 child. However, it will not call didMoveToParentViewController:. It is expected that a container view
 controller subclass will make this call after a transition to the new child has completed or, in the
 case of no transition, immediately after the call to addChildViewController:. Similarly
 removeFromParentViewController: does not call [self willMoveToParentViewController:nil] before removing the
 child. This is also the responsibilty of the container subclass. Container subclasses will typically define
 a method that transitions to a new child by first calling addChildViewController:, then executing a
 transition which will add the new child's view into the view hierarchy of its parent, and finally will call
 didMoveToParentViewController:. Similarly, subclasses will typically define a method that removes a child in
 the reverse manner by first calling [child willMoveToParentViewController:nil].
 */
- (void)willMoveToParentViewController:(UIViewController *)parent NS_AVAILABLE_IOS(5_0)
{
    DLog();

    [super willMoveToParentViewController:parent];
}

- (void)didMoveToParentViewController:(UIViewController *)parent NS_AVAILABLE_IOS(5_0)
{
    DLog();

    [super didMoveToParentViewController:parent];
}


#pragma mark - @interface UIViewController (UIConstraintBasedLayoutCoreMethods)
/* Base implementation sends -updateConstraints to the view.
 When a view has a view controller, this message is sent to the view controller during
 the autolayout updateConstraints pass in lieu of sending updateConstraints directly
 to the view.
 You may override this method in a UIViewController subclass for updating custom
 constraints instead of subclassing your view and overriding -[UIView updateConstraints].
 Overrides must call super or send -updateConstraints to the view.
 */
- (void)updateViewConstraints NS_AVAILABLE_IOS(6_0)
{
    DLog();

    [super updateViewConstraints];
}



@end
