//
//  KKColor.h
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKColor : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *hash;

- (instancetype)initWithName:(NSString *)newName hash:(NSString *)newHash;

- (UIColor *)uiColor;

@end
