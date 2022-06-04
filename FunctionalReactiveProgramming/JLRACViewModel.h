//
//  JLRACViewModel.h
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ReactiveObjC.h"

@protocol JLRACViewModelInput <NSObject>
- (void)viewDidLoad;
- (void)updateBuyingPower:(double)buyingPower;
- (void)updateBuyingPowerCurrency:(NSString *)buyingPowerCurrency;
- (void)updateIsReleseFlag:(BOOL)isReleaseFlag;

@end

@interface JLRACViewModel : NSObject<JLRACViewModelInput>
@property (nonatomic,strong) RACSubject *buyingPowerSubject;
@property (nonatomic,strong) RACSubject *buyingPowerCurrencySignalSubject;
@property (nonatomic,strong) RACSubject *isReleaseFlagSubject;
@property (nonatomic,strong) RACSignal *arrowIsHidenSignal;
@property (nonatomic,strong) RACSignal *buyingPowerTextSignal;
@end


