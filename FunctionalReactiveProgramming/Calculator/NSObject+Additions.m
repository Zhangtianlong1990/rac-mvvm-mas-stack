//
//  NSObject+Additions.m
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import "NSObject+Additions.h"

@implementation NSObject (Additions)
- (int)makeCalculate:(void (^)(JLCoculator *make))block{
    JLCoculator *calculator = [[JLCoculator alloc] init];
    block(calculator);
    return calculator.result;
}
@end
