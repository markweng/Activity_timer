//
//  DataCenter.h
//  Timer_demo
//
//  Created by Wong on 2016/12/13.
//  Copyright © 2016年 com.wong.t.c.h. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject
- (instancetype)initWithDate:(NSInteger)timeValue;
@property (nonatomic, assign, readonly) NSInteger timeValue;
@property (nonatomic, assign) NSInteger status;
@end
