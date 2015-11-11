

#import <UIKit/UIKit.h>

@protocol SearchViewControllerDelegate<NSObject>
- (void) changeSelectedTags:(NSMutableArray *) tags;
@end

@interface SearchViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate>

@property (nonatomic,strong) NSMutableArray   * dataSource;
@property (nonatomic,strong) UITextField      * textField;
@property (nonatomic,strong) UICollectionView * collectionView;

@property (nonatomic,weak) id<SearchViewControllerDelegate> delegate;
- (instancetype) initWithDelegate:(id<SearchViewControllerDelegate>) delegate;
@end
