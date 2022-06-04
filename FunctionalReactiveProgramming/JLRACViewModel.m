//
//  JLRACViewModel.m
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import "JLRACViewModel.h"

@interface JLRACViewModel()

@end

@implementation JLRACViewModel

- (void)viewDidLoad{
    self.buyingPowerSubject = [RACSubject subject];
    self.buyingPowerCurrencySignalSubject = [RACSubject subject];
    self.isReleaseFlagSubject = [RACSubject subject];
    
    self.arrowIsHidenSignal = [RACSignal combineLatest:
    @[
    self.buyingPowerSubject,
    self.buyingPowerCurrencySignalSubject,
    self.isReleaseFlagSubject
    ]
    reduce:^id(NSNumber *aBuyingPower,NSString *aBuyingPowerCurrency,NSNumber *aFlag){
        
        BOOL isArrowHidden = YES;
        if (aBuyingPower.doubleValue > 0
            && aBuyingPowerCurrency.length>0
            && aBuyingPowerCurrency != nil
            && aFlag.boolValue == YES
            ) {
            isArrowHidden = NO;
        }else{
            isArrowHidden = YES;
        }
        return @(isArrowHidden);
    }];
    
    self.buyingPowerTextSignal = [RACSignal combineLatest:
    @[
        self.buyingPowerSubject,
        self.buyingPowerCurrencySignalSubject
    ]
    reduce:^id(NSNumber *aBuyingPower,NSString *aBuyingPowerCurrency){
        
        NSString *buyingPowerText = @"";
        if (aBuyingPower.doubleValue > 0
            && aBuyingPowerCurrency.length>0
            && aBuyingPowerCurrency != nil
            ) {
            buyingPowerText = [NSString stringWithFormat:@"%@ %@",aBuyingPower,aBuyingPowerCurrency];
        }
        return buyingPowerText;
    }];
    
}

#pragma mark - JLRACViewModelInput

- (void)updateBuyingPower:(double)buyingPower{
    [self.buyingPowerSubject sendNext:@(buyingPower)];
}

- (void)updateBuyingPowerCurrency:(NSString *)buyingPowerCurrency{
    [self.buyingPowerCurrencySignalSubject sendNext:buyingPowerCurrency];
}

- (void)updateIsReleseFlag:(BOOL)isReleaseFlag{
    [self.isReleaseFlagSubject sendNext:@(isReleaseFlag)];
}

- (void)dealloc{
    
}

@end
