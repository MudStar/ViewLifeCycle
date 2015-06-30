//
//  ShowViewCycle.m
//  ViewLifeCycle
//
//  Created by Neil on 6/5/15.
//  Copyright (c) 2015 Prevideo. All rights reserved.
//

#import "ShowViewCycle.h"

@implementation ShowViewCycle

#pragma mark - @protocol UICoordinateSpace <NSObject>

- (CGPoint)convertPoint:(CGPoint)point toCoordinateSpace:(id <UICoordinateSpace>)coordinateSpace NS_AVAILABLE_IOS(8_0)
{
    DLog();

    return [super convertPoint:point toCoordinateSpace:coordinateSpace];
}

- (CGPoint)convertPoint:(CGPoint)point fromCoordinateSpace:(id <UICoordinateSpace>)coordinateSpace NS_AVAILABLE_IOS(8_0)
{
    DLog();

    return [super convertPoint:point fromCoordinateSpace:coordinateSpace];
}

- (CGRect)convertRect:(CGRect)rect toCoordinateSpace:(id <UICoordinateSpace>)coordinateSpace NS_AVAILABLE_IOS(8_0)
{
    DLog();

    return [super convertRect:rect toCoordinateSpace:coordinateSpace];
}


- (CGRect)convertRect:(CGRect)rect fromCoordinateSpace:(id <UICoordinateSpace>)coordinateSpace NS_AVAILABLE_IOS(8_0)
{
    DLog();

    return [super convertRect:rect fromCoordinateSpace:coordinateSpace];
    
}

#pragma mark - @interface UIView : UIResponder <NSCoding, UIAppearance, UIAppearanceContainer, UIDynamicItem, UITraitEnvironment, UICoordinateSpace>

- (instancetype)initWithFrame:(CGRect)frame;          // default initializer
{
    DLog();
    
    return [super initWithFrame:frame];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;   // recursively calls -pointInside:withEvent:. point is in the receiver's coordinate system
{
    DLog();

    return [super hitTest:point withEvent:event];
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;   // default returns YES if point is in bounds
{
    DLog();

    return [super pointInside:point withEvent:event];
}

- (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view
{
    DLog();

    return [super convertPoint:point toView:view];
}

- (CGPoint)convertPoint:(CGPoint)point fromView:(UIView *)view
{
    DLog();

    return [super convertPoint:point fromView:view];
}

- (CGRect)convertRect:(CGRect)rect toView:(UIView *)view
{
    DLog();

    return [super convertRect:rect toView:view];
}

- (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view
{
    DLog();

    return [super convertRect:rect fromView:view];
}

#pragma mark - @interface UIView(UIViewHierarchy)

- (void)removeFromSuperview
{
    [super removeFromSuperview];
    
    DLog();
}

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    [super insertSubview:view atIndex:index];
    
    DLog();
}

- (void)exchangeSubviewAtIndex:(NSInteger)index1 withSubviewAtIndex:(NSInteger)index2
{
    [super exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
    
    DLog();
}

- (void)addSubview:(UIView *)view
{
    [super addSubview:view];
    
    DLog();
}

- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview
{
    [super insertSubview:view belowSubview:siblingSubview];
    
    DLog();
}

- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview
{
    [super insertSubview:view aboveSubview:siblingSubview];
    
    DLog();
}

- (void)bringSubviewToFront:(UIView *)view
{
    [super bringSubviewToFront:view];
    
    DLog();
}

- (void)sendSubviewToBack:(UIView *)view
{
    [super sendSubviewToBack:view];
    
    DLog();
}

- (void)didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];
    
    DLog();
}

- (void)willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview:subview];
    
    DLog();
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    DLog();
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    DLog();
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    
    DLog();
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    
    DLog();
}

- (BOOL)isDescendantOfView:(UIView *)view  // returns YES for self.
{
    DLog();

    return [super isDescendantOfView:view];
}

- (UIView *)viewWithTag:(NSInteger)tag     // recursive search. includes self
{
    DLog();

    return [super viewWithTag:tag];
}

// Allows you to perform layout before the drawing cycle happens. -layoutIfNeeded forces layout early
- (void)setNeedsLayout
{
    [super setNeedsLayout];
    
    DLog();
}

- (void)layoutIfNeeded
{
    [super layoutIfNeeded];
    
    DLog();
}

