//
//  UIView+Animate.m
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/4.
//

#import "UIView+Animate.h"

@implementation UIView (Animate)
- (void)mas_animate:(void (^)(void))block{
    [self.superview setNeedsLayout];
    [UIView animateWithDuration:0.3 animations:^{
        block();
        //告知父类控件绘制，不添加注释的这两行的代码无法生效
        [self.superview layoutIfNeeded];
    }];
}
@end
