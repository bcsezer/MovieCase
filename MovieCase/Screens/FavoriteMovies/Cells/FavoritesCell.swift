//
//  FavoritesCell.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 22.08.2023.
//

import UIKit
import Kingfisher

protocol FavoritesDelegate: AnyObject {
    func didPressRemove(index: Int, Id: String)
}

class FavoritesCell: UITableViewCell {
    static let identifier = "FavoritesCell"
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var poster: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    private var id: String?
    var index: Int?
    weak var delegate: FavoritesDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        apperance()
    }
    
    func willDisplay(poster: String, id: String, title: String) {
        self.id = id
        self.movieTitle.text = title
        self.poster.setImage(imgUrl: poster)
    }
    
    @IBAction func tapDelete(_ sender: UIButton) {
        guard let index = index, let id = id else { return }
        delegate?.didPressRemove(index: index, Id: id)
    }
    
    private func apperance() {
        containerView.style(
            style: ViewStyle(
                backgroundColor: .white,
                layerStyle: ViewStyle.LayerStyle(
                    masksToBounds: true, cornerRadius: 4,
                    borderStyle: ViewStyle.LayerStyle.BorderStyle(
                        color: Colors.loodos_blue,
                        width: 1
                    )
                )
            )
        )
    }
}
