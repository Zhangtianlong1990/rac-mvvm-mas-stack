//
//  JLCoculator.m
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import "JLCoculator.h"

@implementation JLCoculator
- (CalcBlock)add{
    CalcBlock block = ^(int x){
        self->_result = self->_result + x;
        return self;
    };
    return block;
}
- (CalcBlock)sub{
    CalcBlock block = ^(int x){
        self->_result = self->_result - x;
        return self;
    };
    return block;
}
- (CalcBlock)multi{
    CalcBlock block = ^(int x){
        self->_result = self->_result * x;
        return self;
    };
    return block;
}
- (CalcBlock)div{
    CalcBlock block = ^(int x){
        self->_result = self->_result / x;
        return self;
    };
    return block;
}
- (void)dealloc{
    NSLog(@"caculator dealloc");
}
@end
