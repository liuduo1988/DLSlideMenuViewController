//
//  DLSlideMenuViewController.m
//  DLSlideMenuViewController
//
//  Created by Derek Liu on 13-9-3.
//  Copyright (c) 2013年 人人猎头. All rights reserved.
//

#import "DLSlideMenuViewController.h"
#import "MenuTableView.h"
#import <QuartzCore/QuartzCore.h>

@interface DLSlideMenuViewController ()

@end

@implementation DLSlideMenuViewController {
    CGFloat _startOriginX;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // 菜单
    self.menuTableView = [[MenuTableView alloc] initWithFrame:CGRectMake(0, 0, MenuWidth, CGRectGetHeight(self.view.frame))
                                                        style:UITableViewStylePlain];
    [self.view addSubview:self.menuTableView];
    
    // 主视图
    self.mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.mainView.backgroundColor = [UIColor lightGrayColor];
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.mainView.bounds];
    self.mainView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.mainView.layer.shadowOffset = CGSizeMake(0, 0);
    self.mainView.layer.shadowOpacity = 0.5;
    self.mainView.layer.shadowPath = shadowPath.CGPath;
    [self.view addSubview:self.mainView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainView addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pan:(UIPanGestureRecognizer *)gestrueRecognizer {
    if (gestrueRecognizer.state == UIGestureRecognizerStateBegan) {
        _startOriginX = CGRectGetMinX(self.mainView.frame);
    } else if (gestrueRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestrueRecognizer translationInView:self.mainView];
        CGRect mainViewFrame = self.mainView.frame;
        mainViewFrame.origin.x = _startOriginX + translation.x;
        
        if (mainViewFrame.origin.x < 0) {
            self.mainView.frame = self.view.bounds;
        }
        
        if (mainViewFrame.origin.x > MenuWidth) {
            self.mainView.frame = CGRectMake(MenuWidth, 0, CGRectGetWidth(self.mainView.frame), CGRectGetHeight(self.mainView.frame));
        }
        
        if (mainViewFrame.origin.x > MenuWidth || mainViewFrame.origin.x < 0) {
            NSLog(@"%@", NSStringFromCGRect(mainViewFrame));
            return;
        }
            
        self.mainView.frame = mainViewFrame;
    } else if (gestrueRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint translation = [gestrueRecognizer translationInView:self.mainView];
        CGPoint velocity = [gestrueRecognizer velocityInView:self.mainView];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.1];
        if (translation.x > 0) {
            if (CGRectGetMinX(self.mainView.frame) > MenuWidth / 4 || velocity.x > 100) {
                self.mainView.frame = CGRectMake(MenuWidth, 0, CGRectGetWidth(self.mainView.frame), CGRectGetHeight(self.mainView.frame));
                if ([self.mainView.subviews[0] isKindOfClass:[UITableView class]]) {
                    ((UITableView *)self.mainView.subviews[0]).scrollEnabled = NO;
                }
            } else {
                self.mainView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainView.frame), CGRectGetHeight(self.mainView.frame));
                if ([self.mainView.subviews[0] isKindOfClass:[UITableView class]]) {
                    ((UITableView *)self.mainView.subviews[0]).scrollEnabled = YES;
                }
            }
        } else if (translation.x < 0) {
            if (CGRectGetMinX(self.mainView.frame) < MenuWidth / 4 * 3 || velocity.x > 100) {
                self.mainView.frame = CGRectMake(0, 0, CGRectGetWidth(self.mainView.frame), CGRectGetHeight(self.mainView.frame));
                if ([self.mainView.subviews[0] isKindOfClass:[UITableView class]]) {
                    ((UITableView *)self.mainView.subviews[0]).scrollEnabled = YES;
                }
            } else {
                self.mainView.frame = CGRectMake(MenuWidth, 0, CGRectGetWidth(self.mainView.frame), CGRectGetHeight(self.mainView.frame));
                if ([self.mainView.subviews[0] isKindOfClass:[UITableView class]]) {
                    ((UITableView *)self.mainView.subviews[0]).scrollEnabled = NO;
                }
            }
        }
        [UIView commitAnimations];
    }
}

@end
