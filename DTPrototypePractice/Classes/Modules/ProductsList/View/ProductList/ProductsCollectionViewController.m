//
//  ProductsCollectionViewController.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "ProductsCollectionViewController.h"
#import "ProductCollectionViewCell.h"
#import "DTNAPIDataProvider.h"
#import "DTNProduct.h"
#import "UIImage+CustomImage.h"

@interface ProductsCollectionViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation ProductsCollectionViewController

static NSString * const reuseIdentifier = @"ProductCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchProducts];
    
    // Setup collection
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cell classes
     [self.collectionView registerNib:[UINib nibWithNibName:@"ProductCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}

-(void)viewDidAppear:(BOOL)animated {
    [self showNoProductsPopupMessage];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.products count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    DTNProduct *prod = [self.products objectAtIndex:indexPath.row];
    
    cell.isNewArrival = prod.isNewArrival;
    
    NSURLComponents *urlComponent = [[NSURLComponents alloc] initWithString:prod.imageURL];
    urlComponent.scheme = @"http";
    
    [cell.productImage loadImageWith:urlComponent.URL];
    cell.displaynameLabel.text = prod.prodName;
    cell.priceLabel.text = prod.price;
    
    return cell;
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Device screen size
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat widthPadding = 15;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat heightPadding = 20;
    
    // Calculation of cell size
    return CGSizeMake((width / 2) - widthPadding, (height / 2) - heightPadding);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)fetchProducts {
    DTNAPIDataProvider *api = [[DTNAPIDataProvider alloc] init];
    
    [api  fetchProductsFromStorage:^(NSArray *pr) {
        self.products = pr;
        [self.collectionView reloadData];
    }];
}

#pragma mark - Viper

-(void) showNoProductsPopupMessage {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Products"
                                                                   message:@"No Products"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
