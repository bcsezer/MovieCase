//
//  FavoriteMoviesRouter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteMoviesRoutingLogic {
    func routeToSomeWhere()
}

class FavoriteMoviesRouter: NSObject, FavoriteMoviesRoutingLogic {
    weak var viewController: FavoriteMoviesViewController?

    // MARK: Routing Logic
    
    func routeToSomeWhere() {
        
    }
}
