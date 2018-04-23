//
//  SOUserBadgeCount.h
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOUserBadgeCount : NSObject

@property (nonatomic, assign) int bronze;
@property (nonatomic, assign) int silver;
@property (nonatomic, assign) int gold;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
