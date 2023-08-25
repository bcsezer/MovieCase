//
//  SplashScreenPresenter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashScreenPresentationLogic {
    func present(response: SplashScreen.GetData.Response)
    func present(response: SplashScreen.Error.Response)
}

class SplashScreenPresenter: SplashScreenPresentationLogic {
    weak var viewController: SplashScreenDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: SplashScreen.GetData.Response) {
        let viewModel = SplashScreen.GetData.ViewModel(text: response.text)
        viewController?.display(viewModel: viewModel)
    }
    
    func present(response: SplashScreen.Error.Response) {
        viewController?.display(
            viewModel: SplashScreen.Error.ViewModel(
                text: "İnternet bağlantınızı kontrol edin.",
                title: "Uyarı",
                buttonTitle: "Yeniden dene"
            )
        )
    }
}
