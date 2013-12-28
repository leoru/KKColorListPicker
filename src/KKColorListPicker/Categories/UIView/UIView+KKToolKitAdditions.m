//
// UIView+KKToolKitAdditions.m
// KKToolKitAdditions
//
// Copyright (c) 2013 Kirill Kunst (https://github.com/leoru)
//

#import "UIView+KKToolKitAdditions.h"

@implementation UIView (KKToolKitAdditions)

#pragma mark -
#pragma mark frame access

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)removeAllSubviews
{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

@end

@implementation UIView (ImageRepresentation)

- (UIImage*)imageRepresentation {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, self.window.screen.scale);
    
    /* iOS 7 */
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    else /* iOS 6 */
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage* ret = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return ret;
    
}

@end
