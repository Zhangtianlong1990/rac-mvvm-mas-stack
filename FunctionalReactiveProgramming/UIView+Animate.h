//
//  UIView+Animate.h
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Animate)
- (void)mas_animate:(void(^)(void))block;
@end

NS_ASSUME_NONNULL_END
