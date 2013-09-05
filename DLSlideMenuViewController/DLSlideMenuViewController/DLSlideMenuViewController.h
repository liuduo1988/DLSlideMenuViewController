//
//  DLSlideMenuViewController.h
//  DLSlideMenuViewController
//
//  Created by Derek Liu on 13-9-3.
//  Copyright (c) 2013年 人人猎头. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuTableView;

@interface DLSlideMenuViewController : UIViewController

@property (nonatomic, strong) MenuTableView *menuTableView; // 菜单
@property (nonatomic, strong) UIView *mainView; // 主视图

@end
