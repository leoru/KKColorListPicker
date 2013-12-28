//
//  UIColor+RandomColor.h
//  KKToolKit
//
//  Created by Кирилл Кунст on 22.01.13.
//  Copyright (c) 2013 Кирилл Кунст. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KKToolKit)

+ (UIColor *)randomColor;

+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end
