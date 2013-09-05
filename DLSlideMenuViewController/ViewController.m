//
//  ViewController.m
//  DLSlideMenuViewController
//
//  Created by Derek Liu on 13-9-3.
//  Copyright (c) 2013年 人人猎头. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"DLSlideMenuViewController";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.mainView.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.mainView addSubview:tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row %d", indexPath.row];
    return cell;
}

@end
