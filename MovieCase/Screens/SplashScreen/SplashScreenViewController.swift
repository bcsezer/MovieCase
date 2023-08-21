//
//  SplashScreenViewController.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashScreenDisplayLogic: AnyObject {
    func display(viewModel: SplashScreen.Something.ViewModel)
}

class SplashScreenViewController: UIViewController, SplashScreenDisplayLogic {
    var interactor: SplashScreenBusinessLogic?
    var router: (NSObjectProtocol & SplashScreenRoutingLogic)?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = SplashScreen.Something.Request()
        interactor?.handle(request: request)
    }

    // MARK: Requests

    func display(viewModel: SplashScreen.Something.ViewModel) {
    
    }
}
