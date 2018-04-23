//
//  SOUserCell.h
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOUserCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *goldCount;
@property (weak, nonatomic) IBOutlet UILabel *silverCount;
@property (weak, nonatomic) IBOutlet UILabel *bronzeCount;

@end
