//
//  AppDelegate.h
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/15.
//  Copyright © 2018 techcul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "RootNavigationViewController.h"
//#import "Car.h"
@class Car;

#import "Car+Clean.h"
#import "Car+Protected.h"
#import "Constants.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, CarFunctionsDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

