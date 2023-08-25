//
//  SplashScreenRouter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashScreenRoutingLogic {
    func routeToHome()
}

class SplashScreenRouter: NSObject, SplashScreenRoutingLogic, UIGestureRecognizerDelegate {
    weak var viewController: SplashScreenViewController?

    // MARK: Routing Logic
    
    func routeToHome() {
        let view = ViewControllerFactory.sharedInstance.makeMovieList()
        let myKeyWindow: UIWindow? = UIApplication.shared.keyWindowInConnectedScenes
        let navMovie = UINavigationController(rootViewController: view)
        navMovie.isNavigationBarHidden = true
        navMovie.interactivePopGestureRecognizer?.delegate = self
        navMovie.interactivePopGestureRecognizer?.isEnabled = true
        myKeyWindow?.rootViewController = navMovie
    }
}
