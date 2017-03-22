//
//  ProductResponseModel.h
//  AEViperPrototype
//
//  Created by Dmytro Tykhyi on 3/17/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductResponseModel : NSObject

@property (copy, nonatomic) NSString *brandName;
@property (copy, nonatomic) NSNumber *colorId;
@property (copy, nonatomic) NSString *colorIconURL;
@property (copy, nonatomic) NSDecimalNumber *convertedListPrice;
@property (copy, nonatomic) NSDecimalNumber *convertedSalePrice;

@property (copy, nonatomic) NSString *productName;
@property (copy, nonatomic) NSURL *imageURL;
@property (copy, nonatomic) NSString *price;


@end
