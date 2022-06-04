//
//  JLRACViewModelTest.m
//  FunctionalReactiveProgrammingTests
//
//  Created by 张天龙 on 2022/6/4.
//

#import <XCTest/XCTest.h>
#import "JLRACViewModel.h"

@interface JLRACViewModelTest : XCTestCase
@property (nonatomic,strong) JLRACViewModel *viewModel;
@end

@implementation JLRACViewModelTest

- (void)setUp {
    self.viewModel = [[JLRACViewModel alloc] init];
    [self.viewModel viewDidLoad];
}

- (void)tearDown {
    self.viewModel = nil;
}

- (void)test_arrowIsHidenSignal_releseFlagIsNO{
    
    [self.viewModel.arrowIsHidenSignal subscribeNext:^(NSNumber  * x) {
        XCTAssertTrue(x.boolValue == YES);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:14.0];
    [self.viewModel updateBuyingPowerCurrency:@"HKD"];
    [self.viewModel updateIsReleseFlag:NO];
    
}

- (void)test_arrowIsHidenSignal_buyingPowerIsZero{
    
    [self.viewModel.arrowIsHidenSignal subscribeNext:^(NSNumber  * x) {
        XCTAssertTrue(x.boolValue == YES);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:0.0];
    [self.viewModel updateBuyingPowerCurrency:@"HKD"];
    [self.viewModel updateIsReleseFlag:NO];
    
}

- (void)test_arrowIsHidenSignal_buyingPowerCurrencyIsNil{
    
    [self.viewModel.arrowIsHidenSignal subscribeNext:^(NSNumber  * x) {
        XCTAssertTrue(x.boolValue == YES);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:14.0];
    [self.viewModel updateBuyingPowerCurrency:nil];
    [self.viewModel updateIsReleseFlag:YES];
    
}

- (void)test_arrowIsHidenSignal_buyingPowerCurrencyIsEmpty{
    
    [self.viewModel.arrowIsHidenSignal subscribeNext:^(NSNumber  * x) {
        XCTAssertTrue(x.boolValue == YES);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:14.0];
    [self.viewModel updateBuyingPowerCurrency:@""];
    [self.viewModel updateIsReleseFlag:YES];
    
}

- (void)test_arrowIsHidenSignal_releseFlagIsYES{

    [self.viewModel.arrowIsHidenSignal subscribeNext:^(NSNumber  * x) {
        XCTAssertTrue(x.boolValue == NO);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:14.0];
    [self.viewModel updateBuyingPowerCurrency:@"HKD"];
    [self.viewModel updateIsReleseFlag:YES];
    
    
}

- (void)test_buyingPowerTextSignal{
    
    double buyingPower = 14.0;
    NSString *buyingPowerCurrency = @"HKD";
    NSString *expect = [NSString stringWithFormat:@"%@ %@",[NSNumber numberWithDouble:buyingPower],buyingPowerCurrency];
    
    [self.viewModel.buyingPowerTextSignal subscribeNext:^(NSString  *x) {
        XCTAssertTrue([expect isEqualToString:x]);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:buyingPower];
    [self.viewModel updateBuyingPowerCurrency:buyingPowerCurrency];
    
}

- (void)test_buyingPowerTextSignal_buyingPowerIsZero{
    
    double buyingPower = 0.0;
    NSString *buyingPowerCurrency = @"HKD";
    NSString *expect = @"";
    
    [self.viewModel.buyingPowerTextSignal subscribeNext:^(NSString  *x) {
        XCTAssertTrue([expect isEqualToString:x]);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:buyingPower];
    [self.viewModel updateBuyingPowerCurrency:buyingPowerCurrency];
    
    
}

- (void)test_buyingPowerTextSignal_buyingPowerCurrencyIsNil{
    
    double buyingPower = 15.0;
    NSString *expect = @"";
    
    [self.viewModel.buyingPowerTextSignal subscribeNext:^(NSString  *x) {
        XCTAssertTrue([expect isEqualToString:x]);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:buyingPower];
    [self.viewModel updateBuyingPowerCurrency:nil];
    
    
}

- (void)test_buyingPowerTextSignal_buyingPowerCurrencyIsEmpty{
    
    double buyingPower = 15.0;
    NSString *buyingPowerCurrency = @"";
    NSString *expect = @"";
    
    [self.viewModel.buyingPowerTextSignal subscribeNext:^(NSString  *x) {
        XCTAssertTrue([expect isEqualToString:x]);
    }];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.viewModel updateBuyingPower:buyingPower];
    [self.viewModel updateBuyingPowerCurrency:buyingPowerCurrency];
    
    
}



@end
