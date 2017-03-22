//
//  DTNProductListVC.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTNProductListProtocols.h"

@class DTNProdListPresenter;

@interface DTNProductListVC : UICollectionViewController<DTNProductListViewProtocol>

@property (strong, nonatomic) id<DTNProductListPresenterProtocol> presenter;

- (void)displayNoProductsAlertMessage;
- (void)updateProductWithData:(NSArray*) product;

@end
