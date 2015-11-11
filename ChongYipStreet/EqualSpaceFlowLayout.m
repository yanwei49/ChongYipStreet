

#import "EqualSpaceFlowLayout.h"

@interface EqualSpaceFlowLayout()

@property (nonatomic, assign) CGSize contextSize;
@property (nonatomic, strong) NSMutableArray * selectAttributes;
@end


@implementation EqualSpaceFlowLayout

- (instancetype) initWithDelegate:(id<EqualSpaceFlowLayoutDelegate>)delegate{
    if (self = [super init]) {
        self.delegate = delegate;
        self.minimumLineSpacing = 5;
        self.minimumInteritemSpacing = 5;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}


#pragma mark - Methods to Override
- (void)prepareLayout{
    [super prepareLayout];

    //初始化坐标
    CGFloat xOffset = self.sectionInset.left;
    CGFloat yOffset = self.minimumLineSpacing;
    CGFloat xNextOffset = self.sectionInset.left;
    
    NSInteger selectItemCount = [[self collectionView] numberOfItemsInSection:0];
    self.selectAttributes = [NSMutableArray arrayWithCapacity:selectItemCount];
    
    yOffset += [self loadAttributes:0 count:selectItemCount x:xOffset y:yOffset xNext:xNextOffset];
    
    yOffset = yOffset <= DeviceHeight - 145 ? DeviceHeight  - 145: yOffset;
    _contextSize = CGSizeMake(DeviceWidth, yOffset + 40);
    [self.delegate setCollectionHeight:yOffset];
}
- (CGSize) collectionViewContentSize{
    return _contextSize;
}
- (CGFloat) loadAttributes:(NSInteger) section count:(NSInteger) itemCount x:(CGFloat) xOffset y:(CGFloat) yOffset  xNext:(CGFloat) xNextOffset{
    for (NSInteger idx = 0; idx < itemCount; idx++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:section];
        CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
        
        xNextOffset+=(self.minimumInteritemSpacing + itemSize.width);
        if (xNextOffset > [self collectionView].bounds.size.width - self.sectionInset.right) {
            xOffset = self.sectionInset.left;
            xNextOffset = (self.sectionInset.left + self.minimumInteritemSpacing + itemSize.width);
            yOffset += (itemSize.height + self.minimumLineSpacing);
        }
        else
        {
            xOffset = xNextOffset - (self.minimumInteritemSpacing + itemSize.width);
        }
        
        UICollectionViewLayoutAttributes *layoutAttributes =
        [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        layoutAttributes.frame = CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height);
        [self.selectAttributes addObject:layoutAttributes];
    }
    return yOffset;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    return (self.selectAttributes)[indexPath.item];
};


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i = 0 ; i < self.selectAttributes.count; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }

    return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return NO;
}
@end
