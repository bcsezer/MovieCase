//
//  FavoriteMoviesViewController.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteMoviesDisplayLogic: AnyObject {
    func display(viewModel: FavoriteMovies.Something.ViewModel)
}

class FavoriteMoviesViewController: UIViewController, FavoriteMoviesDisplayLogic {
    var interactor: FavoriteMoviesBusinessLogic?
    var router: (NSObjectProtocol & FavoriteMoviesRoutingLogic)?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = FavoriteMovies.Something.Request()
        interactor?.handle(request: request)
    }

    // MARK: Requests

    func display(viewModel: FavoriteMovies.Something.ViewModel) {
    
    }
}
