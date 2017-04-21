//
//  AlertView.h
//  弹窗_text
//
//  Created by HXM on 2017/4/17.
//  Copyright © 2017年 HXM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AreaCLVCell.h"

//lib
#import "UIView+TYAlertView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface AlertView : UIView

// 城市选择按钮
@property (weak, nonatomic) IBOutlet UIButton *btnCitySelect;

// 当前城市
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentCity;

// CLV
@property (weak, nonatomic) IBOutlet UICollectionView *clv;

// 区域数组
@property (strong, nonatomic) NSMutableArray *arrArea;

// 城市选择按钮 block
@property (nonatomic, copy) void(^onClickBtnCitySelectBlock)(UIButton *btn);

// CLVCell 点击的block
@property (nonatomic, copy) void(^onClickCLVBlock)(NSIndexPath *indexPath, NSMutableArray *arrArea);


@end
