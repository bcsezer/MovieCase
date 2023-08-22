//
//  MovieDetailPresenter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailPresentationLogic {
    func present(response: MovieDetail.GetDetail.Response)
    func present(response: MovieDetail.TapFavorites.Response)
    func present(response: MovieDetail.Error.Response)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {
    weak var viewController: MovieDetailDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: MovieDetail.GetDetail.Response) {
        
        viewController?.display(
            viewModel: MovieDetail.GetDetail.ViewModel(
                detail: MovieDetail.MovieDetailModel(
                    title: response.data.title ?? "-",
                    image: response.data.poster ?? "-",
                    releasedDate: response.data.released ?? "-",
                    runtime: response.data.runtime ?? "-",
                    genre: response.data.genre ?? "-",
                    director: response.data.director ?? "-",
                    writer: response.data.writer ?? "-",
                    actors: response.data.actors ?? "-",
                    country: response.data.country ?? "-",
                    awards: response.data.awards ?? "-",
                    metaScore: response.data.metascore ?? "-",
                    rating: response.data.imdbRating ?? "-",
                    votes: response.data.imdbVotes ?? "-",
                    hasImg: response.data.poster != "N/A",
                    hasFav: response.hasFav ? UIImage(systemName: "star.fill") ?? UIImage() : UIImage(systemName: "star") ?? UIImage()
                )
            )
        )
    }
    
    func present(response: MovieDetail.Error.Response) {
        
    }
    
    func present(response: MovieDetail.TapFavorites.Response) {
        viewController?.display(
            viewModel: MovieDetail.TapFavorites.ViewModel(
                text: response.text,
                hasFav: response.hasFav ? UIImage(systemName: "star.fill") ?? UIImage() : UIImage(systemName: "star") ?? UIImage()
            )
        )
    }
}
