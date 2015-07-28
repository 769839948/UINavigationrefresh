//
//  RefreshViewController.m
//  NavigationTableView
//
//  Created by Jane on 7/28/15.
//  Copyright (c) 2015 Jane. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshViewController ()
{
    NSMutableArray *_myExamArray;
}

@end

@implementation RefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myExamArray = [[NSMutableArray alloc]init];
    for (int i =0; i<10; i++) {
        [_myExamArray addObject:@"我的第%d场考试"];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_myExamArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdetify = @"AddExamTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdetify];
    }
    cell.textLabel.text = [_myExamArray objectAtIndex:indexPath.row];
    return cell;
}


- (void)reloadTableViewDataSource{
    
    _reloading = YES;
    for (int i=10; i<15; i++) {
        [_myExamArray addObject:@"woshi"];
    }
    
}

- (void)doneLoadingTableViewData{
    
    //  model should call this when its done loading
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    [self.tableView reloadData];
}


@end
