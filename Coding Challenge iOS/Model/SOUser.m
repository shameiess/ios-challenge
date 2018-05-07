//
//  SOUser.m
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import "SOUser.h"

@implementation SOUser

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _displayName = dictionary[@"display_name"];
        _profileImage = dictionary[@"profile_image"];
        
        NSDictionary *badgeCount = dictionary[@"badge_counts"];
        _badgeCount = [[SOUserBadgeCount alloc] initWithDictionary:badgeCount];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: displayName: %@, profileImage: %@, gold: %d, silver: %d, bronze: %d>",
            [self class],
            _displayName,
            _profileImage,
            _badgeCount.gold,
            _badgeCount.silver,
            _badgeCount.bronze
            ];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.displayName = [coder decodeObjectForKey:@"displayName"];
        self.profileImage = [coder decodeObjectForKey:@"profileImage"];
        self.badgeCount = [coder decodeObjectForKey:@"badgeCount"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.displayName forKey:@"displayName"];
    [coder encodeObject:self.profileImage forKey:@"profileImage"];
    [coder encodeObject:self.badgeCount forKey:@"badgeCount"];
}

@end
