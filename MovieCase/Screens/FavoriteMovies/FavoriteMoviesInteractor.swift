//
//  FavoriteMoviesInteractor.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteMoviesBusinessLogic {
    func handle(request: FavoriteMovies.GetData.Request)
    func handle(request: FavoriteMovies.TapRemove.Request)
}

class FavoriteMoviesInteractor: FavoriteMoviesBusinessLogic {
    var presenter: FavoriteMoviesPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: FavoriteMovies.GetData.Request) {
        guard let movies = FavoritesRepository.shared.getMovies() else { return }
        presenter?.present(response: FavoriteMovies.GetData.Response(movies: movies))
    }
    
    func handle(request: FavoriteMovies.TapRemove.Request) {
        FavoritesRepository.shared.delete(id: request.id)
        let movies = FavoritesRepository.shared.getMovies() ?? []
        presenter?.present(response: FavoriteMovies.TapRemove.Response(index: request.index, basket: movies))
    }
}
