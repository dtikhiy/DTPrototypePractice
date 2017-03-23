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

- (void)fetchProductsFromAPI {
    
    self.apiService = [[APIProductClient alloc] initWithJSONParser:[JSONProductResponseParser new]];
    
    [self.apiService fetchProductsFromServer:^(NSArray *products) {
        [self.presenter fetchedProductsFromAPI:products];
    } failure:^(NSError *error) {
        [self.presenter errorHasOccuredWithMessage:@"Check your internet connection."];
    }];
}

@end
