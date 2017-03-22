//
//  ProductResponseParserProtocol.h
//  AEViperPrototype
//
//  Created by Dmytro Tykhyi on 3/17/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ProductResponseModel;

@protocol ProductResponseParserProtocol <NSObject>

- (NSArray*)parseProductsFrom:(NSData*) data;

@end
