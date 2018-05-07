//
//  Persist.h
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 5/6/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOUser.h"

@interface Persist: NSObject

+ (void)saveSOUsers:(NSArray<SOUser *> *)users;
+ (NSArray<SOUser *> *)fetchUsers;

@end
