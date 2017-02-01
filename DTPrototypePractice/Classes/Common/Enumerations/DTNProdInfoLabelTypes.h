//
//  ProdInfoLabelTypes.h
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/21/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#ifndef ProdInfoLabelTypes_h
#define ProdInfoLabelTypes_h

typedef NS_OPTIONS(NSUInteger, DTNProdInfoLabelTypes) {
    ProdInfoLabelUndefinedType = 0,
    ProdInfoLabelNewArrivalType = 1 << 0,
    ProdInfoLabelOnlineOnlyType = 1 << 1
};

#endif /* ProdInfoLabelTypes_h */
