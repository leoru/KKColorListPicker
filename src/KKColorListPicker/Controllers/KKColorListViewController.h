//
//  KKColorListViewController.h
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKColorsSchemeType.h"

@class KKColorListViewController;
@class KKColor;

@protocol KKColorListViewControllerDelegate <NSObject>

- (void)colorListController:(KKColorListViewController *)controller didSelectColor:(KKColor *)color;
- (void)colorListPickerDidComplete:(KKColorListViewController *)controller;

@end

@interface KKColorListViewController : UIViewController

- (id)initWithSchemeType:(KKColorsSchemeType)schemeType;

@property (nonatomic, weak) id<KKColorListViewControllerDelegate> delegate;

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) UIColor *headerTitleTextColor;
@property (nonatomic, strong) UIColor *selectedCellBorderColor;
@property (nonatomic, assign) CGFloat selectedCellBorderWidth;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *navBarTitleColor;

@end
