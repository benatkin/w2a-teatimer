//
//  TeaTimerViewController.h
//  TeaTimer
//
//  Created by Ben Atkin on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeaTimerViewController : UIViewController {
  UILabel *time;
  UIButton *greenButton;
  NSDate *endDate;
  NSTimer *timer;
}

@property (nonatomic, retain) IBOutlet UILabel *time;
@property (nonatomic, retain) IBOutlet UIButton *greenButton;
@property (nonatomic, retain) NSDate *endDate;
@property (nonatomic, retain) NSTimer *timer;

-(IBAction)startTimer:(id)sender;
-(void)updateTime;

@end

