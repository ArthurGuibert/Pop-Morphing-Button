//
//  PresentingAnimator.h
//  MorphingButtons
//
//  Created by Arthur GUIBERT on 18/01/2015.
//  Copyright (c) 2015 Arthur GUIBERT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresentingAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) CGRect fromFrame;

@end
