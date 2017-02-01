//
//  DTNProductCell.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTNProduct;

@interface DTNProductCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *arrivalLabel;
@property (weak, nonatomic) IBOutlet UILabel *displaynameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoLabelHeightConstraints;

@property (assign, nonatomic) BOOL isNewArrival;

- (void) updateCellWithProduct:(DTNProduct*) product;

@end
