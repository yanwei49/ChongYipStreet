

#import "SearchViewController.h"
#import "EqualSpaceFlowLayout.h"


@interface TagItem : NSObject
@property (nonatomic,strong) NSNumber * tagId;
@property (nonatomic,copy)   NSString * tagName;
@property (nonatomic,assign) CGSize size;
+ (CGSize) getSizeTagName:(NSString *) tagName fontSize:(CGFloat) fontSize;
@end
@implementation TagItem
+ (CGSize) getSizeTagName:(NSString *) tagName fontSize:(CGFloat) fontSize{
    CGSize size = [tagName boundingRectWithSize:CGSizeMake(DeviceWidth, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    size.height = 30;
    size.width = size.width + 30 < 60 ? 60 : size.width + 30;
    size.width = size.width + 30 < 250 ? size.width : 250;
    return size;
}
@end


#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(1.0f)]

@interface SearchViewController ()<EqualSpaceFlowLayoutDelegate>
@end


#define SEARCH_FONT_MAX    (30)

@implementation SearchViewController
#pragma mark - Property - 懒加载
- (NSMutableArray *) dataSource{
    if(_dataSource){
        return _dataSource;
    }

    _dataSource = [[NSMutableArray alloc] init];

    return _dataSource;
}


- (instancetype) initWithDelegate:(id<SearchViewControllerDelegate>) delegate{
    if(self = [super init]){
        self.delegate = delegate;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"搜索", nil)];
    [self.view setBackgroundColor:RGB(231.0f,245.0f,240.0f)];
   

    [self layoutView];
    [self loadData];
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
}
- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = YES;
}
- (void) loadData{
    
    for(int i = 0; i < 12; i++){
        TagItem * tagItem = [[TagItem alloc] init];
        [tagItem setTagId:@(i)];
        [tagItem setTagName:[NSString stringWithFormat:@"搜索%d",i]];
        [tagItem setSize:[TagItem getSizeTagName:[NSString stringWithFormat:@"搜索%d",i] fontSize:13]];
        [self.dataSource addObject:tagItem];
    }
    [_collectionView reloadData];
}


- (void) layoutView{
    
    
    UIView * searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 40)];
    [searchView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [self.view addSubview:searchView];
    
    _textField =[[UITextField alloc] initWithFrame:CGRectMake(5, 5, DeviceWidth - 60, 30)];
    [_textField setDelegate:self];
    [_textField setPlaceholder:NSLocalizedString(@"搜索", nil)];
    [_textField setTextAlignment:NSTextAlignmentCenter];
    [_textField.layer setCornerRadius:5];
    [_textField setBackgroundColor:[UIColor whiteColor]];//RGB(180.0f,220.0f,195.0f)
    [_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_textField setTextColor:[UIColor grayColor]];
    [_textField setLeftView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)]];
    [_textField setLeftViewMode:UITextFieldViewModeAlways];
    [_textField setReturnKeyType:UIReturnKeyDone];
    [searchView addSubview:_textField];

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(DeviceWidth - 55 ,5, 50, 30)];
    [button setTitle:NSLocalizedString(@"搜索", nil) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
    [searchView addSubview:button];
    
    EqualSpaceFlowLayout * flowLayout = [[EqualSpaceFlowLayout alloc] initWithDelegate:self];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, DeviceWidth, DeviceHeight - 104) collectionViewLayout:flowLayout];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];//RGB(231.0f,245.0f,240.0f)
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"TagCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self.view addSubview:self.collectionView];
}
#pragma mark - CollectionView - Delegate
- (void) setCollectionHeight:(CGFloat)height{

}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataSource count];
}
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    TagItem * tagItem = self.dataSource[indexPath.item];
    return [TagItem getSizeTagName:tagItem.tagName fontSize:14];
}
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TagCell" forIndexPath:indexPath];
    
    UILabel * title = (UILabel *)[cell.contentView viewWithTag:1024];
    
    if(!title){
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100 , 30)];
        [title.layer setCornerRadius:15];
        [title setTextColor:[UIColor whiteColor]];
        [title setFont:[UIFont systemFontOfSize:14]];
        [title setTextAlignment:NSTextAlignmentCenter];
        [title.layer setBackgroundColor:[UIColor greenColor].CGColor];
        
        [title setTag:1024];
        [cell.contentView addSubview:title];
    }
    
    TagItem * tagItem = self.dataSource[indexPath.item];
    CGSize size = [TagItem getSizeTagName:tagItem.tagName fontSize:14];
    [title setFrame:CGRectMake(0, 0, size.width, size.height)];
    [title setText:[tagItem tagName]];

    return cell;
}
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        
    NSNumber * tagId = [self.dataSource[indexPath.item] tagId];
    
    
    [_collectionView reloadData];
}



#pragma mark - TextFiled - Delegate

- (void) textFieldDidBeginEditing:(UITextField *)textField{
    textField.placeholder = @"";
    [_textField setTextAlignment:NSTextAlignmentLeft];
}
- (void) textFieldDidEndEditing:(UITextField *)textField{
    if([textField.text length] == 0){
        [_textField setTextAlignment:NSTextAlignmentCenter];
        [_textField setPlaceholder:NSLocalizedString(@"搜索", nil)];
    }
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if([string isEqualToString:@""]){
        return YES;
    }
    
    return textField.text.length + string.length < SEARCH_FONT_MAX;
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    return YES;
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - Action
- (void) searchAction:(UIButton *) searchButton{

    if(_textField.text.length > 0){
 
        
        
        [_textField setText:@""];
        [_textField setTextAlignment:NSTextAlignmentCenter];
        [_textField setPlaceholder:NSLocalizedString(@"搜索", nil)];
        [_collectionView reloadData];
    }
   
    [_textField resignFirstResponder];
}
@end
