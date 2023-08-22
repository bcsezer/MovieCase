//
//  FavoriteMoviesModels.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum FavoriteMovies {
    
    // MARK: Use cases
    enum GetData {
        struct Request {
        }
        struct Response {
            let movies: [MovieDetailEntity]
        }
        struct ViewModel {
            let cells: [FavoriteMovies.Rows]
        }
    }
    
    enum TapRemove {
        struct Request {
            let index: Int
            let id: String
        }
        struct Response {
            let index: Int
            let basket: [MovieDetailEntity]
        }
        struct ViewModel {
            let indexPath: IndexPath
        }
    }
    
    enum Rows {
        case favoritesCell(poster: String, id: String, title: String)
        
        func identifier() -> String {
            switch self {
            case .favoritesCell:
                return FavoritesCell.identifier
            }
        }
    }
}
