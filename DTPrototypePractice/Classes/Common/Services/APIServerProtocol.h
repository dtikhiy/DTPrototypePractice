//
//  APIServerProtocol.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 3/22/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIServerProtocol <NSObject>

- (void)fetchProductsFromServer:(void (^) (NSArray*))success failure:(void(^)(NSError* error))failure;

@end
