//
//  NoteListViewController.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/3.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "NoteListViewController.h"
#import "GKConstants.h"
#import "GKNote.h"
//#import "GKNoteManager.h"
#import "NoteListCell.h"
#import "NoteDetailViewController.h"
#import "GKNoteDBM.h"
#import "SetViewController.h"

@interface NoteListViewController ()

@property(nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation NoteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:kNotificationCreateFile object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setupNavigationBar
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_add_tab"] style:UIBarButtonItemStylePlain target:self action:@selector(createTask)];
    self.navigationItem.rightBarButtonItem = item;
    
    UIBarButtonItem *itemleft = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setTask)];
    self.navigationItem.leftBarButtonItem = itemleft;
    self.navigationItem.title = kAppName;
}

-(void)loadData
{
    _dataSource = [[GKNoteDBM sharedDataBase] getAllNote];
    [self.tableView reloadData];
}

-(void)setTask
{
    SetViewController *controller = [[SetViewController alloc]init];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    
    [self.navigationController pushViewController:controller animated:YES];
    
    [UIView commitAnimations];
    
}

-(void)createTask
{
    NoteDetailViewController *controller = [[NoteDetailViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
    
}

-(NSMutableArray *)dataSource
{
    if(!_dataSource){
        _dataSource = [[GKNoteDBM sharedDataBase] getAllNote];
    }
    
    return _dataSource;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKNote *note = [self.dataSource objectAtIndex:indexPath.row];
    return [NoteListCell heightWithNote:note];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoteListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    
    if(!cell)
    {
        cell = [[NoteListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListCell"];
    }
    
    
    GKNote *note = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateWithNote:note];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    GKNote *note = [self.dataSource objectAtIndex:indexPath.row];

    NoteDetailViewController *controller = [[NoteDetailViewController alloc]initWithNote:note];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        GKNote *note = [self.dataSource objectAtIndex:indexPath.row];
        [[GKNoteDBM sharedDataBase] deleteNote:note];
        
        [self.dataSource removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
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
