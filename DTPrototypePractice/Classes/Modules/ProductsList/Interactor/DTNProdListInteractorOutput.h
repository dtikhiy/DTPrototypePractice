//
//  DTNProdListInteractorOutput.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/31/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DTNProdListInteractorOutput <NSObject>

-(void) fetchedProductsFromAPI:(NSArray*) products;

@end
