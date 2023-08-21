//
//  FavoriteMoviesInteractor.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteMoviesBusinessLogic {
    func handle(request: FavoriteMovies.Something.Request)
}

class FavoriteMoviesInteractor: FavoriteMoviesBusinessLogic {
    var presenter: FavoriteMoviesPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: FavoriteMovies.Something.Request) {
        let response = FavoriteMovies.Something.Response()
        presenter?.present(response: response)
    }
}
