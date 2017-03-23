//
//  DTNProdListInteractor.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTNProductListProtocols.h"

@protocol APIServerProtocol;

@interface DTNProdListInteractor : NSObject<DTNProductListInteractorProtocol>

@property (weak, nonatomic) id<DTNProductListPresenterProtocol> presenter;
@property (strong, nonatomic) id<APIServerProtocol> apiService;

- (void)fetchProductsFromAPI;

@end
