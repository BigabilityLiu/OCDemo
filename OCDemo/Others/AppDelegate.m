//
//  AppDelegate.m
//  OCDemo
//
//  Created by techcul_iOS on 2018/11/15.
//  Copyright © 2018 techcul. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

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
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    FirstViewController *vc = [[FirstViewController alloc] init];
    RootNavigationViewController *navVC = [[RootNavigationViewController alloc] init];
    [navVC addChildViewController:vc];
    self.window.rootViewController = navVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    Car *mustang = [[Car alloc] initWithFactory:@"Ford" andColor:UIColor.blueColor];
    NSLog(@"mustang is made by %@, and it's color is %@", mustang.make, mustang.color);
    
    mustang.delegate = self;
    [self turnOn];
    [self accelerate];
    
    [mustang washWindows];
    [mustang lockCar];
    
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
