//
//  MovieDetailRouter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailRoutingLogic {
    func routeToSomeWhere()
}

class MovieDetailRouter: NSObject, MovieDetailRoutingLogic {
    weak var viewController: MovieDetailViewController?

    // MARK: Routing Logic
    
    func routeToSomeWhere() {
        
    }
}
