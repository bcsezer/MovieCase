//
//  FavoriteMoviesPresenter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteMoviesPresentationLogic {
    func present(response: FavoriteMovies.Something.Response)
}

class FavoriteMoviesPresenter: FavoriteMoviesPresentationLogic {
    weak var viewController: FavoriteMoviesDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: FavoriteMovies.Something.Response) {
        let viewModel = FavoriteMovies.Something.ViewModel()
        viewController?.display(viewModel: viewModel)
    }
}
