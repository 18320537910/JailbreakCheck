//
//  ViewController.m
//  JailbreakCheck
//
//  Created by 卜磊 on 2020/9/27.
//

#import "ViewController.h"
#import "UserCust.h"

@interface ViewController ()
@property (nonatomic, strong)UITextView *textView;
@property (nonatomic, strong)UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, 300, 400)];
    self.textView.backgroundColor = UIColor.whiteColor;
    self.textView.textColor = UIColor.blackColor;
    self.textView.layer.borderColor = UIColor.blackColor.CGColor;
    self.textView.layer.borderWidth = 1;
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(150,
                                                             self.textView.frame.origin.y + self.textView.frame.size.height + 30,
                                                             100,60)];
    self.button.backgroundColor = UIColor.blueColor;
    [self.button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.button setTitle:@"开始检测" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(checkJailBreak) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.button];
}

#pragma mark - actions
- (void)checkJailBreak {
    [[UserCust sharedInstance] UVItinitseWithBlock:^(BOOL isJail, NSDictionary * _Nonnull resultDic) {
        NSString *isjailStr = isJail ? @"已越狱" : @"未越狱";
        NSString *resultStr = [NSString stringWithFormat:@"结果:%@\n具体检测结果:\n%@",isjailStr,resultDic];
        self.textView.text = resultStr;
    }];
}

@end
