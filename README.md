#MQTimeOut
MQTimeOut detects when an app goes idle/inactive (no touches) and sends a time out notification.

#Preview
![MQTimeOut Screenshot](https://cloud.githubusercontent.com/assets/804794/3632612/961dfe54-0ec8-11e4-8191-367692ceec1a.png)

#Installation

Use Cocoapods or copy over these two files to your project
```
MQTimeOut.m
MQTimeOut.h
```

## Usage
Adding MQTimeOut is simple.

Change your main.m file to:
```objc
    @autoreleasepool {
        return UIApplicationMain(argc, argv, @"MQTimeOut", NSStringFromClass([MQAppDelegate class]));
    }
```

Start the timer and observe the time out notification:
```objc
    [((MQTimeOut *)[UIApplication sharedApplication]) startTimer];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(timerDidTimeOut)
                                                 name:MQTimerTimeOutNotification
                                               object:nil];
```

Review the sample for more features of MQTimeOut.

#License
Usage is provided under the [MIT License](http://http//opensource.org/licenses/mit-license.php). See LICENSE for the full details.

#Credit
A mention would be nice, but is by no means required. At the very least, shoot us an email and let us know if you've gotten any good use out of this control, or if you have any ideas for improvements.
