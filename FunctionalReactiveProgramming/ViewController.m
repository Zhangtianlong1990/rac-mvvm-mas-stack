//
//  ViewController.m
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import "ViewController.h"
#import "JLCoculator.h"
#import "NSObject+Additions.h"
#import "ReactiveObjC.h"
#import "JLStudyRacViewController.h"
#import "JLMVVMViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    JLMVVMViewController *mvvm = [[JLMVVMViewController alloc] init];
    [self presentViewController:mvvm animated:YES completion:NULL];
}

- (void)funtionalProgramming{
    // Do any additional setup after loading the view.
    NSObject *obj = [[NSObject alloc] init];
    int result = [obj makeCalculate:^(JLCoculator *make) {
        make.add(20).sub(10).multi(3).div(2);
    }];
    
    NSLog(@"result: %d",result);
}


@end
