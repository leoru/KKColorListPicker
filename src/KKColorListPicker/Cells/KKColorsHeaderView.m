//
//  KKColorsHeaderView.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 31.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKColorsHeaderView.h"

@interface KKColorsHeaderView()

@end

@implementation KKColorsHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (IBAction)actionClose:(UIButton *)sender
{
    if (self.delegate) {
        [self.delegate didClickCloseButton:self];
    }
}

@end
