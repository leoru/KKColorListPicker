//
//  KKColor.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKColor.h"
#import "UIColor+CustomColors.h"

@implementation KKColor

- (instancetype)initWithName:(NSString *)newName hash:(NSString *)newHash
{
    self = [self init];
    if (self) {
        self.name = newName;
        self.hashString = newHash;
    }
    return self;
}

- (UIColor *)uiColor
{
    return [UIColor colorFromHexString:self.hashString];
}

@end
