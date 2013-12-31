//
//  KKColorListViewController.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKColorListViewController.h"
#import "KKColorsHeaderView.h"
#import "KKColorCell.h"
#import "KKColor.h"
#import "KKColorsLoader.h"
#import "UIColor+CustomColors.h"
#import <QuartzCore/QuartzCore.h>

@interface KKColorListViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *colorsCollection;

@property (nonatomic) KKColorsSchemeType currentScheme;
@property (nonatomic, strong) NSArray *colors;

@end


@implementation KKColorListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)initWithSchemeType:(KKColorsSchemeType)schemeType
{
    self = [self initWithNibName:@"KKColorListViewController" bundle:[NSBundle mainBundle]];
    if (self) {
        self.currentScheme = schemeType;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initUI
{
    [self.colorsCollection registerNib:[UINib nibWithNibName:@"KKColorCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"KKColorCell"];
    [self.colorsCollection registerNib:[UINib nibWithNibName:@"KKColorsHeaderView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KKColorsHeaderView"];
    self.view.backgroundColor = self.backgroundColor;
    
    [KKColorsLoader loadColorsForType:self.currentScheme completion:^(NSArray *colors) {
        self.colors = colors;
        [self.colorsCollection reloadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    
    return self.colors.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KKColorCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"KKColorCell" forIndexPath:indexPath];
    KKColor *color = self.colors[indexPath.row];
    [cell setColor:color];
    [cell setSelectedColor:self.selectedCellBorderColor selectedBorderWidth:self.selectedCellBorderWidth];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(36, 36);
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        KKColorsHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KKColorsHeaderView" forIndexPath:indexPath];
        headerView.titleLabel.text = [self headerTitle];
        reusableview = headerView;
    }
    return reusableview;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    KKColor *color = self.colors[indexPath.row];
    if (self.delegate) {
        [self.delegate colorListController:self didSelectColor:color];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Properties
- (NSString *)headerTitle
{
    if (!_headerTitle) {
        _headerTitle = @"Choose color";
    }
    return _headerTitle;
}

- (UIColor *)selectedCellBorderColor
{
    if (!_selectedCellBorderColor) {
        _selectedCellBorderColor = [UIColor whiteColor];
    }
    return _selectedCellBorderColor;
}

- (CGFloat)selectedCellBorderWidth
{
    if (!_selectedCellBorderWidth) {
        _selectedCellBorderWidth = 2.0f;
    }
    return _selectedCellBorderWidth;
}

- (UIColor *)backgroundColor
{
    if (!_backgroundColor) {
        _backgroundColor = [UIColor colorFromHexString:@"1b1b1b"];
    }
    return _backgroundColor;
}

- (NSArray *)colors
{
    if (!_colors) {
        _colors = [NSArray array];
    }
    return _colors;
}

@end
