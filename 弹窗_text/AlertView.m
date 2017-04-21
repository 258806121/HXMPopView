//
//  AlertView.m
//  弹窗_text
//
//  Created by HXM on 2017/4/17.
//  Copyright © 2017年 HXM. All rights reserved.
//

#import "AlertView.h"

@interface AlertView ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>{
    
    NSIndexPath *currentSelectedIndexPath;
}

@end

@implementation AlertView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 城市选择按钮样式
    _btnCitySelect.layer.cornerRadius = 3;
    _btnCitySelect.layer.borderWidth = 0.5;
    _btnCitySelect.layer.borderColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0 alpha:1].CGColor;
    
    // 初始化clv
    [self setupCLV];
}

// 关闭按钮的方法
- (IBAction)btnClose:(id)sender
{
    [self hideView];
}

- (IBAction)btnCitySelect:(id)sender
{
    UIButton *btn = sender;
    if (self.onClickBtnCitySelectBlock) {
        self.onClickBtnCitySelectBlock(btn);
    }
}

// set方法
- (void)setArrArea:(NSMutableArray *)arrArea
{
    _arrArea = arrArea;
    [_clv reloadData];
}

// CLV
- (void)setupCLV
{
    // layout 属性
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(280/3, 35);
    _clv.collectionViewLayout = layout;
    
    // 注册 cell
    [_clv registerNib:[UINib nibWithNibName:@"AreaCLVCell" bundle:nil] forCellWithReuseIdentifier:@"AreaCLVCell"];
    
    // 设置代理
    _clv.dataSource = self;
    _clv.delegate = self;
    
}

#pragma mark - CollectionView Datasource

//Cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _arrArea.count;
}

//Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AreaCLVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AreaCLVCell" forIndexPath:indexPath];
    cell.lblArea.text = _arrArea[indexPath.row];
    
    return cell;
}

#pragma mark - CollectionView Delegate

//Cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    currentSelectedIndexPath = indexPath;
    AreaCLVCell *cell = (AreaCLVCell *)[collectionView cellForItemAtIndexPath:currentSelectedIndexPath];
    cell.lblArea.textColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1];
    cell.lblArea.layer.borderColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0 alpha:1].CGColor;
    

    if (self.onClickCLVBlock) {
        self.onClickCLVBlock(indexPath,_arrArea);
    }
}

@end
