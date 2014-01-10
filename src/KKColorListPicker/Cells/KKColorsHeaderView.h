//
//  KKColorsHeaderView.h
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 31.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KKColorsHeaderView;

@protocol KKColorsHeaderViewDelegate <NSObject>

@required
- (void)didClickCloseButton:(KKColorsHeaderView *)view;

@end

@interface KKColorsHeaderView : UICollectionReusableView

@property (nonatomic, weak) id<KKColorsHeaderViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

- (IBAction)actionClose:(UIButton *)sender;

@end
