//
//  RemoteEndpoint.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 20.08.2023.
//

import Foundation

enum RemoteEndpoint {
    case getMovieList(text: String)
}

extension RemoteEndpoint: EndpointType {
    var baseURL: URL {
        guard let url = URL(string: Urls.baseUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getMovieList(let text):
            return text
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getMovieList:
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
        }
    }
}
