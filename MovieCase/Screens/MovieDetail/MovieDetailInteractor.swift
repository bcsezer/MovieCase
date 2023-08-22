//
//  MovieDetailInteractor.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailBusinessLogic {
    func handle(request: MovieDetail.GetDetail.Request)
    func handle(request: MovieDetail.TapFavorites.Request)
}

class MovieDetailInteractor: MovieDetailBusinessLogic {
    var selectedMovieId: String?
    var presenter: MovieDetailPresentationLogic?
    private var movieDetail: MovieDetailEntity?
    
    // MARK: Business Logic

    func handle(request: MovieDetail.GetDetail.Request) {
        guard let selectedMovieId = selectedMovieId else { return }
        
        NetworkManager.shared.getDetail(selectedId: selectedMovieId) { [weak self] result in
            self?.movieDetail = result
            self?.presenter?.present(
                response: MovieDetail.GetDetail.Response(
                    data: result,
                    hasFav: FavoritesRepository.shared.checkMovieIsInFavorites(self?.movieDetail)
                )
            )
        } failure: { error in
            self.presenter?.present(response: MovieDetail.Error.Response(text: error))
        }
    }
    
    func handle(request: MovieDetail.TapFavorites.Request) {
        let isInFavs = FavoritesRepository.shared.checkMovieIsInFavorites(self.movieDetail)
        
        if !isInFavs {
            FavoritesRepository.shared.addProduct(self.movieDetail)
            presenter?.present(
                response: MovieDetail.TapFavorites.Response(
                    text: "Film Favorilere Eklendi.",
                    hasFav: !isInFavs
                )
            )
        } else {
            presenter?.present(
                response: MovieDetail.TapFavorites.Response(
                    text: "Film daha önce favorilere eklendi ;)",
                    hasFav: isInFavs
                )
            )
        }
    }
}
