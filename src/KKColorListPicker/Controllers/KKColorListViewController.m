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

@interface KKColorListViewController () <UICollectionViewDelegate, UICollectionViewDataSource, KKColorsHeaderViewDelegate>

@property (nonatomic, strong) UICollectionView *colorsCollection;

@property (nonatomic) KKColorsSchemeType currentScheme;
@property (nonatomic, strong) NSArray *colors;

- (void)actionClose:(id)sender;

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
    self = [self init];
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
    [self createCollectionView];
    NSBundle *podbundle = [NSBundle bundleForClass:[self class]];
    
    [self.colorsCollection registerNib:[UINib nibWithNibName:@"KKColorCell" bundle:podbundle] forCellWithReuseIdentifier:@"KKColorCell"];
    [self.colorsCollection registerNib:[UINib nibWithNibName:@"KKColorsHeaderView" bundle:podbundle] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KKColorsHeaderView"];
    self.view.backgroundColor = self.backgroundColor;
    
    if (self.navigationController) {
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [self navBarTitleColor]}];
        [self.navigationItem setTitle:[self headerTitle]];
        UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(actionCancel)];
        [button setTintColor:[UIColor whiteColor]];
        [self.navigationItem setLeftBarButtonItem:button];
    }
    
    [KKColorsLoader loadColorsForType:self.currentScheme completion:^(NSArray *colors) {
        self.colors = colors;
        [self.colorsCollection reloadData];
    }];
}

- (void)createCollectionView
{
    UICollectionViewFlowLayout *aFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [aFlowLayout setItemSize:CGSizeMake(36, 36)];
    [aFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    if (!self.navigationController) {
        [aFlowLayout setHeaderReferenceSize:CGSizeMake(300, 50)];
    }
    self.colorsCollection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:aFlowLayout];
    self.colorsCollection.delegate = self;
    self.colorsCollection.dataSource = self;
    
    [self.view addSubview:self.colorsCollection];
}

- (void)actionCancel
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(colorListPickerDidComplete:)]) {
        [self.delegate colorListPickerDidComplete:self];
    }
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        KKColorsHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KKColorsHeaderView" forIndexPath:indexPath];
        headerView.titleLabel.text = [self headerTitle];
        headerView.titleLabel.textColor = [self headerTitleTextColor];
        headerView.closeButton.titleLabel.textColor = [self headerTitleTextColor];
        [headerView.closeButton setTitleColor:[self headerTitleTextColor] forState:UIControlStateNormal];
        headerView.delegate = self;
        reusableview = headerView;
    }
    return reusableview;
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

- (UIColor *)navBarTitleColor
{
    if (!_navBarTitleColor) {
        _navBarTitleColor = [UIColor blackColor];
    }
    return _navBarTitleColor;
}

- (UIColor *)headerTitleTextColor
{
    if (!_headerTitleTextColor) {
        _headerTitleTextColor = [UIColor whiteColor];
    }
    return _headerTitleTextColor;
}

- (NSArray *)colors
{
    if (!_colors) {
        _colors = [NSArray array];
    }
    return _colors;
}

- (void)didClickCloseButton:(KKColorsHeaderView *)view
{
    [self actionCancel];
}

@end
