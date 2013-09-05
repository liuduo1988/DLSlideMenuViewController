//
//  MenuTableView.h
//  DLSlideMenuViewController
//
//  Created by Derek Liu on 13-9-3.
//  Copyright (c) 2013年 人人猎头. All rights reserved.
//

#import <UIKit/UIKit.h>

const static CGFloat MenuWidth = 100.0;

@interface MenuTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *menuItems; // 菜单项，文本数组

@end
