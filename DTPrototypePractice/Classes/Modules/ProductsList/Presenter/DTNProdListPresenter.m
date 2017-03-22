//
//  DTNProdListPresenter.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProdListPresenter.h"

@implementation DTNProdListPresenter

#pragma mark - Viper Presenter

- (void)fetchedProductsFromAPI:(NSArray *)products {
    if (products.count == 0) {
        [self.view displayNoProductsAlertMessage];
    } else {
        [self updateInterfaceWithData:products];
    }
}

- (void)updateInterfaceWithData:(NSArray*) products {
    [self.view updateProductWithData:products];
}

- (void)updateData {
    [self.interactor fetchProductsFromAPI];
}

@end
