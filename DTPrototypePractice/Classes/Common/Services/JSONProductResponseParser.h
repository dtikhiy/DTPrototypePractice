//
//  ProductResponseParser.h
//  AEViperPrototype
//
//  Created by Dmytro Tykhyi on 3/17/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductResponseParserProtocol.h"

@interface JSONProductResponseParser : NSObject <ProductResponseParserProtocol>

- (NSArray*)parseProductsFrom:(NSData*) data;

@end
