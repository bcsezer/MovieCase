//
//  MovieDetailInteractor.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailBusinessLogic {
    func handle(request: MovieDetail.Something.Request)
}

class MovieDetailInteractor: MovieDetailBusinessLogic {
    var presenter: MovieDetailPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: MovieDetail.Something.Request) {
        let response = MovieDetail.Something.Response()
        presenter?.present(response: response)
    }
}
