//
//  SetViewController.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/15.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "SetViewController.h"
#import "UIColor+GKHex.h"
#import "ThemeManager.h"

@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *themeSource;
@property(nonatomic,strong) NSIndexPath *lastPath;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor violetColor]];

    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:backItem,nil];
    self.title = @"设置主题";
    
    [self setThemeSource];
    
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
}


-(void)setThemeSource
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"colors" ofType:@"plist"];
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    
    NSMutableArray *colors = [data objectForKey:@"colors"];
    
    if(!_themeSource){
        _themeSource = [NSMutableArray arrayWithArray:colors];
    }
}



-(void)backClick
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    
    [self.navigationController popViewControllerAnimated:NO];
    
    [UIView commitAnimations];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _themeSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *themeName = [[ThemeManager sharedTheme] GetCurrentThemeName];
    
    
    NSString *name = [[_themeSource objectAtIndex:indexPath.row] objectForKey:@"name"];
    NSNumber *R = [[_themeSource objectAtIndex:indexPath.row] objectForKey:@"R"];
    NSNumber *G = [[_themeSource objectAtIndex:indexPath.row] objectForKey:@"G"];
    NSNumber *B = [[_themeSource objectAtIndex:indexPath.row] objectForKey:@"B"];
    
    static NSString *Identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        cell.backgroundColor = [UIColor colorWithR:[R floatValue] G:[G floatValue] B:[B floatValue] A:1.0];
        cell.textLabel.text = name;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    if([name isEqualToString:themeName])
    {
        _lastPath = indexPath;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    CALayer *border = [CALayer layer];
    border.backgroundColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, cell.contentView.frame.size.height - 5, cell.contentView.frame.size.width, 5);
    [cell.contentView.layer addSublayer:border];
  
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(_lastPath.row == indexPath.row)
    {
        return;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_lastPath.row inSection:0]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    _lastPath = indexPath;
    
    
    
    UIColor *color = [[ThemeManager sharedTheme] SetNewTheme:[_themeSource objectAtIndex:indexPath.row]];
    
    self.navigationController.navigationBar.barTintColor = color;
         //[tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
