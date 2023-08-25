//
//  SplashScreenModels.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SplashScreen {
    
    // MARK: Use cases
    enum GetData {
        struct Request {
        }
        struct Response {
            let text: String
        }
        struct ViewModel {
            let text: String
        }
    }
    
    enum Error {
        struct Response {
        }
        struct ViewModel {
            let text: String
            let title: String
            let buttonTitle: String
        }
    }
}
