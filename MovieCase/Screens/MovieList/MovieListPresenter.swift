//
//  MovieListPresenter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieListPresentationLogic {
    func present(response: MovieList.Search.Response)
    func present(response: MovieList.CheckFavorites.Response)
}

class MovieListPresenter: MovieListPresentationLogic {
    weak var viewController: MovieListDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: MovieList.Search.Response) {
        var cell: [MovieList.Cell] = []
        
        if let searchData = response.data.search {
            searchData.forEach { Movie in
                cell.append(
                    .movieList(
                        image: Movie.poster ?? "",
                        title: Movie.title ?? ""
                    )
                )
            }
        } else {
            cell.append(.emptyResult)
        }
        
        viewController?.display(viewModel: MovieList.Search.ViewModel(cell: cell))
    }
    
    func present(response: MovieList.CheckFavorites.Response) {
        viewController?.display(
            viewModel: MovieList.CheckFavorites.ViewModel(
                buttonIcon: UIImage(systemName: "star")
            )
        )
    }
}
