//
//  EndpointType.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 20.08.2023.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}
