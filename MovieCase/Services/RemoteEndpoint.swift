//
//  RemoteEndpoint.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 20.08.2023.
//

import Foundation

enum RemoteEndpoint {
    case getMovieList(text: String)
    case getMovieDetail(id: String)
}

extension RemoteEndpoint: EndpointType {
    var baseURL: URL {
        switch self {
        case .getMovieList:
            guard let url = URL(string: Urls.baseUrl) else { fatalError("baseURL could not be configured.")}
            return url
        case .getMovieDetail:
            guard let url = URL(string: Urls.detailUrl) else { fatalError("detailURL could not be configured.")}
            return url
        }
    }
    
    var path: String {
        switch self {
        case .getMovieList(let text):
            return text
        case .getMovieDetail(let id):
            return id
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getMovieList:
            return .get
        case .getMovieDetail:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getMovieList:
            return .requestParameters(
                bodyEncoding: .urlEncoding,
                urlParameters: .none
            )
        case .getMovieDetail:
            return .requestParameters(
                bodyEncoding: .urlEncoding,
                urlParameters: .none
            )
        }
    }
}
