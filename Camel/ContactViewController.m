//
//  ContactViewController.m
//  Camel
//
//  Created by Nicholas Zhao on 15/5/19.
//  Copyright (c) 2015年 Nicholas Zhao. All rights reserved.
//

#import "ContactViewController.h"

@implementation ContactViewController

- (id)init {
    if ([super init] != nil) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"通讯录" image:[UIImage imageNamed:@"1.png"] tag:101];
        self.tabBarItem = item;
    }
    return self;
}

@end
