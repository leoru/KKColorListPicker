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

- (void)setColor:(KKColor *)color;
- (void)setSelectedColor:(UIColor *)color selectedBorderWidth:(CGFloat)borderWidth;

@end
