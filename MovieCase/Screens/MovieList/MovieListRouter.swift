//
//  MovieListRouter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieListRoutingLogic {
    func routeToFavorites()
    func routeToDetail(selectedId: String)
}

class MovieListRouter: NSObject, MovieListRoutingLogic {
    weak var viewController: MovieListViewController?
    
    // MARK: Routing Logic
    
    func routeToFavorites() {
        
    }
    
    func routeToDetail(selectedId: String) {
        let detailVC = ViewControllerFactory.sharedInstance.makeMovieDetail(selectedId: selectedId)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
