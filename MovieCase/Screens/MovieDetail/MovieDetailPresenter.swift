//
//  MovieDetailPresenter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailPresentationLogic {
    func present(response: MovieDetail.Something.Response)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {
    weak var viewController: MovieDetailDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: MovieDetail.Something.Response) {
        let viewModel = MovieDetail.Something.ViewModel()
        viewController?.display(viewModel: viewModel)
    }
}
