//
//  APIProductClient.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 3/21/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductResponseParserProtocol.h"
@class JSONProductResponseParser;

@interface APIProductClient : NSObject

@property (strong, nonatomic) id<ProductResponseParserProtocol> parser;

- (instancetype)initWithJSONParser:(JSONProductResponseParser *) parser;
- (void)fetchProductsFromServer:(void (^) (NSArray*)) complition;

@end
