//
//  TeaTimerAppDelegate.h
//  TeaTimer
//
//  Created by Ben Atkin on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TeaTimerViewController;

@interface TeaTimerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TeaTimerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TeaTimerViewController *viewController;

@end

