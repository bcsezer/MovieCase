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
    var favorites: [MovieDetailEntity] = []
    
    // MARK: Add Movies
    mutating func addProduct(_ movie: MovieDetailEntity?) {
        guard let movie = movie else { return }
        var favorites = getMovies()
        
        favorites?.append(
            MovieDetailEntity(
                title: movie.title,
                year: nil,
                rated: movie.rated,
                released: movie.released,
                runtime: movie.runtime,
                genre: movie.genre,
                director: movie.director,
                writer: movie.writer,
                actors: movie.actors,
                plot: nil,
                language: nil,
                country: movie.country,
                awards: movie.awards,
                poster: movie.poster,
                ratings: nil,
                metascore: movie.metascore,
                imdbRating: movie.imdbRating,
                imdbVotes: movie.imdbVotes,
                imdbID: movie.imdbID,
                type: nil,
                dvd: nil,
                boxOffice: nil,
                production: nil,
                website: nil,
                response: nil
            )
        )
        
        do {
            try defaults.setObj(favorites, forKey: Keys.key)
        } catch {
            print(error.localizedDescription)
        }
        defaults.synchronize()
    }
    
    // MARK: Get Movies
    mutating func getMovies() -> [MovieDetailEntity]? {
        do {
            favorites = try defaults.getObj(forKey: Keys.key, castTo: [MovieDetailEntity].self)
        } catch {
            print(error.localizedDescription)
        }
        
        defaults.synchronize()
        return favorites
    }
    
    mutating func checkMovieIsInFavorites(_ movie: MovieDetailEntity?) -> Bool {
        guard let movie = movie else { return false }
        
        let movies = getMovies()
        
        return movies?.contains(where: {$0.imdbID == movie.imdbID }) ?? true
    }
    
    // MARK: Delete
    mutating func delete(id: String) {
        
        var movies = getMovies()
        
        movies?.removeAll(where: { $0.imdbID == id })
        
        do {
            try defaults.setObj(movies, forKey: Keys.key)
        } catch {
            print(error.localizedDescription)
        }
        
        defaults.synchronize()
    }
}
