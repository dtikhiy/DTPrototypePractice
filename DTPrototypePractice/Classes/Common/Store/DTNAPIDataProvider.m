//
//  DTNAPIDataProvider.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/26/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNAPIDataProvider.h"
#import "DTNProduct.h"

@implementation DTNAPIDataProvider

static NSString *const kAEOProductsURL = @"http://jsonstub.com/products";
static NSString *const kJsonStubUserKey = @"cf9fb957-a5cc-4ae0-bab5-c88114464ec3";
static NSString *const kJsonStubProjectKey = @"f5f9eee9-e955-4b8a-9a9d-de5e486e8b17";

static NSString *const kJSONProdName = @"displayname";
static NSString *const kJSONProdAttributes = @"prodAttributes";
static NSString *const kJSONProdAttrNewArrival = @"newArrival";
static NSString *const kJSONProdImagePath = @"imgPath";
static NSString *const kJSONProdPrice = @"listprice";

/*!
 @brief Implementation for the DTNProductsFetching protocol method
 */

-(void)fetchProductsFromStorage:(void (^)(NSArray*))complition {
    
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:kAEOProductsURL];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:kJsonStubUserKey forHTTPHeaderField:@"JsonStub-User-Key"];
    [request setValue:kJsonStubProjectKey forHTTPHeaderField:@"JsonStub-Project-Key"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
        
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            for (NSDictionary *dict in json) {
                DTNProduct *currProduct = [[DTNProduct alloc] init];
                currProduct.prodName = [dict valueForKey:kJSONProdName];
                
                NSDictionary *attributes = [NSDictionary dictionaryWithDictionary:[dict valueForKey:kJSONProdAttributes]];
                NSString *isNewArrival = [attributes valueForKey:kJSONProdAttrNewArrival];
                currProduct.isNewArrival = [isNewArrival boolValue];
                
                currProduct.price = [dict valueForKey:kJSONProdPrice];
                
                [products addObject:currProduct];
                NSArray *imgPath = [NSArray arrayWithArray:[dict valueForKey:kJSONProdImagePath]];
                NSURLComponents *urlComponent = [[NSURLComponents alloc] initWithString:imgPath[0]];
                urlComponent.scheme = @"http";
        
                currProduct.imageURL = urlComponent.URL;
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                complition(products);
            });
        } 
    }];
    
    [dataTask resume];
}

@end
