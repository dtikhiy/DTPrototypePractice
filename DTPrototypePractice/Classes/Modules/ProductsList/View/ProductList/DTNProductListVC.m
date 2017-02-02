//
//  DTNProductListVC.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProductListVC.h"
#import "DTNProductCell.h"
#import "DTNAPIDataProvider.h"
#import "DTNProduct.h"

@interface DTNProductListVC () <UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) NSArray *productsData;
@end

@implementation DTNProductListVC

static NSString * const reuseIdentifier = @"ProductCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.eventHandler updateData];
}

#pragma mark - Viper View

-(void) configureView {
    // Setup collection
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:@"DTNProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}

-(void) updateProductWithData:(NSArray*) products {
    self.productsData = products;
    
    [self.collectionView reloadData];
}

-(void) showNoProductsPopupMessage {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Response is empty"
                                                                   message:@"API returned no products."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.productsData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DTNProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    DTNProduct *prod = [self.productsData objectAtIndex:indexPath.row];
    
    [cell updateCellWithProductData:prod];
    
    return cell;
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Device screen size
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat widthPadding = 15;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat heightPadding = 10;
    
    // Calculation of cell size
    return CGSizeMake((width / 2) - widthPadding, (height / 2) - heightPadding);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
