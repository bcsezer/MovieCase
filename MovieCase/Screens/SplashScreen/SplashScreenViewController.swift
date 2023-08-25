//
//  SplashScreenViewController.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashScreenDisplayLogic: AnyObject {
    func display(viewModel: SplashScreen.GetData.ViewModel)
    func display(viewModel: SplashScreen.Error.ViewModel)
}

class SplashScreenViewController: UIViewController, SplashScreenDisplayLogic {
    var interactor: SplashScreenBusinessLogic?
    var router: (NSObjectProtocol & SplashScreenRoutingLogic)?

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    private var actIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let alertManager = AlertManager()
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        alertManager.delegate = self
        configureIndicator()
        interactor?.handle(request: SplashScreen.GetData.Request())
    }
    
    private func configureIndicator() {
        ActivityManager.configureActivity(activityIndicator: actIndicator, view: loadingView)
        actIndicator.startAnimating()
    }
    
    // MARK: Requests

    func display(viewModel: SplashScreen.GetData.ViewModel) {
        self.textLabel.text = viewModel.text
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            self.actIndicator.stopAnimating()
            self.router?.routeToHome()
        })
    }
    
    func display(viewModel: SplashScreen.Error.ViewModel) {
        self.actIndicator.stopAnimating()
        alertManager.showAlert(
            view: self,withTitle: viewModel.title,
            withMessage: viewModel.text,
            buttontitle: viewModel.buttonTitle)
    }
}

extension SplashScreenViewController: AlertDelegate {
    func didPressOk() {
        self.configureIndicator()
        interactor?.handle(request: SplashScreen.GetData.Request())
    }
}
