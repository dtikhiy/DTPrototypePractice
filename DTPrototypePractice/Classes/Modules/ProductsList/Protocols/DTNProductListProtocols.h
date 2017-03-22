//
//  DTNProductListProtocols.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 3/21/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DTNProductListWireframeProtocol <NSObject>

+ (void)presentScreenFromViewController:(UIViewController *) viewController;

@end

@protocol DTNProductListPresenterProtocol <NSObject>

- (void)updateData;
- (void)updateInterfaceWithData:(NSArray*) products;
- (void)fetchedProductsFromAPI:(NSArray *)products;

@end

@protocol DTNProductListInteractorProtocol <NSObject>

- (void)fetchProductsFromAPI;

@end

@protocol DTNProductListViewProtocol <NSObject>

- (void)displayNoProductsAlertMessage;
- (void)updateProductWithData:(NSArray*) products;


@end
