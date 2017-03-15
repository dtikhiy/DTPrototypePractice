//
//  Product.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/21/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTNProdInfoLabelTypes.h"

@class UIImage;

@interface DTNProduct : NSObject

@property (copy, nonatomic) NSString *prodName;
@property (assign, nonatomic) BOOL isNewArrival;
@property (strong, nonatomic) NSURL *imageURL;
@property (copy, nonatomic) NSString *price;

@end
