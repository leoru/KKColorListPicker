//
//  KKColorCell.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKColorCell.h"
#import "UIView+KKToolKitAdditions.h"

@interface KKColorCell()

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *labelColorName;

@end

@implementation KKColorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [self layoutSubviews];
}

- (void)setColor:(KKColor *)color
{
    self.labelColorName.text = color.name;
    self.colorView.backgroundColor = [color uiColor];
}

@end
