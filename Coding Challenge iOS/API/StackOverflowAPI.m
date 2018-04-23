//
//  StackOverflowAPI.m
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import "StackOverflowAPI.h"

@implementation StackOverflowAPI

+ (StackOverflowAPI *)api {
    static dispatch_once_t once;
    static StackOverflowAPI *instance;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[StackOverflowAPI alloc] init];
        }
    });
    return instance;
}

- (void)fetchStackOverFlowUsersFeed:(void (^)(NSArray<SOUser *> *, NSError *error))completion {
    static NSString *kBaseUrl = @"https://api.stackexchange.com/2.2/users?site=stackoverflow";
    
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:kBaseUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
        }
        
        NSError *err;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
        if (err) {
            NSLog(@"Failed to serialize to JSON: %@", err);
            return;
        }
        
        NSMutableArray<SOUser *> *parsedUsers = [NSMutableArray arrayWithCapacity:responseDictionary.count];

        for (NSDictionary *item in responseDictionary[@"items"]) {
            SOUser *user = [[SOUser alloc] initWithDictionary:item];
            NSLog(@"%@", [user description]);
            [parsedUsers addObject:user];
        }
        completion(parsedUsers, nil);
    }] resume];
}

@end
