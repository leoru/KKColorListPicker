//
//  KKColorCell.h
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 29.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKColor.h"

@interface KKColorCell : UICollectionViewCell

// set color of view
- (void)setColor:(KKColor *)color;

// set colors and border width for selected state
- (void)setSelectedColor:(UIColor *)color selectedBorderWidth:(CGFloat)borderWidth;

@end
