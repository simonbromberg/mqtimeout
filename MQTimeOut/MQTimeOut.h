//  Copyright (c) 2014 Marqeta. All rights reserved.

#import <UIKit/UIKit.h>

extern NSString *const MQPApplicationDidTimeoutNotification;

@interface MQTimeOut : UIApplication

- (void)startTimer;
- (void)startTimerForMinutes:(CGFloat)minutes;
- (void)stopTimer;
- (void)resetTimer;

@end
