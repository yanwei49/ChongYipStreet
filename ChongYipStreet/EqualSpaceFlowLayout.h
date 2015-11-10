

#import <UIKit/UIKit.h>

@protocol  EqualSpaceFlowLayoutDelegate<UICollectionViewDelegateFlowLayout>
- (void) setCollectionHeight:(CGFloat) height;
@end

@interface EqualSpaceFlowLayout : UICollectionViewFlowLayout
@property (nonatomic,weak) id<EqualSpaceFlowLayoutDelegate> delegate;
- (instancetype) initWithDelegate:(id<EqualSpaceFlowLayoutDelegate>)delegate;
@end
