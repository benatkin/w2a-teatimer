//
//  TeaTimerViewController.m
//  TeaTimer
//
//  Created by Ben Atkin on 5/2/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TeaTimerViewController.h"

@implementation TeaTimerViewController

@synthesize time;
@synthesize greenButton;
@synthesize endDate;
@synthesize timer;

-(void)viewDidLoad {
  self.timer = nil;
  
  [super viewDidLoad];
}

-(IBAction)startTimer:(id)sender {
  NSInteger minutes = (sender == self.greenButton) ? 2 : 5;
  NSLog(@"timer goes off in %@ minutes", [NSNumber numberWithInt:minutes]);
  
  if (self.timer != nil) {
    [self.timer invalidate];
    self.timer = nil;
  }
  
  self.endDate = [[NSDate alloc] initWithTimeInterval:minutes * 60.0 + 0.9 sinceDate:[NSDate date]];
  
  self.timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:0.1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
  [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
  NSLog(@"created timer");
}

- (void)updateTime {
  NSTimeInterval difference = [self.endDate timeIntervalSinceReferenceDate] - [[NSDate date] timeIntervalSinceReferenceDate];
  NSInteger minutes = ((int) fabs(difference)) / 60;
  NSInteger seconds = ((int) fabs(difference)) % 60;
  self.time.text = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
  if (difference < 0.9) {
    [self.timer invalidate];
    self.timer = nil;
    self.time.text = @"0:00";
    UIAlertView *timerDone = [[UIAlertView alloc] initWithTitle:@"Tea Timer" 
                                                        message:@"your tea is ready!" 
                                                       delegate:self cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
    [timerDone show];
    [timerDone release];
  }
  NSLog(@"update time");
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
  [super dealloc];
}

@end
