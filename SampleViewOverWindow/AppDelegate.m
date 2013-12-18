//
//  AppDelegate.m
//  SampleViewOverWindow
//
//  Created by Peter Chen on 12/18/13.
//  Copyright (c) 2013 Peter Chen. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTableController.h"

@interface AppDelegate()

@property (nonatomic, assign) CGPoint omniButtonPanStartOrigin;
@property (nonatomic, strong) UIButton *omniButton;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    MyTableController *controller = [[MyTableController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window.rootViewController = nav;
    
    self.omniButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.omniButton.frame = CGRectMake(10, self.window.frame.size.height - 40 - 10, 40, 40);
    self.omniButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.omniButton setTitle:@"B" forState:UIControlStateNormal];
    [self.omniButton addTarget:self action:@selector(_omniButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.omniButton addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(_omniButtonPanned:)]];
    [self.window.rootViewController.view addSubview:self.omniButton];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)_omniButtonTapped {
    [[[UIAlertView alloc] initWithTitle:@"Omni Button Tapped!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)_omniButtonPanned:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.omniButtonPanStartOrigin = self.omniButton.frame.origin;
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:self.window];
        self.omniButton.frame = CGRectMake(self.omniButtonPanStartOrigin.x + translation.x, self.omniButtonPanStartOrigin.y + translation.y,
                                           self.omniButton.frame.size.width, self.omniButton.frame.size.height);
    }
    else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        
    }
}

//==================================================
#pragma mark - Application states
//==================================================

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
