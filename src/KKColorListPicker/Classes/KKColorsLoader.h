//
//  KKColorsLoader.h
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKColorsSchemeType.h"

/**
 Colors List Loader.
 Load asynchronously colors list from plist.
 */
@interface KKColorsLoader : NSObject

+ (void)loadColorsForType:(KKColorsSchemeType)colorSchemeType completion:(void(^)(NSArray *colors))completion;

@end
