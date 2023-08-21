//
//  MovieListRouter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieListRoutingLogic {
    func routeToSomeWhere()
}

class MovieListRouter: NSObject, MovieListRoutingLogic {
    weak var viewController: MovieListViewController?

    // MARK: Routing Logic
    
    func routeToSomeWhere() {
        
    }
}