- (void)layoutSubviews    // override point. called by layoutIfNeeded automatically. As of iOS 6.0, when constraints-based layout is used the base implementation applies the constraints-based layout, otherwise it does nothing.
{
    [super layoutSubviews];
    
    DLog();
}

/*
 -layoutMargins returns a set of insets from the edge of the view's bounds that denote a default spacing for laying out content.
 If preservesSuperviewLayoutMargins is YES, margins cascade down the view tree, adjusting for geometry offsets, so that setting the left value of layoutMargins on a superview will affect the left value of layoutMargins for subviews positioned close to the left edge of their superview's bounds
 If your view subclass uses layoutMargins in its layout or drawing, override -layoutMarginsDidChange in order to refresh your view if the margins change.
 */
- (void)layoutMarginsDidChange NS_AVAILABLE_IOS(8_0)
{
    [super layoutMarginsDidChange];
    
    DLog();
}

#pragma mark - @interface UIView(UIViewRendering)

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    DLog();
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    
    DLog();
}

- (void)setNeedsDisplayInRect:(CGRect)rect
{
    [super setNeedsDisplayInRect:rect];
    
    DLog();
}

/*
 The -tintColorDidChange message is sent to appropriate subviews of a view when its tintColor is changed by client code or to subviews in the view hierarchy of a view whose tintColor is implicitly changed when its superview or tintAdjustmentMode changes.
 */
- (void)tintColorDidChange NS_AVAILABLE_IOS(7_0)
{
    [super tintColorDidChange];
    
    DLog();
}

#pragma mark - @interface UIView (UIViewGestureRecognizers)


- (void)addGestureRecognizer:(UIGestureRecognizer*)gestureRecognizer NS_AVAILABLE_IOS(3_2)
{
    [super addGestureRecognizer:gestureRecognizer];
    
    DLog();
}

- (void)removeGestureRecognizer:(UIGestureRecognizer*)gestureRecognizer NS_AVAILABLE_IOS(3_2)
{
    [super removeGestureRecognizer:gestureRecognizer];
    
    DLog();
}

// called when the recognizer attempts to transition out of UIGestureRecognizerStatePossible if a touch hit-tested to this view will be cancelled as a result of gesture recognition
// returns YES by default. return NO to cause the gesture recognizer to transition to UIGestureRecognizerStateFailed
// subclasses may override to prevent recognition of particular gestures. for example, UISlider prevents swipes parallel to the slider that start in the thumb
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer NS_AVAILABLE_IOS(6_0)
{
    DLog();

    return [super gestureRecognizerShouldBegin:gestureRecognizer];
}

#pragma mark - @interface UIView (UIViewMotionEffects)

/*! Begins applying `effect` to the receiver. The effect's emitted keyPath/value pairs will be
 applied to the view's presentation layer.
 
 Animates the transition to the motion effect's values using the present UIView animation
 context. */
- (void)addMotionEffect:(UIMotionEffect *)effect NS_AVAILABLE_IOS(7_0)
{
    [super addMotionEffect:effect];
    
    DLog();
}

/*! Stops applying `effect` to the receiver. Any affected presentation values will animate to
 their post-removal values using the present UIView animation context. */
- (void)removeMotionEffect:(UIMotionEffect *)effect NS_AVAILABLE_IOS(7_0)
{
    [super removeMotionEffect:effect];
    
    DLog();
}

#pragma mark - @interface UIView (UIConstraintBasedLayoutInstallingConstraints)

- (void)addConstraint:(NSLayoutConstraint *)constraint NS_AVAILABLE_IOS(6_0) // This method will be deprecated in a future release and should be avoided.  Instead, set NSLayoutConstraint's active property to YES.
{
    [super addConstraint:constraint];
    
    DLog();
}

- (void)addConstraints:(NSArray *)constraints NS_AVAILABLE_IOS(6_0) // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint activateConstraints:].
{
    [super addConstraints:constraints];
    
    DLog();
}

- (void)removeConstraint:(NSLayoutConstraint *)constraint NS_AVAILABLE_IOS(6_0) // This method will be deprecated in a future release and should be avoided.  Instead set NSLayoutConstraint's active property to NO.
{
    [super removeConstraint:constraint];
    
    DLog();
}

- (void)removeConstraints:(NSArray *)constraints NS_AVAILABLE_IOS(6_0) // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint deactivateConstraints:].
{
    [super removeConstraints:constraints];
}

#pragma mark - @interface UIView (UIConstraintBasedLayoutCoreMethods)

