KKColorListPicker
=================

Color collection picker for iOS > 7.0 with Crayola and Pantone colors.

## Screenshot
<img src="https://raw.github.com/leoru/KKColorListPicker/master/screenshots/screenshot.png">

## Install
1. Over cocoapods

```objc
pod install 'KKColorListPicker'
```
2. You can drag the src/KKColorListPicker folder to your project. This library must be ARC enabled.

## Use
At first
```objc
#import "KKColorListPicker.h"
```
Then in yours controller for example:
```objc
- (IBAction)PresentColorList:(id)sender {
    KKColorListViewController *controller = [[KKColorListViewController alloc] initWithSchemeType:KKColorsSchemeTypePantone];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}
```

Delegate method for getting choosen color:
```objc
- (void)colorListController:(KKColorListViewController *)controller didSelectColor:(KKColor *)color;
```

You could simply customize appearance of color list controller:
```objc
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) UIColor *selectedCellBorderColor;
@property (nonatomic, assign) CGFloat selectedCellBorderWidth;
@property (nonatomic, strong) UIColor *backgroundColor;
```

License
=======

MIT License
