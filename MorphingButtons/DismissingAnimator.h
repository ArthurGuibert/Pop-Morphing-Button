//
//  DismissingAnimator.h
//  MorphingButtons
//
//  Created by Arthur GUIBERT on 18/01/2015.
//  Copyright (c) 2015 Arthur GUIBERT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DismissingAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) CGRect toFrame;

@end
