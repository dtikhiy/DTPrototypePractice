//
//  DTNProdListInteractor.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProdListInteractor.h"
#import "DTNAPIDataProvider.h"
#import "DTNProdListPresenter.h"

@implementation DTNProdListInteractor

#pragma mark - Viper Interactor

-(void) fetchProductsFromAPI {
    
    DTNAPIDataProvider *api = [[DTNAPIDataProvider alloc] init];
    
    [api  fetchProductsFromStorage:^(NSArray *pr) {
        [self.presenter fetchedProductsFromAPI:pr];
    }];
}

@end
