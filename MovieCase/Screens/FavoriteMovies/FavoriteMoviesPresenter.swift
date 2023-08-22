//
//  FavoriteMoviesPresenter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteMoviesPresentationLogic {
    func present(response: FavoriteMovies.GetData.Response)
    func present(response: FavoriteMovies.TapRemove.Response)
}

class FavoriteMoviesPresenter: FavoriteMoviesPresentationLogic {
    weak var viewController: FavoriteMoviesDisplayLogic?
    
    // MARK: Presentation Logic
    
    func present(response: FavoriteMovies.GetData.Response) {
        var cells: [FavoriteMovies.Rows] = []
        
        response.movies.forEach { movie in
            cells.append(
                .favoritesCell(
                    poster: movie.poster ?? "",
                    id: movie.imdbID ?? "",
                    title: movie.title ?? ""
                )
            )
        }
        
        viewController?.display(viewModel: FavoriteMovies.GetData.ViewModel(cells: cells))
    }
    
    func present(response: FavoriteMovies.TapRemove.Response) {
        let indexPath = IndexPath(row: response.index, section: 0)
        viewController?.display(
            viewModel: FavoriteMovies.TapRemove.ViewModel(
                indexPath: indexPath
            )
        )
    }
}
