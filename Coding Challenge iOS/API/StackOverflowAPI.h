//
//  StackOverflowAPI.h
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import "SOUser.h"

@interface StackOverflowAPI : NSObject

+ (StackOverflowAPI *)api;

- (void)fetchStackOverFlowUsersFeed:(void (^)(NSArray<SOUser *> *, NSError *error))completion;

@end
