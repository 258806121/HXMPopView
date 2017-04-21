//
//  ViewController.m
//  弹窗_text
//
//  Created by HXM on 2017/4/17.
//  Copyright © 2017年 HXM. All rights reserved.
//

#import "ViewController.h"

#import "AlertView.h"

@interface ViewController ()
{
    NSMutableArray *arrAreaModels;
    NSIndexPath *indexPath; // 记录上一次选择的indexpath
}
@property (strong,nonatomic) AlertView *alertView;
@property (weak, nonatomic) IBOutlet UIButton *btnNormal;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 模拟
    [self netWork];
    
    // alertView 
    [self setupAlertView];

}

// 初始化
- (void)setupAlertView
{
    // 初始化弹出视图
    _alertView = [AlertView createViewFromNib];
    
    _alertView.layer.cornerRadius = 5;
    
    // 传值 , 一般网络请求完之后
    _alertView.arrArea = arrAreaModels;
    
    __weak typeof(self) ws = self;
    
    // 城市选择
    _alertView.onClickBtnCitySelectBlock = ^(UIButton *btn) {
        NSLog(@"请选择城市");
    };
    
    // clv点击 block
    _alertView.onClickCLVBlock = ^(NSIndexPath *indexPath, NSMutableArray *arrArea) {
        // 隐藏弹出视图
        [ws.alertView hideView];
        // 设置按钮标题
        [ws.btnNormal setTitle:arrArea[indexPath.row] forState:UIControlStateNormal];
    };
}

- (IBAction)popView:(id)sender
{
    // 显示
    [_alertView showInWindow];
}

- (void)netWork
{
    arrAreaModels = @[@"道里区",@"南岗区",@"北京区",@"上海区",@"日本区",@"韩国区",@"飞天区"].mutableCopy;
}


@end
