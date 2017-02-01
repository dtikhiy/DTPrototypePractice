//
//  DTNProductListVC.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTNProdListPresenter.h"
#import "DTNProdListModuleInterface.h"


@interface DTNProductListVC : UICollectionViewController

@property (nonatomic, strong) id<DTNProdListModuleInterface>    eventHandler;

-(void) showNoProductsPopupMessage;
-(void) updateProductWithData:(NSArray*) product;

@end
