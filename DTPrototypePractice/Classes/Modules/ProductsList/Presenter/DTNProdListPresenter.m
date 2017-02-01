//
//  DTNProdListPresenter.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProdListPresenter.h"
#import "DTNProdListInteractor.h"
#import "DTNProductListVC.h"

@implementation DTNProdListPresenter

-(void) fetchedProductsFromAPI:(NSArray *)products {
    if (products.count == 0) {
        [self.userInterface showNoProductsPopupMessage];
    } else {
        [self updateInterfaceWithData:products];
    }
}

-(void) updateInterfaceWithData:(NSArray*) products {
    [self.userInterface updateProductWithData:products];
}

-(void) updateData {
    [self.interactor fetchProductsFromAPI];
}

@end
