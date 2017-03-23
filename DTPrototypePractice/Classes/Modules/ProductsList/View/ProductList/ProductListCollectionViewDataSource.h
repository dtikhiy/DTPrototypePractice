//
//  ProductListCollectionViewDataSource.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 3/22/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProductListCollectionViewDataSource : NSObject<UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *content;

@end
