//
// UIView+KKToolKitAdditions.h
// KKToolKitAdditions
//
// Copyright (c) 2013 Kirill Kunst (https://github.com/leoru)
//

#import <UIKit/UIKit.h>

/**
 Fast accessors to view frame
 */
@interface UIView (KKToolKitAdditions)

@property (nonatomic, readwrite) CGFloat x;
@property (nonatomic, readwrite) CGFloat y;
@property (nonatomic, readwrite) CGFloat width;
@property (nonatomic, readwrite) CGFloat height;

- (void)removeAllSubviews;

@end

/**
 Takes a screenshot from view (very fast on ios 7)
 */
@interface UIView (ImageRepresentation)

- (UIImage*)imageRepresentation;

@end
