//
//  FavoriteMoviesRouter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteMoviesRoutingLogic {
    func routeToDetail(id: String)
    func routeToBack()
}

class FavoriteMoviesRouter: NSObject, FavoriteMoviesRoutingLogic {
    weak var viewController: FavoriteMoviesViewController?

    // MARK: Routing Logic
    
    func routeToBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func routeToDetail(id: String) {
        let detailVC = ViewControllerFactory.sharedInstance.makeMovieDetail(selectedId: id)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
