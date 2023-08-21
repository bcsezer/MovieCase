//
//  FavoritesRepository.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 20.08.2023.
//

import Foundation

struct FavoritesRepository {
    static var shared = FavoritesRepository()
    
    let defaults = UserDefaults.standard
    
    mutating func checkFavoritesIsEmpy() -> Bool {
        return true
    }
}
