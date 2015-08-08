//  Copyright (c) 2014 Marqeta. All rights reserved.

#import "MQMainViewController.h"
#import "MQMainView.h"
#import "MQTimeOut.h"

@interface MQMainViewController ()

@property (nonatomic, strong) MQMainView *mainView;
@property (nonatomic) NSInteger defaultCountDownTime;
@property (nonatomic) NSInteger countDownTime;
@property (nonatomic, strong) NSTimer *timeOutTimer;

@end

@implementation MQMainViewController

- (void)loadView
{
    self.mainView = [[MQMainView alloc] init];
    self.view = self.mainView;
    
    [self.mainView.countDownButton addTarget:self
                                      action:@selector(countDownAction)
                            forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.defaultCountDownTime = 5;
    self.countDownTime = self.defaultCountDownTime;
    self.mainView.countDownLabel.text = [NSString stringWithFormat:@"%i", self.countDownTime];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(timerDidTimeOut)
                                                 name:MQTimerTimeOutNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(countDownAction)
                                                 name:MQTimerResetNotification
                                               object:nil];
}

- (void)countDownAction
{
    self.countDownTime = self.defaultCountDownTime;
    self.mainView.countDownLabel.text = [NSString stringWithFormat:@"%i",self.countDownTime];
    [[MQTimeOut sharedApplication] startTimerWithSeconds:self.defaultCountDownTime];
    [self countdownTimer];
}

- (void)timerDidTimeOut
{
    [[MQTimeOut sharedApplication] stopTimer];

    [[[UIAlertView alloc] initWithTitle:@"Times Up"
                                message:[NSString stringWithFormat:@"You haven't been active for %i seconds",
                                         self.defaultCountDownTime]
                               delegate:nil
                      cancelButtonTitle:@"Okay"
                      otherButtonTitles:nil] show];
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(self.countDownTime > 0 ){
        self.countDownTime-- ;
        self.mainView.countDownLabel.text = [NSString stringWithFormat:@"%i",self.countDownTime];
    }
    else {
        [self.timeOutTimer invalidate];
        self.timeOutTimer = nil;
    }
}

-(void)countdownTimer{
    
    if([self.timeOutTimer isValid])
    {
        [self.timeOutTimer invalidate];
        self.timeOutTimer = nil;
    }
    self.timeOutTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                         target:self
                                                       selector:@selector(updateCounter:)
                                                       userInfo:nil
                                                        repeats:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
