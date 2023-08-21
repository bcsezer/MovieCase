//
//  String+Extensions.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import Foundation

extension String {
    func stringToFloat() -> CGFloat? {
        guard let doubleValue = Double(self) else {
            return nil
        }
        return CGFloat(doubleValue)
    }
    
    var stringByRemovingWhitespaces: String {
        return components(separatedBy: .whitespaces).joined()
    }
}
