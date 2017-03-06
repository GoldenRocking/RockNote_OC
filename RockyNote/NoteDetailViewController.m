//
//  NoteDetailViewController.m
//  RockyNote
//
//  Created by guoruiqing on 2017/3/6.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "NoteDetailViewController.h"
#import "GKConstants.h"
#import "UIColor+GKHex.h"

static const CGFloat kViewOriginY = 70;
static const CGFloat kTextFieldHeight = 30;
static const CGFloat kToolbarHeight = 44;
static const CGFloat kVoiceButtonWidth = 100;

@interface NoteDetailViewController ()<UINavigationControllerDelegate>
{
    GKNote *_note;
    UITextField *_titleTextField;
    UITextView *_contentTextView;
    
    UIButton *_voiceButton;
    BOOL _isEditingTitle;
}
@end

@implementation NoteDetailViewController

-(instancetype)initWithNote:(GKNote *)note
{
    self = [super init];
    if(self)
    {
        _note = note;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initComps];
    [self setupNavigationBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    
}

-(void)setupNavigationBar
{
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    
    UIBarButtonItem *moreItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_more_white"] style:UIBarButtonItemStylePlain target:self action:@selector(moreActionButtonPressed)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:moreItem,saveItem,nil];
}

-(void)initComps
{
    CGRect frame = CGRectMake(kHorizontalMargin, kViewOriginY, self.view.frame.size.width - kHorizontalMargin * 2, kTextFieldHeight);
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(hideKeyboard)];
    doneBarButton.width = ceilf(self.view.frame.size.width) / 3 - 30;
    
    UIBarButtonItem *voiceBarButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"micro_small"] style:UIBarButtonItemStylePlain target:self action:@selector(useVoiceInput)];
    voiceBarButton.width = ceilf(self.view.frame.size.width) / 3;
    
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kToolbarHeight)];
    toolbar.tintColor = [UIColor systemColor];
    toolbar.items = [NSArray arrayWithObjects:doneBarButton,voiceBarButton,nil];
    
    _titleTextField = [[UITextField alloc]initWithFrame:frame];
    if(_note)
    {
        _titleTextField.text = _note.title;
    }else
    {
        _titleTextField.placeholder = @"标题";
    }
    
    _titleTextField.textColor = [UIColor systemDarkColor];
    _titleTextField.inputAccessoryView = toolbar;
    [self.view addSubview:_titleTextField];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(kHorizontalMargin, kViewOriginY + kTextFieldHeight, self.view.frame.size.width - kHorizontalMargin, 1)];
    lineView.backgroundColor = [UIColor systemDarkColor];
    [self.view addSubview:lineView];
    
    CGFloat textY = kViewOriginY + kTextFieldHeight + kVerticalMargin;
    frame = CGRectMake(kHorizontalMargin,textY, self.view.frame.size.width - kHorizontalMargin * 2, self.view.frame.size.height - textY - kVoiceButtonWidth - kVerticalMargin * 2);
    
    _contentTextView = [[UITextView alloc]initWithFrame:frame];
    _contentTextView.textColor = [UIColor systemDarkColor];
    _contentTextView.font = [UIFont systemFontOfSize:16];
    _contentTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    _contentTextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [_contentTextView setScrollEnabled:YES];
    
    if(_note)
    {
        _contentTextView.text = _note.content;
    }
    _contentTextView.inputAccessoryView = toolbar;
    [self.view addSubview:_contentTextView];
    
    _voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_voiceButton setFrame:CGRectMake((self.view.frame.size.width - kVoiceButtonWidth) / 2, self.view.frame.size.height - kVoiceButtonWidth - kVerticalMargin, kVoiceButtonWidth, kVoiceButtonWidth)];
    [_voiceButton setTitle:@"语音输入" forState:UIControlStateNormal];
    [_voiceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _voiceButton.layer.cornerRadius = kVoiceButtonWidth / 2;
    _voiceButton.layer.masksToBounds = YES;
    [_voiceButton setBackgroundColor:[UIColor systemColor]];
    [_voiceButton setTintColor:[UIColor whiteColor]];
    [self.view addSubview:_voiceButton];
}

-(void)useVoiceInput
{
    [self hideKeyboard];
}


-(void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    [UIView animateWithDuration:[userInfo [ UIKeyboardAnimationDurationUserInfoKey] doubleValue] delay:0.f options:[userInfo [UIKeyboardAnimationCurveUserInfoKey] integerValue] animations:^{
        CGRect keyboardFrame = [[userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        CGFloat keyboardHeight = keyboardFrame.size.height;
        
        CGRect frame = _contentTextView.frame;
        frame.size.height = self.view.frame.size.height - kViewOriginY - kTextFieldHeight - keyboardHeight - kVerticalMargin - kToolbarHeight,
        _contentTextView.frame = frame;
        
    } completion:nil];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    [UIView animateWithDuration:[userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0.f
                        options:[userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]
                     animations:^
     {
         CGRect frame = _contentTextView.frame;
         frame.size.height = self.view.frame.size.height - kViewOriginY - kTextFieldHeight - kVoiceButtonWidth - kVerticalMargin * 3;
         _contentTextView.frame = frame;
     }               completion:NULL];
}

-(void)hideKeyboard
{
    if([_titleTextField isFirstResponder])
    {
        _isEditingTitle = YES;
        [_titleTextField resignFirstResponder];
    }
    
    if([_contentTextView isFirstResponder])
    {
        _isEditingTitle = NO;
        [_contentTextView resignFirstResponder];
    }
}



-(void)moreActionButtonPressed
{
    [self hideKeyboard];
}

-(void)save
{
    [self hideKeyboard];
    if((_contentTextView.text == nil || _contentTextView.text.length == 0) && (_titleTextField.text == nil || _titleTextField.text.length == 0)){
        
        return;
    }
    
    NSDate *createDate;
    if(_note && _note.createdDate){
        createDate = _note.createdDate;
    }else{
        createDate = [NSDate date];
    }
    
    GKNote *note = [[GKNote alloc] initWithTitle:_titleTextField.text content:_contentTextView.text createdDate:createDate updateDate:[NSDate date]];
    _note = note;
    
    BOOL success = [note Persistence];
    
    if(success)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationCreateFile object:nil userInfo:nil];
    }else
    {
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
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
