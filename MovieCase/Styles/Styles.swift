//
//  Styles.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import UIKit

enum Font {
    static func withSize(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}

struct TextStyle {
    let font: UIFont
    let color: UIColor
}

struct ViewStyle {
    struct LayerStyle {
        struct BorderStyle {
            let color: UIColor
            let width: CGFloat
        }
        
        let masksToBounds: Bool?
        let cornerRadius: CGFloat?
        let borderStyle: BorderStyle?
    }
    
    let backgroundColor: UIColor?
    let tintColor: UIColor? = .clear
    let layerStyle: LayerStyle?
}
