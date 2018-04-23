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
@property (nonatomic) UIRefreshControl *refreshControl;
@property (nonatomic, strong) NSMutableArray<SOUser *> *users;

@end

@implementation SOUsersTableVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"SOUserCell" bundle:nil] forCellReuseIdentifier:SOUserCellIdentifier];
    
    // Pull to Refresh
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchStackOverFlowUsersFeed) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.tintColor = [UIColor colorWithRed:242/255.0 green:127/255.0 blue:51/255.0 alpha:1];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Fetching Stackoverflow users ..."];
    self.table.refreshControl = self.refreshControl;
    
    [self fetchStackOverFlowUsersFeed];
}

#pragma mark - Private Methods

- (void)fetchStackOverFlowUsersFeed {
    [[StackOverflowAPI api] fetchStackOverFlowUsersFeed:^(NSArray<SOUser *> *users, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.users = [users mutableCopy];
            [self.table reloadData];
            [self.refreshControl endRefreshing];
        });
    }];
}

- (SOUser *)userAtIndexPath:(NSIndexPath *)indexPath {
    return self.users[indexPath.item];
}

- (void)configureUserCell:(SOUserCell *)cell withUser:(SOUser *)user {
    cell.name.text = user.displayName;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user.profileImage]]];
    cell.goldCount.text = [NSString stringWithFormat:@"%d", user.badgeCount.gold];
    cell.silverCount.text = [NSString stringWithFormat:@"%d", user.badgeCount.silver];
    cell.bronzeCount.text = [NSString stringWithFormat:@"%d", user.badgeCount.bronze];
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
    
    SOUserCell *cell = [tableView dequeueReusableCellWithIdentifier:SOUserCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[SOUserCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SOUserCellIdentifier];
    }
    [self configureUserCell:cell withUser:user];

    return cell;
}

@end
