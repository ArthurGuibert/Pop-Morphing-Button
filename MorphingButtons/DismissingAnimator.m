//
//  DismissingAnimator.m
//  MorphingButtons
//
//  Created by Arthur GUIBERT on 18/01/2015.
//  Copyright (c) 2015 Arthur GUIBERT. All rights reserved.
//

#import <POP/POP.h>
#import "DismissingAnimator.h"

@implementation DismissingAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    toVC.view.userInteractionEnabled = YES;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    sizeAnimation.springBounciness = 4;
    sizeAnimation.toValue = [NSValue valueWithCGSize:self.toFrame.size];
    sizeAnimation.beginTime = CACurrentMediaTime() + 0.25;

    [sizeAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.toFrame), CGRectGetMidY(self.toFrame))];
    positionAnimation.springBounciness = 4;
    positionAnimation.beginTime = CACurrentMediaTime() + 0.25;
    
    
    [fromVC.view.layer pop_addAnimation:sizeAnimation forKey:@"offscreenAnimation"];
    [fromVC.view.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}


@end
