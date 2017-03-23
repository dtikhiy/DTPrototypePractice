//
//  APIProductClient.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 3/21/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIServerProtocol.h"

@protocol ProductResponseParserProtocol;
@class JSONProductResponseParser;

@interface APIProductClient : NSObject<APIServerProtocol>

@property (strong, nonatomic) id<ProductResponseParserProtocol> parser;

- (instancetype)initWithJSONParser:(JSONProductResponseParser *) parser;

@end
