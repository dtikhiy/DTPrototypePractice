//
//  ProductListCollectionViewDataSource.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 3/22/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "ProductListCollectionViewDataSource.h"
#import "DTNProductCell.h"
#import "Constants.h"

@implementation ProductListCollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.content count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DTNProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kProductListCellReuseIdentifier forIndexPath:indexPath];
    DTNProductEntity *prod = [self.content objectAtIndex:indexPath.row];
    
    [cell updateCellWithProductData:prod];
    
    return cell;
}

@end
