#import <UIKit/UIKit.h>
#import "CustomClockView-Swift.h"

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window) {
        CustomClockView *clockView = [[CustomClockView alloc] initWithFrame:CGRectMake(20, 50, 200, 60)];
        [window addSubview:clockView];
    }
}

%end
