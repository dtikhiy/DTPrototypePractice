//
//  ProductResponseParser.m
//  AEViperPrototype
//
//  Created by Dmytro Tykhyi on 3/17/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "JSONProductResponseParser.h"
#import "ProductResponseModel.h"
#import "Constants.h"

@implementation JSONProductResponseParser

- (NSArray*)parseProductsFrom:(NSData*) data {
    if (!data) {
        return nil;
    }
    
    NSMutableArray *products = [NSMutableArray new];
    
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *productJSON in jsonResponse) {
        ProductResponseModel *currentProduct = [[ProductResponseModel alloc] init];
        
        currentProduct.brandName = [productJSON objectForKey:kBrandName];
        currentProduct.colorId = [productJSON objectForKey:kColorId];
        currentProduct.colorIconURL = [productJSON objectForKey:kColorIcon];
        currentProduct.convertedListPrice = [productJSON objectForKey:kConvertedListPrice];
        currentProduct.convertedSalePrice = [productJSON objectForKey:kConvertedSalePrice];
        
        currentProduct.productName = [productJSON objectForKey:kProductName];
        currentProduct.price = [productJSON objectForKey:kJSONProdPrice];
        
        NSArray *imgPath = [NSArray arrayWithArray:[productJSON valueForKey:kJSONProdImagePath]];
        NSURLComponents *urlComponent = [[NSURLComponents alloc] initWithString:imgPath[0]];
        urlComponent.scheme = @"http";
        
        currentProduct.imageURL = urlComponent.URL;
        
        [products addObject:currentProduct];
    }
    
    return products;
}

@end
