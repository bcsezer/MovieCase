//
//  MovieDetailModels.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MovieDetail {
    
    struct MovieDetailModel {
        let title: String
        let image: String
        let releasedDate: String
        let runtime: String
        let genre: String
        let director: String
        let writer: String
        let actors: String
        let country: String
        let awards: String
        let metaScore: String
        let rating: String
        let votes: String
        let hasImg: Bool
        let hasFav: UIImage
    }
    
    // MARK: Use cases
    enum GetDetail {
        struct Request {
        }
        struct Response {
            let data: MovieDetailEntity
            let hasFav: Bool
        }
        struct ViewModel {
            let detail: MovieDetailModel
        }
    }
    
    enum Error {
        struct Response {
            let text: String
        }
        struct ViewModel {
            let text: String
        }
    }
    
    enum TapFavorites {
        struct Request {
        }
        struct Response {
            let text: String
            let hasFav: Bool
        }
        struct ViewModel {
            let text: String
            let hasFav: UIImage
        }
    }
}
