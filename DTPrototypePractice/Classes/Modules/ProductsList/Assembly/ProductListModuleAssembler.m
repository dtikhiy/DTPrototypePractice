//
//  ProductListModuleAssembler.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/31/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "ProductListModuleAssembler.h"
#import "DTNProdListPresenter.h"
#import "DTNProdListInteractor.h"
#import "DTNAPIDataProvider.h"
#import "DTNProductListVC.h"

@implementation ProductListModuleAssembler

-(instancetype)initWithVC:(DTNProductListVC*) vc {
    
    if (self = [super init]) {
        [self congfigureProductListModule:vc];
    }
    
    return self;
}

-(void) congfigureProductListModule:(DTNProductListVC*) vc {
    
    // Generate VIPER items
    DTNProdListPresenter *listPresenter = [[DTNProdListPresenter alloc] init];
    DTNProdListInteractor *listInteractor = [[DTNProdListInteractor alloc] init];
    
    // Set references
    listPresenter.interactor = listInteractor;
    listInteractor.presenter = listPresenter;
    listPresenter.userInterface = vc;
    
    vc.eventHandler = listPresenter;
}

@end
