//
//  SplashScreenPresenter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashScreenPresentationLogic {
    func present(response: SplashScreen.Something.Response)
}

class SplashScreenPresenter: SplashScreenPresentationLogic {
    weak var viewController: SplashScreenDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: SplashScreen.Something.Response) {
        let viewModel = SplashScreen.Something.ViewModel()
        viewController?.display(viewModel: viewModel)
    }
}
