//
//  LoginViewController.m
//  MorphingButtons
//
//  Created by Arthur GUIBERT on 18/01/2015.
//  Copyright (c) 2015 Arthur GUIBERT. All rights reserved.
//

#import <POP/POP.h>
#import "CustomButton.h"
#import "LoginViewController.h"
#import "ViewController.h"

@interface LoginViewController ()

@property (nonatomic) UIView *mainContainer;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    self.mainContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.mainContainer];
    
    [self addTitle];
    [self addLoginFields];
    [self addButton];
}

#pragma mark - View Element

- (void)addTitle
{
    UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 96)];
    title.font = [UIFont fontWithName:@"Avenir-Medium"
                                 size:28];
    title.text = @"Sign in";
    title.textColor = [UIColor colorWithRed:137.0f / 255.0f green:144.0f / 255.0f blue:160.0f / 255.0f alpha:1];
    title.textAlignment = NSTextAlignmentCenter;
    title.layer.transform = CATransform3DMakeScale(0.0001, 0.0001, 1);
    [self.mainContainer addSubview:title];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 12;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    
    [title.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

- (void)addLoginFields
{
    UIView* usernameFieldContainer = [[UIView alloc] initWithFrame:CGRectMake(20, 140, self.view.frame.size.width - 40, 40)];
    usernameFieldContainer.backgroundColor = [UIColor whiteColor];
    usernameFieldContainer.layer.cornerRadius = 6;
    usernameFieldContainer.layer.transform = CATransform3DMakeScale(0.0001, 0.0001, 1);
    [self.mainContainer addSubview:usernameFieldContainer];
    
    UITextField* username = [[UITextField alloc] initWithFrame:CGRectMake(8, 8, self.view.frame.size.width - 56, 24)];
    [usernameFieldContainer addSubview:username];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 4;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    scaleAnimation.beginTime = CACurrentMediaTime() + 0.1;
    
    [usernameFieldContainer.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimationUsername"];
    
    UIView* passwordFieldContainer = [[UIView alloc] initWithFrame:CGRectMake(20, 192, self.view.frame.size.width - 40, 40)];
    passwordFieldContainer.backgroundColor = [UIColor whiteColor];
    passwordFieldContainer.layer.cornerRadius = 6;
    passwordFieldContainer.layer.transform = CATransform3DMakeScale(0.0001, 0.0001, 1);
    [self.mainContainer addSubview:passwordFieldContainer];
    
    UITextField* password = [[UITextField alloc] initWithFrame:CGRectMake(8, 8, self.view.frame.size.width - 56, 24)];
    password.secureTextEntry = YES;
    [passwordFieldContainer addSubview:password];
    
    scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 4;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    scaleAnimation.beginTime = CACurrentMediaTime() + 0.2;
    
    [passwordFieldContainer.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimationPassword"];
}

- (void)addButton
{
    CustomButton* button = [[CustomButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 80, self.view.frame.size.width - 40, 44)];
    
    [button setTitle:@"Login" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:247.0f / 255.0f green:116.0f / 255.0f blue:98.0f / 255.0f alpha:1];
    button.layer.transform = CATransform3DMakeScale(0.0001, 0.0001, 1);
    [button addTarget:self action:@selector(hide:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainContainer addSubview:button];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 4;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    scaleAnimation.beginTime = CACurrentMediaTime() + 0.4;
    
    [button.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimationButton"];
}

- (void)hide:(id)sender
{
    POPBasicAnimation* animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    animation.toValue = @0;
    [self.mainContainer.layer pop_addAnimation:animation forKey:@"opacityAnimation"];
    
    ViewController* vc = (ViewController*)self.presentingViewController;
    
    [self dismissViewControllerAnimated:YES completion:^{
        [vc.button setHidden:NO];
        [vc.button showTextLabel];
    }];
}

@end
