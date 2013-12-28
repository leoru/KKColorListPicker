//
//  KKColorListViewController.m
//  KKColorListPickerExample
//
//  Created by Kirill Kunst on 28.12.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKColorListViewController.h"
#import "KKColorCell.h"
#import "KKColor.h"
#import "KKColorsLoader.h"
#import "UIColor+CustomColors.h"

@interface KKColorListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *colorsTable;

@property (nonatomic) KKColorsSchemeType currentScheme;
@property (nonatomic, strong) NSArray *colors;

@end

@implementation KKColorListViewController

- (NSArray *)colors
{
    if (!_colors) {
        _colors = [NSArray array];
    }
    return _colors;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)initWithSchemeType:(KKColorsSchemeType)schemeType
{
    self = [self initWithNibName:@"KKColorListViewController" bundle:[NSBundle mainBundle]];
    if (self) {
        self.currentScheme = schemeType;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initUI
{
    [self.colorsTable registerNib:[UINib nibWithNibName:@"KKColorCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"KKColorCell"];
    self.view.backgroundColor = [UIColor colorFromHexString:@"1b1b1b"];
    
    [KKColorsLoader loadColorsForType:self.currentScheme completion:^(NSArray *colors) {
        self.colors = colors;
        [self.colorsTable reloadData];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"KKColorCell";
    
    KKColorCell *cell = (KKColorCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    KKColor *color = self.colors[indexPath.row];
    [cell setColor:color];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KKColor *color = self.colors[indexPath.row];
}

@end
