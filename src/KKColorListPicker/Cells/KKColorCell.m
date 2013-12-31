//
//  KKColorCell.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 29.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKColorCell.h"
#import <QuartzCore/QuartzCore.h>

@interface KKColorCell()

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, assign) CGFloat selectedBorderWidth;
@end

@implementation KKColorCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.colorView.layer.borderColor = self.selectedColor.CGColor;
        self.colorView.layer.borderWidth = self.selectedBorderWidth;
    } else {
        self.colorView.layer.borderWidth = 0.0f;
    }
}

- (void)setColor:(KKColor *)color
{
    self.colorView.backgroundColor = [color uiColor];
}


- (void)setSelectedColor:(UIColor *)color selectedBorderWidth:(CGFloat)borderWidth
{
    self.selectedColor = color;
    self.selectedBorderWidth = borderWidth;
}

@end
