//
//  AppDelegate.m
//  Pick a Storyboard
//
//  Created by Jay Versluis on 28/01/2017.
//  Copyright © 2017 Pinkstone Pictures LLC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // simulate setting user preference
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"unitSwitchImperial"];
    [defaults synchronize];
    
    // pick the right storyboard
    UIStoryboard *storyboard = nil;
    NSUserDefaults *defaultimperial = [NSUserDefaults standardUserDefaults];
    
    if ([defaultimperial boolForKey:@"unitSwitchImperial"]) {
        // load imperial storyboard
        storyboard = [self grabStoryboardImperial];
        
    } else {
        // load metric storyboard
        storyboard = [self grabStoryboardMetric];
    }
    
    // show the storyboard
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIStoryboard*)grabStoryboardMetric {
    
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}

- (UIStoryboard*)grabStoryboardImperial {
    
    return [UIStoryboard storyboardWithName:@"Imperial" bundle:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
