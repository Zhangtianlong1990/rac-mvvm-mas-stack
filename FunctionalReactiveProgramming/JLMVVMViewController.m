//
//  JLMVVMViewController.m
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/3.
//

#import "JLMVVMViewController.h"
#import "JLRACViewModel.h"
#import "Masonry.h"
#import "UIView+Animate.h"

@interface JLMVVMViewController ()
@property (nonatomic,strong) JLRACViewModel *viewModel;
@property (nonatomic,strong) RACSignal *combineSignal;
@property (nonatomic,weak) UIView *container;
@property (nonatomic,weak) UIImageView *arrow;
@property (nonatomic,weak) UILabel *buyingPowerLabel;

@end

@implementation JLMVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initViewModel];
    [self.viewModel viewDidLoad];
    [self bindViewModel];
    // Do any additional setup after loading the view from its nib.
}

- (void)initViewModel{
    self.viewModel = [[JLRACViewModel alloc] init];
}

- (void)bindViewModel{
    
    __weak JLMVVMViewController *weakSelf = self;
    [self.viewModel.arrowIsHidenSignal subscribeNext:^(NSNumber *isHiddenArrow) {
        NSLog(@"arrowIsHiden: %@",isHiddenArrow);
        if (isHiddenArrow.boolValue) {
            //告知需要更改约束
            [weakSelf.arrow mas_animate:^{
                [weakSelf.arrow mas_updateConstraints:^(MASConstraintMaker *make) {
                     make.width.mas_equalTo(0);
                    make.right.mas_equalTo(0);
                }];
            }];
            
        }else{
            [weakSelf.arrow mas_animate:^{
                [weakSelf.arrow mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(24);
                    make.right.mas_equalTo(-10);
                }];
            }];
            
        }
    }];
    [self.viewModel.buyingPowerTextSignal subscribeNext:^(NSString *buyPowerText) {
        weakSelf.buyingPowerLabel.text = buyPowerText;
    }];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.viewModel updateBuyingPower:12345678910.0];
    [self.viewModel updateBuyingPowerCurrency:@"HKD"];
    [self.viewModel updateIsReleseFlag:NO];
}

- (void)initUI{
    
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];
    
    UIView *container = [[UIView alloc] init];
    container.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:container];
    self.container = container;
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
        make.height.mas_greaterThanOrEqualTo(50);
    }];
    
    
    UIImageView *arrow = [[UIImageView alloc] init];
    arrow.backgroundColor = [UIColor yellowColor];
    arrow.image = [UIImage imageNamed:@"arrow_right"];
    [self.container addSubview:arrow];
    self.arrow = arrow;
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(24);
    }];
    
    
    UILabel *buyingPowerLabel = [[UILabel alloc] init];
    buyingPowerLabel.backgroundColor = [UIColor redColor];
    buyingPowerLabel.numberOfLines = 0;
    buyingPowerLabel.text = @"this is a placeholder";
    [self.container addSubview:buyingPowerLabel];
    self.buyingPowerLabel = buyingPowerLabel;
    [buyingPowerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.right.equalTo(self.arrow.mas_left).offset(-10);
    }];
    
}


- (void)dealloc{
    
}

@end
