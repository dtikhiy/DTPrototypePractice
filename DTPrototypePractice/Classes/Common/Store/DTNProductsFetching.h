//
//  DTNProductsFetching.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/26/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DTNProductsFetching <NSObject>

/*!
 @brief The protocol to define the methods for data fetching
 @param  complition block to send the data
 
 */

-(void) fetchProductsFromStorage:(void (^)(NSArray*))complition;

@end
