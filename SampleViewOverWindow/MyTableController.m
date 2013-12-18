//
//  MyTableController.m
//  SampleViewOverWindow
//
//  Created by Peter Chen on 12/18/13.
//  Copyright (c) 2013 Peter Chen. All rights reserved.
//

#import "MyTableController.h"

@interface MyTableController ()

@end

@implementation MyTableController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    cell.textLabel.text = @"Tap me";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = [UIColor lightGrayColor];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
