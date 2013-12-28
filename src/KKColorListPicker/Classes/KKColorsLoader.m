//
//  KKColorsLoader.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKColorsLoader.h"
#import "KKColor.h"

@implementation KKColorsLoader

+ (void)loadColorsForType:(KKColorsSchemeType)colorSchemeType completion:(void (^)(NSArray *colors))completion
{
    __block NSArray *colors;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void) {
        colors = [self colorsArrayForColorsSchemeType:colorSchemeType];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            completion(colors);
        });
    });
}


+ (NSArray *)colorsArrayForColorsSchemeType:(KKColorsSchemeType)schemeType
{
    NSString *filename;
    if (schemeType == KKColorsSchemeTypeCrayola) {
        filename = @"colors_crayola";
    } else {
        filename = @"colors_pantone";
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];
    NSDictionary *root = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *colorsArray = root[@"colors"];
    NSMutableArray *colors = [NSMutableArray array];
    
    for (NSDictionary *colorDict in colorsArray) {
        NSString *colorName = colorDict[@"name"];
        NSString *colorHash = colorDict[@"hash"];
        KKColor *color = [[KKColor alloc] initWithName:colorName hash:colorHash];
        [colors addObject:color];
    }
    
    return colors;
}

@end
