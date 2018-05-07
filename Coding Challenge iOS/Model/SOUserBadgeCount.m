//
//  SOUserBadgeCount.m
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import "SOUserBadgeCount.h"

@implementation SOUserBadgeCount

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _bronze = [dictionary[@"bronze"] intValue];
        _silver = [dictionary[@"silver"] intValue];
        _gold = [dictionary[@"gold"] intValue];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.bronze = [coder decodeIntForKey:@"bronze"];
        self.silver = [coder decodeIntForKey:@"silver"];
        self.gold = [coder decodeIntForKey:@"gold"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeInt:self.bronze forKey:@"bronze"];
    [coder encodeInt:self.silver forKey:@"silver"];
    [coder encodeInt:self.gold forKey:@"gold"];
}

@end
