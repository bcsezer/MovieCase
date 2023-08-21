//
//  NetworkManager.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 20.08.2023.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    
    let provider = NetworkProvider<RemoteEndpoint>()
    
    func getList(searchText: String, completion: @escaping ClosureType<MovieListEntity>, failure: @escaping Failure) {
        provider.request(
            .getMovieList(text: searchText),
            model: MovieListEntity.self,
            completion: completion,
            failure: failure
        )
    }
    
    func getDetail(selectedId: String, completion: @escaping ClosureType<MovieDetailEntity>, failure: @escaping Failure) {
        provider.request(
            .getMovieDetail(id: selectedId),
            model: MovieDetailEntity.self,
            completion: completion,
            failure: failure
        )
    }
}
