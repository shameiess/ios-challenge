//
//  Persist.m
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 5/6/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import "Persist.h"

@implementation Persist

+ (NSString*)cachedUsersPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray<NSURL *> *URLs = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *URL = URLs.firstObject;
    NSString *cachedEventsPath = [[URL URLByAppendingPathComponent:@"users.data"] path];
    return cachedEventsPath;
}

+ (void)saveSOUsers:(NSArray<SOUser *>*)users {
    NSString *cachedUsersPath = [self cachedUsersPath];
    BOOL isSucessfullySaved = [NSKeyedArchiver archiveRootObject:users toFile:cachedUsersPath];
    if (isSucessfullySaved) {
        NSLog(@"Saved users");
    } else {
        NSLog(@"Failed to save users");
    }
}

+ (NSArray<SOUser *> *)fetchUsers {
    NSString *cachedUsersPath = [self cachedUsersPath];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:cachedUsersPath];
}

@end
