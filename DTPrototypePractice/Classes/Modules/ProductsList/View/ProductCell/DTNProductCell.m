//
//  DTNProductCell.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProductCell.h"
#import "DTNProduct.h"
#import "UIImage+CustomImage.h"

@implementation DTNProductCell

@synthesize infoLabelHeightConstraints;


-(void) showProductLabel:(BOOL) option {
    if(option) {
        self.infoLabelHeightConstraints.constant = 17;
    } else {
        self.infoLabelHeightConstraints.constant = 0;
    }
}

- (void) updateCellWithProductData:(DTNProduct*) product {
    self.priceLabel.text = product.price;
    self.displaynameLabel.text = product.prodName;
    [self.productImage loadImageWith:product.imageURL];
    self.isNewArrival = product.isNewArrival;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
