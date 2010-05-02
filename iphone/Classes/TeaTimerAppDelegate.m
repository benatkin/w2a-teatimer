//
//  TeaTimerAppDelegate.m
//  TeaTimer
//
//  Created by Ben Atkin on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TeaTimerAppDelegate.h"
#import "TeaTimerViewController.h"

@implementation TeaTimerAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
