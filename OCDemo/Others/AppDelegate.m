//
//  AppDelegate.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/15.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "RootNavigationViewController.h"
#import "Constants.h"
#import "BlockTester.h"
#import "Car.h"
#import "objc/message.h"

@interface AppDelegate () <CarFunctionsDelegate>

@end

@implementation AppDelegate 

- (void) turnOn{
    NSLog(@"turn On");
}
- (void) accelerate{
    NSLog(@"accelerate!");
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = UIWindow.new;
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[RootNavigationViewController alloc] initWithRootViewController:FirstViewController.new];;
    
    
    Car *mustang = [[Car alloc] initWithMaker:@"Ford" color:UIColor.blueColor];
    [mustang turnOn];
    [mustang accelerate];
    
    Class myClass = [mustang class];
    Class superClass = class_getSuperclass(myClass);
    NSLog(@"superclass of %@ is %@", NSStringFromClass(myClass), NSStringFromClass(superClass));
    
    SEL selector = @selector(turnOn);
    NSLog(@"Selector: %@", NSStringFromSelector(selector));
    
    Method method = class_getClassMethod([mustang class], selector);
    NSLog(@"%d", method_getNumberOfArguments(method));
    
    VideoGameType type = VideoGameRPG | VideoGameFPS;
    
    if (type == VideoGameFPS) {
        NSLog(@"yes VideoGameFPS");
    }else{
        NSLog(@"no VideoGameFPS");
    }
    if (type == VideoGameRPG) {
        NSLog(@"yes VideoGameRPG");
    }else{
        NSLog(@"no VideoGameRPG");
    }
    PlayerType playerType = PlayerTypeEnemy | PlayerTypeAlien;
    if (playerType & PlayerTypeAlien) {
        NSLog(@"yes PlayerTypeAlien");
    }
    if (playerType & PlayerTypeEnemy) {
        NSLog(@"yes PlayerTypeEnemy");
    }
    if (playerType & PlayerTypePlayer) {
        NSLog(@"yes PlayerTypePlayer");
    }
    
    BlockTester *blockTester = [[BlockTester alloc] init];
    [blockTester runTests];
    
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
