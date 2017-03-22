//
//  DTNProdListWireframe.m
//  DTPrototypePractice
//
//  Created by Dmytro Tykhyi on 1/29/17.
//  Copyright © 2017 Dmytro Tykhyi. All rights reserved.
//

#import "DTNProdListWireframe.h"
#import "DTNProductListVC.h"
#import "DTNProdListPresenter.h"
#import "DTNProdListInteractor.h"

@implementation DTNProdListWireframe

#pragma mark - Public

+ (void)presentScreenFromViewController:(UIViewController *)viewController {
    UIViewController *presentingViewController = [self setupViewController];
    [viewController showViewController:presentingViewController sender:viewController];
}

#pragma mark - Private

+ (UIViewController *)setupViewController {
    DTNProdListPresenter *presenter = [DTNProdListPresenter new];
    DTNProdListInteractor *interactor = [DTNProdListInteractor new];
    DTNProdListWireframe *wireframe = [DTNProdListWireframe new];
    
    DTNProductListVC *view = [[DTNProductListVC alloc] initWithNibName:NSStringFromClass([DTNProductListVC class]) bundle:nil];
    view.presenter = presenter;
    
    presenter.view = view;
    presenter.wireframe = wireframe;
    presenter.interactor = interactor;
    
    interactor.presenter = presenter;
    
    wireframe.view = view;
    
    return view;
}

@end
