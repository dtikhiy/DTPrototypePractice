//
//  DTNProdListPresenter.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTNProductListProtocols.h"

@interface DTNProdListPresenter : NSObject<DTNProductListPresenterProtocol>

@property (strong, nonatomic) id<DTNProductListInteractorProtocol> interactor;
@property (strong, nonatomic) id<DTNProductListWireframeProtocol> wireframe;
@property (weak, nonatomic) id<DTNProductListViewProtocol> view;

@end
