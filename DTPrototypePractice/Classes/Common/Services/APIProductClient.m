//
//  APIClient.m
//  AEViperPrototype
//
//  Created by Dmytro Tykhyi on 3/17/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "APIProductClient.h"
#import "Constants.h"
#import "JSONProductResponseParser.h"

@implementation APIProductClient

- (instancetype)initWithJSONParser:(JSONProductResponseParser *) parser {
    if (self = [super init]) {
        _parser = parser;
    }
    
    return self;
}

- (void)fetchProductsFromServer:(void (^) (NSArray*)) complition {
    NSURL *url = [NSURL URLWithString:kAEOProductsURL];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:kJsonStubUserKey forHTTPHeaderField:@"JsonStub-User-Key"];
    [request setValue:kJsonStubProjectKey forHTTPHeaderField:@"JsonStub-Project-Key"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"dataTaskWithRequest error: %@", error);
            return;
        }
        
        NSArray*products = [self.parser parseProductsFrom:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            complition(products);
        });
    }];
    
    [dataTask resume];
}

@end
