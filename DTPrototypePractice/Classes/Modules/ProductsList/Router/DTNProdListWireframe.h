//
//  DTNProdListWireframe.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DTNProductListProtocols.h"

@class DTNProductListVC;

@interface DTNProdListWireframe : NSObject<DTNProductListWireframeProtocol>

@property (weak, nonatomic) DTNProductListVC *view;

+ (void)presentScreenFromViewController:(UIViewController *) viewController;

@end
