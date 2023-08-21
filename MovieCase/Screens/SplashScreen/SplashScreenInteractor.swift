//
//  SplashScreenInteractor.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashScreenBusinessLogic {
    func handle(request: SplashScreen.Something.Request)
}

class SplashScreenInteractor: SplashScreenBusinessLogic {
    var presenter: SplashScreenPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: SplashScreen.Something.Request) {
        let response = SplashScreen.Something.Response()
        presenter?.present(response: response)
    }
}
