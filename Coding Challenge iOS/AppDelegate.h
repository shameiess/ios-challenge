//
//  AppDelegate.h
//  Coding Challenge iOS
//
//  Created by Kevin Nguyen on 4/22/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

