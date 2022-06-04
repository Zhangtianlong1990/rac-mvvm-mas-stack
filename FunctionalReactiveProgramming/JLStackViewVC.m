//
//  JLStackViewVC.m
//  FunctionalReactiveProgramming
//
//  Created by 张天龙 on 2022/6/4.
//

#import "JLStackViewVC.h"
#import "Masonry.h"

@interface JLStackViewVC ()
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * detailLabel;
@property(nonatomic,strong)UIImageView * arrowView;
@property(nonatomic,strong)UIStackView * stackView;
@property(nonatomic,strong)UIStackView * verticalStackView;
@end

@implementation JLStackViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.verticalStackView = [[UIStackView alloc] init];
    self.verticalStackView.axis  = UILayoutConstraintAxisVertical;
    self.verticalStackView.backgroundColor = [UIColor blueColor];
    self.verticalStackView.spacing = 0;
    self.verticalStackView.alignment = UIStackViewAlignmentCenter;
    
    self.stackView = [[UIStackView alloc] init];
    [self.view addSubview:self.stackView];
    self.stackView.axis  = UILayoutConstraintAxisHorizontal;
    self.stackView.backgroundColor = [UIColor grayColor];
    self.stackView.spacing = 0;
    self.stackView.alignment = UIStackViewAlignmentCenter;
//        self.stackView.distribution = UIStackViewDistributionFillEqually;
    [self.stackView addArrangedSubview:self.verticalStackView];
    [self.verticalStackView addArrangedSubview:self.titleLabel];
    [self.verticalStackView addArrangedSubview:self.detailLabel];
    [self.stackView addArrangedSubview:self.arrowView];
    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(24);
    }];
    
    [self.verticalStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
        
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];

    
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"this a title...";
        _titleLabel.backgroundColor = [UIColor greenColor];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;

    }
    return _titleLabel;
}

-(UILabel *)detailLabel {
    if (_detailLabel == nil) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.backgroundColor = [UIColor yellowColor];
        _detailLabel.numberOfLines = 0;
        _detailLabel.text = @"this is a detail content...this is a detail content...this is a detail content...this is a detail content...";
        _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;

    }
    return _detailLabel;
}

-(UIImageView *)arrowView {
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] init];
//        _arrowView.contentMode = UIViewContentModeTop;
        _arrowView.image = [UIImage imageNamed:@"arrow_right"];
        _arrowView.backgroundColor = [UIColor systemPinkColor];
        _arrowView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _arrowView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//                self.titleLabel.hidden = !self.titleLabel.hidden;
//                self.detailLabel.hidden = !self.detailLabel.hidden;
//                self.arrowView.hidden = !self.arrowView.hidden;

}

@end
