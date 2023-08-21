//
//  MovieListModels.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MovieList {
    
    // MARK: Use cases
    
    enum Search {
        struct Request {
            let searchText: String
        }
        struct Response {
            let data: MovieListEntity
        }
        struct ViewModel {
            let cell: [Cell]
        }
    }
    
    enum CheckFavorites {
        struct Request {
        }
        struct Response {
            let hasFavorites: Bool
        }
        struct ViewModel {
            let buttonIcon: UIImage?
        }
    }
    
    enum TapMovie {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum Cell {
        case initalCell
        case movieList(image: String, title: String)
        case emptyResult
        
        func identifier() -> String {
            switch self {
            case .initalCell:
                return WelcomeCell.identifier
            case .movieList:
                return MovieCollectionViewCell.identifier
            case .emptyResult:
                return EmptyResultCell.identifier
            }
        }
    }
}
