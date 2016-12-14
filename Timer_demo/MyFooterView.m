//
//  MyFooterView.m
//  Timer_demo
//
//  Created by Wong on 2016/12/13.
//  Copyright © 2016年 com.wong.t.c.h. All rights reserved.
//

#import "MyFooterView.h"
#import "DataCenter.h"
@implementation MyFooterView {

    NSTimer *_timer;
    UILabel *_label;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        _label.textColor = [UIColor redColor];
        _label.font = [UIFont systemFontOfSize:20];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_label];
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeText:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        NSLog(@"%@",reuseIdentifier);
    }
    return self;
}
- (void)setDc:(DataCenter *)dc {
    _dc = dc;
    if (_dc.timeValue == 0) {
        
        [_timer setFireDate:[NSDate distantFuture]];
        _label.text = @"活动已结束";

    } else {
    
        [_timer setFireDate:[NSDate distantPast]];

    }
}
- (void)changeText:(NSTimer *)timer {
    
    NSInteger timeValue = _dc.timeValue;
    if (timeValue <= 0) {
      _label.text = @"活动已结束";
        [timer setFireDate:[NSDate distantFuture]];
       return;
    }
    _label.text = [NSString stringWithFormat:@"%zd天%zd分%zd秒",timeValue/3600,timeValue%3600/60,timeValue%60];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
