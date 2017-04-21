//
//  AreaCLVCell.m
//  弹窗_text
//
//  Created by HXM on 2017/4/17.
//  Copyright © 2017年 HXM. All rights reserved.
//

#import "AreaCLVCell.h"

@implementation AreaCLVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // 区域的样式
    _lblArea.layer.cornerRadius = 3;
    _lblArea.layer.masksToBounds = YES;
    _lblArea.layer.borderWidth = 0.5;
    _lblArea.layer.borderColor = [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1].CGColor;
    
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        _lblArea.textColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1];
        _lblArea.layer.borderColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0 alpha:1].CGColor;
    } else {
        _lblArea.textColor = [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1];
        _lblArea.layer.borderColor = [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1].CGColor;
    }
}

@end
