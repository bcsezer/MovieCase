//
//  SplashScreenRouter.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashScreenRoutingLogic {
    func routeToSomeWhere()
}

class SplashScreenRouter: NSObject, SplashScreenRoutingLogic {
    weak var viewController: SplashScreenViewController?

    // MARK: Routing Logic
    
    func routeToSomeWhere() {
        
    }
}
