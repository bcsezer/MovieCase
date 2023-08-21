//
//  ImageView+Extensions.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(imgUrl: String) {
        self.kf.setImage(with: URL(string: imgUrl))
    }
}
