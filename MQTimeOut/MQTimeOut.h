//  Copyright (c) 2014 Marqeta. All rights reserved.

#import <UIKit/UIKit.h>

extern NSString *const MQTimerTimeOutNotification;
extern NSString *const MQTimerResetNotification;

@interface MQTimeOut : UIApplication

// Start timer with default 5 minutes
- (void)startTimer;
// Start timer with custom time
- (void)startTimerWithSeconds:(NSInteger)seconds;
- (void)startTimerWithMinutes:(NSInteger)minutes;
// Manually stop timer
- (void)stopTimer;
// Manually reset timer
- (void)resetTimer;

@end
