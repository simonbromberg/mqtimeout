//  Copyright (c) 2014 Marqeta. All rights reserved.

#import "MQTimeOut.h"

NSString *const MQPApplicationDidTimeoutNotification = @"MQTimerTimeOutNotification";

@interface MQTimeOut()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) CGFloat timerMinutes;

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
    CGFloat timeout = self.timerMinutes * 60.0f;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeout
                                                  target:self
                                                selector:@selector(timerExceeded)
                                                userInfo:nil
                                                 repeats:NO];
}

- (void)startTimer
{
    self.timerMinutes = 5.0f;
    [self startCountDown];
}

- (void)startTimerForMinutes:(CGFloat)minutes
{
    self.timerMinutes = minutes;
    [self startCountDown];
}

- (void)timerExceeded {
    //Post notification to observers to state time out has occured
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:MQPApplicationDidTimeoutNotification object:nil];
}

@end
