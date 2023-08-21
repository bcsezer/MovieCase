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
}

class MovieDetailInteractor: MovieDetailBusinessLogic {
    var selectedMovieId: String?
    var presenter: MovieDetailPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: MovieDetail.GetDetail.Request) {
        guard let selectedMovieId = selectedMovieId else { return }
        
        NetworkManager.shared.getDetail(selectedId: selectedMovieId) { result in
            self.presenter?.present(response: MovieDetail.GetDetail.Response(data: result))
        } failure: { error in
            print(error)
        }
    }
}
