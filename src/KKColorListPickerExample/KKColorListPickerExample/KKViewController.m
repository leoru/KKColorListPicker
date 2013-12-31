//
//  KKViewController.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKViewController.h"
#import "KKColorListPicker.h"

@interface KKViewController () <KKColorListViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *actionButton;

- (IBAction)PresentColorList:(id)sender;

@end

@implementation KKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)PresentColorList:(id)sender {
    KKColorListViewController *controller = [[KKColorListViewController alloc] initWithSchemeType:KKColorsSchemeTypeCrayola];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)colorListController:(KKColorListViewController *)controller didSelectColor:(KKColor *)color
{
    [self.actionButton setTitleColor:[color uiColor] forState:UIControlStateNormal];
}

@end
