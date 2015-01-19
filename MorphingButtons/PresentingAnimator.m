//
//  PresentingAnimator.m
//  MorphingButtons
//
//  Created by Arthur GUIBERT on 18/01/2015.
//  Copyright (c) 2015 Arthur GUIBERT. All rights reserved.
//

#import <POP/POP.h>
#import "PresentingAnimator.h"

@implementation PresentingAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 2.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0,
                              0,
                              CGRectGetWidth(transitionContext.containerView.bounds) - 44.f,
                              CGRectGetHeight(transitionContext.containerView.bounds) - 144.f);
    toView.center = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    
    [transitionContext.containerView addSubview:toView];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.fromFrame), CGRectGetMidY(self.fromFrame))];
    positionAnimation.toValue = [NSValue valueWithCGPoint:transitionContext.containerView.center];
    positionAnimation.springBounciness = 4;
    positionAnimation.beginTime = CACurrentMediaTime() + 0.25;
    
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    sizeAnimation.springBounciness = 4;
    sizeAnimation.fromValue = [NSValue valueWithCGSize:self.fromFrame.size];
    sizeAnimation.toValue = [NSValue valueWithCGSize:toView.frame.size];
    sizeAnimation.beginTime = CACurrentMediaTime() + 0.25;
    
    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [toView.layer pop_addAnimation:sizeAnimation forKey:@"sizeAnimation"];
}

@end
