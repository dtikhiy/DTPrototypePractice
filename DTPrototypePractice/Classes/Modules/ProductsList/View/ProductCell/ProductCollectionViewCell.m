//
//  ProductCollectionViewCell.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "ProductCollectionViewCell.h"
#import "DTNProduct.h"

@implementation ProductCollectionViewCell

@synthesize infoLabelHeightConstraints;

// Set newArrival label
-(void)setIsNewArrival:(BOOL)isNewArrival {
    if (isNewArrival) {
        self.self.arrivalLabel.text = @"NEW";
        self.infoLabelHeightConstraints.constant = 17;
    } else {
        self.infoLabelHeightConstraints.constant = 0;
    }
}

- (void) updateCellWithProduct:(DTNProduct*) product {
    self.priceLabel.text = product.price;
    self.displaynameLabel.text = product.prodName;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
