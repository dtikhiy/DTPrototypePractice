//
//  DTNProdListInteractor.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProdListInteractor.h"
#import "APIProductClient.h"
#import "JSONProductResponseParser.h"
#import "DTNProductEntity.h"

@implementation DTNProdListInteractor

#pragma mark - Viper Interactor

- (void)fetchProductsFromAPI {
    
    APIProductClient *api = [[APIProductClient alloc] initWithJSONParser:[JSONProductResponseParser new]];
    
    [api  fetchProductsFromServer:^(NSArray *products) {
        [self.presenter fetchedProductsFromAPI:products];
    }];
}

@end
