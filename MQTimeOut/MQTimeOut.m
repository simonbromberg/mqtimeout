//  Copyright (c) 2014 Marqeta. All rights reserved.

#import "MQTimeOut.h"

NSString *const MQTimerTimeOutNotification = @"MQTimerTimeOutNotification";
NSString *const MQTimerResetNotification = @"MQTimerResetNotification";

@interface MQTimeOut()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) CGFloat timerSeconds;

@end

@implementation MQTimeOut

- (void)sendEvent:(UIEvent *)event {
	[super sendEvent:event];
    
    if (self.timer) {
        // Check to see if there was a touch event
        NSSet *allTouches = [event allTouches];
        if ([allTouches count] > 0) {
            UITouchPhase phase = ((UITouch *)[allTouches anyObject]).phase;
            if (phase == UITouchPhaseBegan) {
                [self resetTimer];
            }
        }
    }
}

- (void)resetTimer
{
    if (self.timer) {
        [self stopTimer];
        [self startCountDown];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:MQTimerResetNotification object:nil];
    }
}

- (void)stopTimer
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)startCountDown
{
    [self stopTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timerSeconds
                                                  target:self
                                                selector:@selector(timerExceeded)
                                                userInfo:nil
                                                 repeats:NO];
}

- (void)startTimer
{
    self.timerSeconds = 300;
    [self startCountDown];
}

- (void)startTimerWithSeconds:(NSInteger)seconds
{
    self.timerSeconds = seconds;
    [self startCountDown];
}
- (void)startTimerWithMinutes:(NSInteger)minutes
{
    self.timerSeconds = minutes * 60;
    [self startCountDown];
}

- (void)timerExceeded {
    //Post notification to observers to state time out has occured
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:MQTimerTimeOutNotification object:nil];
}

@end
