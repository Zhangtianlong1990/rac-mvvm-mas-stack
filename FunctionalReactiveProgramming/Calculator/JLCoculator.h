//
//  JLCoculator.h
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JLCoculator;

typedef JLCoculator* (^CalcBlock)(int x);

@interface JLCoculator : NSObject
@property (assign,nonatomic) CGFloat result;
- (CalcBlock)add;
- (CalcBlock)sub;
- (CalcBlock)multi;
- (CalcBlock)div;
@end


