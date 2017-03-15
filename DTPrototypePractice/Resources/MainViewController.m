//
//  MainViewController.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/20/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "MainViewController.h"
#import "DTNProductListVC.h"
#import "ProductListModuleAssembler.h"

@interface MainViewController ()

@property (strong, nonatomic) ProductListModuleAssembler *prodListModule;

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.view addGestureRecognizer: tapRecognizer];
}

-(void) handleTapGesture: (UITapGestureRecognizer*) sender {
    
    DTNProductListVC *productsView = [[DTNProductListVC alloc] initWithNibName:NSStringFromClass([DTNProductListVC class]) bundle:nil];
    self.prodListModule = [[ProductListModuleAssembler alloc] initWithVC:productsView];
    [self showViewController:productsView sender:self];
}

@end
