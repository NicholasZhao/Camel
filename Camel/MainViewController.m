//
//  MainViewController.m
//  Camel
//
//  Created by Nicholas Zhao on 15/5/19.
//  Copyright (c) 2015年 Nicholas Zhao. All rights reserved.
//

#import "MainViewController.h"
#import "SideMenuViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"一卡通测试企业";
    //self.view = [[UITabBar alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    openItem.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = openItem;
    
    
    UITabBarController *switchTabBar = [[UITabBarController alloc] init];
    //    switchTabBar.delegate = self;
    MessageViewController *diseaseSearchView = [[MessageViewController alloc] init];
    
    DeskViewController *diseaseListView = [[DeskViewController alloc] init];
    
    ContactViewController *contactVC = [[ContactViewController alloc] init];
    
    NSArray *switchViewArray = [NSArray arrayWithObjects:diseaseSearchView,diseaseListView,contactVC,nil];
    switchTabBar.viewControllers = switchViewArray;
    switchTabBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:switchTabBar.view];
    [self addChildViewController: switchTabBar];
    
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
