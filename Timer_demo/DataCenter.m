//
//  DataCenter.m
//  Timer_demo
//
//  Created by Wong on 2016/12/13.
//  Copyright © 2016年 com.wong.t.c.h. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation DataCenter
- (instancetype)initWithDate:(NSInteger)timeValue {

    if (self = [super init]) {
        _timeValue = timeValue;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            if (_timeValue > 0) {
                
                _timeValue--;

            } else {
                _timeValue = 0;
                [_timer invalidate];
            }
        }];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

@end
