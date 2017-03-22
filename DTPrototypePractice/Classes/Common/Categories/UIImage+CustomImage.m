//
//  UIImage+CustomImage.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/23/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "UIImage+CustomImage.h"

@implementation UIImageView (CustomImage)

- (void)loadImageWith:(NSURL*) url {
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"dataTaskWithRequest error: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:data];
            self.image = image;
        });
    
    }] resume];
}

@end
