//
//  DTNProdListPresenter.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProdListPresenter.h"
#import "DTNProductEntity.h"
#import "ProductResponseModel.h"

@implementation DTNProdListPresenter

- (void)fetchedProductsFromAPI:(NSArray *)products {
    if (products.count == 0) {
        [self errorHasOccuredWithMessage:@"API returned no products."];
    } else {
        [self updateInterfaceWithData:products];
    }
}

- (void)updateInterfaceWithData:(NSArray*) products {
    NSArray *entities = [self createProductListEntiryFromResponseModel:products];
    [self.view updateProductWithData:entities];
}

- (void)updateData {
    [self.interactor fetchProductsFromAPI];
}

- (void)errorHasOccuredWithMessage:(NSString *)message {
    [self.view displayNoProductsAlertWith:message];
}

- (NSArray *)createProductListEntiryFromResponseModel:(NSArray *)products {
    NSMutableArray *entities = [NSMutableArray new];
    for (ProductResponseModel *response in products) {
        DTNProductEntity *entity = [DTNProductEntity new];
        entity.productName = response.productName;
        entity.price = response.price;
        entity.imageURL = response.imageURL;
    
        [entities addObject:entity];
    }
    
    return entities;
}

@end
