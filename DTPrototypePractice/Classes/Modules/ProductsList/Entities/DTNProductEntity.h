//
//  DTNProductEntity.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 2/27/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTNProductEntity : NSObject

@property (copy, nonatomic) NSString *productName;
@property (strong, nonatomic) NSURL *imageURL;
@property (copy, nonatomic) NSString *price;

@end
