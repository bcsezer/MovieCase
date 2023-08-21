//
//  MovieDetailViewController.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailDisplayLogic: AnyObject {
    func display(viewModel: MovieDetail.Something.ViewModel)
}

class MovieDetailViewController: UIViewController, MovieDetailDisplayLogic {
    var interactor: MovieDetailBusinessLogic?
    var router: (NSObjectProtocol & MovieDetailRoutingLogic)?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = MovieDetail.Something.Request()
        interactor?.handle(request: request)
    }

    // MARK: Requests

    func display(viewModel: MovieDetail.Something.ViewModel) {
    
    }
}
