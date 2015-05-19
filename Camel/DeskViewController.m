//
//  DeskViewController.m
//  Camel
//
//  Created by Nicholas Zhao on 15/5/19.
//  Copyright (c) 2015年 Nicholas Zhao. All rights reserved.
//

#import "DeskViewController.h"

@implementation DeskViewController

- (id)init {
    if ([super init] != nil) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"工作台" image:[UIImage imageNamed:@"1.png"] tag:101];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
