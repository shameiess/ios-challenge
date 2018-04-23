//
//  SOUsersTableVC.m
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import "SOUsersTableVC.h"
#import "SOUser.h"
#import "StackOverflowAPI.h"
#import "SOUserCell.h"

static NSString *const SOUserCellIdentifier = @"SOUserCell";

@interface SOUsersTableVC () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) NSMutableArray<SOUser *> *users;

@end

@implementation SOUsersTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[SOUserCell self] forCellReuseIdentifier:SOUserCellIdentifier];
    [self fetchStackOverFlowUsersFeed];
}

- (void)fetchStackOverFlowUsersFeed {
    [[StackOverflowAPI api] fetchStackOverFlowUsersFeed:^(NSArray<SOUser *> *users, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.users = [users mutableCopy];
            [self.table reloadData];
        });
    }];
}

- (SOUser *)userAtIndexPath:(NSIndexPath *)indexPath {
    return self.users[indexPath.item];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SOUser *user = [self userAtIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SOUserCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = user.displayName;
    cell.detailTextLabel.text = user.profileImage;
    return cell;
}


@end
