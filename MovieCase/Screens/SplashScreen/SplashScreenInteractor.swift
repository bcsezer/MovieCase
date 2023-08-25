//
//  SplashScreenInteractor.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashScreenBusinessLogic {
    func handle(request: SplashScreen.GetData.Request)
}

class SplashScreenInteractor: SplashScreenBusinessLogic {
    var presenter: SplashScreenPresentationLogic?
    
    // MARK: Business Logic
    
    func handle(request: SplashScreen.GetData.Request) {
        if NetworkMonitor.shared.isConnected {
            let text = RemoteConfigManager.value(for: RemoteConfigKey.splashLabel)
            let response = SplashScreen.GetData.Response(text: text ?? "")
            presenter?.present(response: response)
        } else {
            presenter?.present(response: SplashScreen.Error.Response())
        }
    }
}
