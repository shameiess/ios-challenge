//
//  SOUser.h
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SOUserBadgeCount.h"

@interface SOUser : NSObject  <NSCoding>

@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *profileImage;
@property (nonatomic, strong) SOUserBadgeCount *badgeCount;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

