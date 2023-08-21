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
}

class MovieListInteractor: MovieListBusinessLogic {
    var presenter: MovieListPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: MovieList.Search.Request) {
        NetworkManager.shared.getList(searchText: removeBlanks(text: request.searchText)) { result in
            self.presenter?.present(response: MovieList.Search.Response(data: result))
        } failure: { error in
            print(error)
        }
    }
    
    func handle(request: MovieList.CheckFavorites.Request) {
        
    }
    
    private func removeBlanks(text: String) -> String {
        return text.stringByRemovingWhitespaces
    }
}
