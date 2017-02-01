//
//  ViewController.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "MainViewController.h"
#import "ProductsCollectionViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.view addGestureRecognizer: tapRecognizer];
}

-(void) handleTapGesture: (UITapGestureRecognizer*) sender {
    ProductsCollectionViewController *productsView = [[ProductsCollectionViewController alloc] initWithNibName: @"ProductsCollectionViewController" bundle:nil];
    
    [self showViewController:productsView sender:self];
}

@end
