//
//  NoteViewController.m
//  ChongYipStreet
//
//  Created by youyou5920 on 15/10/31.
//  Copyright © 2015年 颜魏. All rights reserved.
//

#import "GlobalDefine.h"
#import "NoteViewController.h"

@interface NoteViewController ()<UITextFieldDelegate,UIWebViewDelegate>
@property (nonatomic,strong) UIToolbar       * toolBar;
@property (nonatomic,strong) UIWebView       * wedView;
@property (nonatomic,strong) UITextField     * textField;
@property (nonatomic,strong) UIBarButtonItem * barItem1;
@property (nonatomic,strong) UIBarButtonItem * barItem2;
@property (nonatomic,strong) UIBarButtonItem * barItem3;
@property (nonatomic,strong) UIBarButtonItem * barItem4;
@end

@implementation NoteViewController
- (void) dealloc{
    [self releaseKVO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutNavigationBar];
    [self layoutContentView];
    [self layoutToolBar];

    [self initKVO];
    
}
- (void) initKVO{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardDidHidden:) name:UIKeyboardWillHideNotification object:nil];
}
- (void) releaseKVO{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) layoutNavigationBar{
    UIButton * subscriptionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [subscriptionButton setFrame:CGRectMake(0, 0, 70, 44)];
    [subscriptionButton setImage:[UIImage imageNamed:@"6"] forState:UIControlStateNormal];
    [subscriptionButton addTarget:self action:@selector(subscriptionAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:subscriptionButton];
}
- (void) layoutToolBar{
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, DeviceHeight - 44, DeviceWidth, 44)];
     UIColor * itemColor = [UIColor grayColor];
    
    CGFloat width = DeviceWidth / 2 - 30;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
    [imageView setImage: [UIImage imageNamed:@"7"]];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(22, 2.5, width - 33, 25)];
    [imageView addSubview:self.textField];
    
    [self.textField setDelegate:self];

    UIBarButtonItem * spanItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem * textItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
   
    self.barItem1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1"] style:UIBarButtonItemStylePlain target:self action:@selector(item1Action:)];
    [self.barItem1 setTintColor:itemColor];
    self.barItem2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"2"] style:UIBarButtonItemStylePlain target:self action:@selector(item2Action:)];
    [self.barItem2 setTintColor:itemColor];
    self.barItem3 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"3"] style:UIBarButtonItemStylePlain target:self action:@selector(item3Action:)];
    [self.barItem3 setTintColor:itemColor];
    self.barItem4 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"4"] style:UIBarButtonItemStylePlain target:self action:@selector(item4Action:)];
    [self.barItem4 setTintColor:itemColor];
    self.toolBar.items = @[textItem,spanItem,self.barItem1,spanItem,self.barItem2,spanItem,self.barItem3,spanItem,self.barItem4];
    [self.view addSubview:self.toolBar];
}
- (void) layoutContentView{
    self.wedView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight - 44)];
    [self.wedView setDelegate:self];
    [self.wedView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.19lou.com/forum-269-thread-10991446259260344-1-1.html"]]];
    [self.view addSubview:self.wedView];
}


#pragma mark - UIWedView - Delegate


#pragma mark - UITextFile - Delegate
- (void) textFieldDidBeginEditing:(UITextField *)textField{
    [textField setBackgroundColor:RGBA(243.0f, 246.0f, 248.0f, 1.0f)];
}
- (void) textFieldDidEndEditing:(UITextField *)textField{
    [textField setBackgroundColor:textField.text.length > 0 ? RGBA(243.0f, 246.0f, 248.0f, 1.0f) : [UIColor clearColor]];
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
#pragma mark - Action
- (void) subscriptionAction:(UIBarButtonItem *) subscriptionItem{
    
}

- (void) item1Action:(UIBarButtonItem *) buttonItem{
    
}
- (void) item2Action:(UIBarButtonItem *) buttonItem{
    
}
- (void) item3Action:(UIBarButtonItem *) buttonItem{
    
}
- (void) item4Action:(UIBarButtonItem *) buttonItem{
    
}

#pragma mark KVO 
- (void) handleKeyboardDidShow:(NSNotification *) notification{
    NSDictionary * userInfo = [notification userInfo];
    CGRect keyboardFrame;
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    [self.toolBar setFrame:CGRectMake(0, DeviceHeight - 44 - keyboardFrame.size.height, DeviceWidth, 44)];
}
- (void) handleKeyboardDidHidden:(NSNotification *) notification{
    [self.toolBar setFrame:CGRectMake(0, DeviceHeight - 44, DeviceWidth, 44)];
}
@end
