//
//  DTNProductListVC.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProductListVC.h"
#import "DTNProductCell.h"
#import "ProductListCollectionViewDataSource.h"
#import "Constants.h"

@interface DTNProductListVC () <UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) ProductListCollectionViewDataSource *collectionViewDataSource;
@end

@implementation DTNProductListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionViewDataSource = [ProductListCollectionViewDataSource new];
    
    [self configureView];
    self.collectionView.dataSource = self.collectionViewDataSource;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.presenter updateData];
}

#pragma mark - Viper View

- (void)configureView {
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DTNProductCell class]) bundle:nil] forCellWithReuseIdentifier:kProductListCellReuseIdentifier];
}

- (void)updateProductWithData:(NSArray*) products {
    self.collectionViewDataSource.content = products;
    
    [self.collectionView reloadData];
}

- (void)displayNoProductsAlertWith:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Fetch Error"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Device screen size
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    
    // Calculation of cell size
    return CGSizeMake((width / 2) - kWidthPadding, (height / 2) - kHeightPadding);
}

@end
