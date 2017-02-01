//
//  DTNProdListPresenter.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTNProdListInteractorOutput.h"
#import "DTNProdListModuleInterface.h"

@class DTNProdListInteractor;
@class DTNProdListWireframe;
@class DTNProductListVC;

@interface DTNProdListPresenter : NSObject <DTNProdListInteractorOutput, DTNProdListModuleInterface>

@property (strong, nonatomic) DTNProdListInteractor *interactor;
@property (strong, nonatomic) DTNProdListWireframe *wireframe;
@property (strong, nonatomic) DTNProductListVC *userInterface;

@end
