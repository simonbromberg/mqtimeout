//  Copyright (c) 2014 Marqeta. All rights reserved.

#import "MQMainView.h"

@implementation MQMainView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _countDownLabel = [[UILabel alloc] init];
        _countDownLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:25.0f];
        _countDownLabel.textColor = [UIColor blackColor];
        _countDownLabel.textAlignment = NSTextAlignmentCenter;
        _countDownLabel.numberOfLines = 0;
        [self addSubview:_countDownLabel];
        
        _countDownButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_countDownButton setTitle:@"Start Countdown" forState:UIControlStateNormal];
        [self addSubview:_countDownButton];
    }
    return self;
}

- (void)layoutSubviews
{
    CGRect bounds = self.bounds;
    CGRect insetBounds = CGRectInset(bounds, 60.0f, 60.0f);
    
    CGFloat buttonHeight = 60.0f;
    self.countDownLabel.frame = CGRectMake(CGRectGetMinX(insetBounds),
                                           CGRectGetMinY(insetBounds),
                                           CGRectGetWidth(insetBounds),
                                           CGRectGetHeight(insetBounds) - buttonHeight);
    self.countDownButton.frame = CGRectMake(CGRectGetMinX(insetBounds),
                                           CGRectGetMinY(insetBounds) + CGRectGetHeight(self.countDownLabel.frame),
                                           CGRectGetWidth(insetBounds),
                                           buttonHeight);
}

@end
