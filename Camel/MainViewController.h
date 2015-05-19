//
//  MainViewController.h
//  Camel
//
//  Created by Nicholas Zhao on 15/5/19.
//  Copyright (c) 2015年 Nicholas Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MessageViewController.h"
#import "DeskViewController.h"
#import "ContactViewController.h"

@interface MainViewController : UIViewController

@property (nonatomic, strong) UITabBarController *tabbarController;

@end

