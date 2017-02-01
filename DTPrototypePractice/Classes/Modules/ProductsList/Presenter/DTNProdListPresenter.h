//
//  DTNProdListPresenter.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTNProdListInteractor;

@interface DTNProdListPresenter : NSObject

@property (weak, nonatomic) DTNProdListInteractor *prodListInteractor;

-(void) updateCellWithData;

@end
