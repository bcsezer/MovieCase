//
//  MovieListInteractor.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieListBusinessLogic {
    func handle(request: MovieList.Search.Request)
    func handle(request: MovieList.CheckFavorites.Request)
    func handle(request: MovieList.TapMovie.Request)
}

class MovieListInteractor: MovieListBusinessLogic {
    var presenter: MovieListPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: MovieList.Search.Request) {
        guard
            let searchText = request.searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        else { return }
        
        NetworkManager.shared.getList(searchText: removeBlanks(text: searchText)) { result in
            self.presenter?.present(response: MovieList.Search.Response(data: result))
        } failure: { error in
            print(error)
        }
    }
    
    func handle(request: MovieList.CheckFavorites.Request) {
        presenter?.present(
            response: MovieList.CheckFavorites.Response(
                hasFavorites: !(FavoritesRepository.shared.getMovies()?.isEmpty ?? false)
            )
        )
    }
    
    func handle(request: MovieList.TapMovie.Request) {
        presenter?.present(response: MovieList.TapMovie.Response(selectedId: request.selectedId))
    }
    
    private func removeBlanks(text: String) -> String {
        return text.stringByRemovingWhitespaces
    }
}
