//
//  JLViewController1.m
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import "JLStudyRacViewController.h"
#import "ReactiveObjC.h"

@interface JLStudyRacViewController ()
@property (nonatomic,strong) RACSignal *signal;
@property (nonatomic,strong) RACSubject *subject;
@property (nonatomic,strong) RACReplaySubject *replaySubject;
@property (nonatomic,assign) int num;
@end

@implementation JLStudyRacViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self jl_ignore];
   
}

- (void)didClickButton{
    NSLog(@"didClickButton");
}

- (void)jl_RACSignal{
    // 1.创建信号
    self.signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // 3.利用订阅者发送数据
        // 只有当有订阅者订阅时,才会调用这个block
        NSLog(@"发送数据");
        [subscriber sendNext:@"这是发送的数据"];
        return nil;
    }];

        // 2.订阅信号
    [self.signal subscribeNext:^(id x) {
        NSLog(@"接收到数据:%@",x);
    }];
}

-(void)jl_RACSubject{
    // 1. 创建信号
    self.subject = [RACSubject subject];

    // 2. 订阅信号
    [self.subject subscribeNext:^(id x) {
        NSLog(@"接收到值：%@", x);
    }];

    // 3. 发送信号
    [self.subject sendNext:@"123"];
    [self.subject sendNext:@"456"];
}

- (void)jl_RACReplaySubject{
    // 1. 创建信号
    self.replaySubject = [RACReplaySubject subject];
    // 发送信号
    [self.replaySubject sendNext:@"123"];
    // 发送信号
    [self.replaySubject sendNext:@"456"];
    //  订阅信号
    [self.replaySubject subscribeNext:^(id x) {
        NSLog(@"订阅者1接收到值：%@", x);
    }];
   
}

- (void)jl_secSignal{
    RACSignal *secSignal = [self rac_signalForSelector:@selector(didClickButton)];
    [secSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x = %@",x);
    }];
}

- (void)jl_KVO{
    // 该方法不需要额外导入头文件
    [[self.view rac_valuesAndChangesForKeyPath:@"alpha" options:NSKeyValueObservingOptionNew observer:self] subscribeNext:^(RACTwoTuple *x) {
        NSLog(@"x:%@", x.first);
    }];
}

- (void)jl_ignore{
    RACSubject *subjct = [RACSubject subject];
    RACSignal *ignoreSignal = [subjct ignore:@"123"];
    [ignoreSignal subscribeNext:^(id x) {
        NSLog(@"x= %@", x);  // x=456
    }];

    [subjct sendNext:@"123"];
    [subjct sendNext:@"456"];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
    self.view.alpha = 0.5;
}

- (void)dealloc{
    
}

@end