- (void)updateConstraintsIfNeeded NS_AVAILABLE_IOS(6_0) // Updates the constraints from the bottom up for the view hierarchy rooted at the receiver. UIWindow's implementation creates a layout engine if necessary first.
{
    [super updateConstraintsIfNeeded];
    
    DLog();
}

- (void)updateConstraints NS_AVAILABLE_IOS(6_0) // Override this to adjust your special constraints during a constraints update pass
{
    [super updateConstraints];
    
    DLog();
}

- (BOOL)needsUpdateConstraints NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super needsUpdateConstraints];
}

- (void)setNeedsUpdateConstraints NS_AVAILABLE_IOS(6_0)
{
    [super setNeedsUpdateConstraints];
    
    DLog();
}

#pragma mark - @interface UIView (UIConstraintBasedCompatibility)

/* by default, the autoresizing mask on a view gives rise to constraints that fully determine the view's position.  Any constraints you set on the view are likely to conflict with autoresizing constraints, so you must turn off this property first. IB will turn it off for you.
 */
- (BOOL)translatesAutoresizingMaskIntoConstraints NS_AVAILABLE_IOS(6_0) // Default YES
{
    DLog();
    
    return [super translatesAutoresizingMaskIntoConstraints];
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)flag NS_AVAILABLE_IOS(6_0)
{
    [super setTranslatesAutoresizingMaskIntoConstraints:flag];
    
    DLog();
}

#pragma mark - @interface UIView (UIConstraintBasedLayoutLayering)

/* Constraints do not actually relate the frames of the views, rather they relate the "alignment rects" of views.  This is the same as the frame unless overridden by a subclass of UIView.  Alignment rects are the same as the "layout rects" shown in Interface Builder 3.  Typically the alignment rect of a view is what the end user would think of as the bounding rect around a control, omitting ornamentation like shadows and engraving lines.  The edges of the alignment rect are what is interesting to align, not the shadows and such.
 */

/* These two methods should be inverses of each other.  UIKit will call both as part of layout computation.
 They may be overridden to provide arbitrary transforms between frame and alignment rect, though the two methods must be inverses of each other.
 However, the default implementation uses -alignmentRectInsets, so just override that if it's applicable.  It's easier to get right.
 A view that displayed an image with some ornament would typically override these, because the ornamental part of an image would scale up with the size of the frame.
 Set the NSUserDefault UIViewShowAlignmentRects to YES to see alignment rects drawn.
 */
- (CGRect)alignmentRectForFrame:(CGRect)frame NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super alignmentRectForFrame:frame];
}

- (CGRect)frameForAlignmentRect:(CGRect)alignmentRect NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super frameForAlignmentRect:alignmentRect];
}

/* override this if the alignment rect is obtained from the frame by insetting each edge by a fixed amount.  This is only called by alignmentRectForFrame: and frameForAlignmentRect:.
 */
- (UIEdgeInsets)alignmentRectInsets NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super alignmentRectInsets];
}

/* When you make a constraint on the NSLayoutAttributeBaseline of a view, the system aligns with the bottom of the view returned from this method. A nil return is interpreted as the receiver, and a non-nil return must be in the receiver's subtree.  UIView's implementation returns self.
 */
- (UIView *)viewForBaselineLayout NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super viewForBaselineLayout];
}


- (CGSize)intrinsicContentSize NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super intrinsicContentSize];
}

- (void)invalidateIntrinsicContentSize NS_AVAILABLE_IOS(6_0) // call this when something changes that affects the intrinsicContentSize.  Otherwise UIKit won't notice that it changed.
{
    DLog();
    
    return [super invalidateIntrinsicContentSize];
}

- (UILayoutPriority)contentHuggingPriorityForAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super contentHuggingPriorityForAxis:axis];
}

- (void)setContentHuggingPriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0)
{
    [super setContentHuggingPriority:priority forAxis:axis];
    
    DLog();
}

- (UILayoutPriority)contentCompressionResistancePriorityForAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super contentCompressionResistancePriorityForAxis:axis];
}

- (void)setContentCompressionResistancePriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super setContentCompressionResistancePriority:priority forAxis:axis];
}

#pragma mark - @interface UIView (UIConstraintBasedLayoutFittingSize)
/* The size fitting most closely to targetSize in which the receiver's subtree can be laid out while optimally satisfying the constraints. If you want the smallest possible size, pass UILayoutFittingCompressedSize; for the largest possible size, pass UILayoutFittingExpandedSize.
 Also see the comment for UILayoutPriorityFittingSizeLevel.
 */
- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize NS_AVAILABLE_IOS(6_0) // Equivalent to sending -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: with UILayoutPriorityFittingSizeLevel for both priorities.
{
    DLog();
    
    return [super systemLayoutSizeFittingSize:targetSize];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority NS_AVAILABLE_IOS(8_0)
{
    DLog();
    
    return [super systemLayoutSizeFittingSize:targetSize withHorizontalFittingPriority:horizontalFittingPriority verticalFittingPriority:verticalFittingPriority];
}

#pragma mark - @interface UIView (UIConstraintBasedLayoutDebugging)

/* This returns a list of all the constraints that are affecting the current location of the receiver.  The constraints do not necessarily involve the receiver, they may affect the frame indirectly.
 Pass UILayoutConstraintAxisHorizontal for the constraints affecting [self center].x and CGRectGetWidth([self bounds]), and UILayoutConstraintAxisVertical for the constraints affecting[self center].y and CGRectGetHeight([self bounds]).
 */
- (NSArray *)constraintsAffectingLayoutForAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super constraintsAffectingLayoutForAxis:axis];
}

/* If there aren't enough constraints in the system to uniquely determine layout, we say the layout is ambiguous.  For example, if the only constraint in the system was x = y + 100, then there are lots of different possible values for x and y.  This situation is not automatically detected by UIKit, due to performance considerations and details of the algorithm used for layout.
 The symptom of ambiguity is that views sometimes jump from place to place, or possibly are just in the wrong place.
 -hasAmbiguousLayout runs a check for whether there is another center and bounds the receiver could have that could also satisfy the constraints.
 -exerciseAmbiguousLayout does more.  It randomly changes the view layout to a different valid layout.  Making the UI jump back and forth can be helpful for figuring out where you're missing a constraint.
 */
- (BOOL)hasAmbiguousLayout NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    return [super hasAmbiguousLayout];
}

- (void)exerciseAmbiguityInLayout NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    [super exerciseAmbiguityInLayout];
}

#pragma mark - @interface UIView (UIStateRestoration)

- (void) encodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    [super encodeRestorableStateWithCoder:coder];
}
- (void) decodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0)
{
    DLog();
    
    [super decodeRestorableStateWithCoder:coder];
}

#pragma mark - @interface UIView (UISnapshotting)
/*
 * When requesting a snapshot, 'afterUpdates' defines whether the snapshot is representative of what's currently on screen or if you wish to include any recent changes before taking the snapshot.
 
 If called during layout from a committing transaction, snapshots occurring after the screen updates will include all changes made, regardless of when the snapshot is taken and the changes are made. For example:
 
 - (void)layoutSubviews {
 UIView *snapshot = [self snapshotViewAfterScreenUpdates:YES];
 self.alpha = 0.0;
 }
 
 The snapshot will appear to be empty since the change in alpha will be captured by the snapshot. If you need to animate the view during layout, animate the snapshot instead.
 
 * Creating snapshots from existing snapshots (as a method to duplicate, crop or create a resizable variant) is supported. In cases where many snapshots are needed, creating a snapshot from a common superview and making subsequent snapshots from it can be more performant. Please keep in mind that if 'afterUpdates' is YES, the original snapshot is committed and any changes made to it, not the view originally snapshotted, will be included.
 */
- (UIView *)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates NS_AVAILABLE_IOS(7_0)
{
    DLog();
    
    return [super snapshotViewAfterScreenUpdates:afterUpdates];
}
- (UIView *)resizableSnapshotViewFromRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates withCapInsets:(UIEdgeInsets)capInsets NS_AVAILABLE_IOS(7_0)  // Resizable snapshots will default to stretching the center
// Use this method to render a snapshot of the view hierarchy into the current context. Returns NO if the snapshot is missing image data, YES if the snapshot is complete. Calling this method from layoutSubviews while the current transaction is committing will capture what is currently displayed regardless if afterUpdates is YES.
{
    DLog();
    
    return [super resizableSnapshotViewFromRect:rect afterScreenUpdates:afterUpdates withCapInsets:capInsets];
}

- (BOOL)drawViewHierarchyInRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates NS_AVAILABLE_IOS(7_0)
{
    DLog();
    
    return [super drawViewHierarchyInRect:rect afterScreenUpdates:afterUpdates];
}


@end
