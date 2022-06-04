//
//  NSObject+Additions.h
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import <Foundation/Foundation.h>
#import "JLCoculator.h"
@interface NSObject (Additions)
- (int)makeCalculate:(void(^)(JLCoculator *make))block;
@end

