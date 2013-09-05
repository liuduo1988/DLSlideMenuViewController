//
//  MenuTableView.m
//  DLSlideMenuViewController
//
//  Created by Derek Liu on 13-9-3.
//  Copyright (c) 2013年 人人猎头. All rights reserved.
//

#import "MenuTableView.h"

@implementation MenuTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    return cell;
}

@end
