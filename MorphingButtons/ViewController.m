//
//  ViewController.m
//  MorphingButtons
//
//  Created by Arthur GUIBERT on 18/01/2015.
//  Copyright (c) 2015 Arthur GUIBERT. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:109.0f / 255.0f
                                                green:195.0f / 255.0f
                                                 blue:220.0f / 255.0f
                                                alpha:1];
    
    self.button = [CustomButton buttonWithType:UIButtonTypeCustom];
    [self.button setTitle:@"Login" forState:UIControlStateNormal];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    self.button.backgroundColor = [UIColor colorWithRed:246.0f / 255.0f
                                                  green:247.0f / 255.0f
                                                   blue:251.0f / 255.0f
                                                  alpha:1];
    
    [self.button setTitleColor:[UIColor colorWithRed:162.0f / 255.0f
                                               green:168.0f / 255.0f
                                                blue:178.0f / 255.0f
                                               alpha:1]
                      forState:UIControlStateNormal];
    
    [self.button addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button
                                                          attribute:NSLayoutAttributeBottomMargin
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottomMargin
                                                         multiplier:1.f
                                                           constant:-60.f]];
    
}

- (void)present:(id)sender {
    [sender hideTextLabel];
    
    LoginViewController *modalViewController = [LoginViewController new];
    modalViewController.transitioningDelegate = self;
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    modalViewController.view.layer.cornerRadius = self.button.layer.cornerRadius;
    modalViewController.view.backgroundColor = self.button.backgroundColor;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.26 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.button setHidden:YES];
    });
    
    [self presentViewController:modalViewController
                                            animated:YES
                                          completion:NULL];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    PresentingAnimator* animator = [PresentingAnimator new];
    animator.fromFrame = self.button.frame;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    DismissingAnimator* animator = [DismissingAnimator new];
    animator.toFrame = self.button.frame;
    return animator;
}

@end
