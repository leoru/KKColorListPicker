//
//  KKViewController.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKViewController.h"
#import "KKColorListViewController.h"

@interface KKViewController ()

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
    [self presentViewController:controller animated:YES completion:nil];
}
@end
