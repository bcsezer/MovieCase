//
//  MovieCollectionViewCell.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import UIKit
import Kingfisher

protocol MovieCellDelegate: AnyObject {
    func didTapMovie(id: String)
}

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"
    
    @IBOutlet private weak var moviePoster: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    weak var delegate: MovieCellDelegate?
    private var selectedId: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        apperance()
        addGesture()
    }
    
    func willDisplay(poster: String, title: String, id: String?) {
        self.moviePoster.setImage(imgUrl: poster)
        self.movieTitle.text = title
        self.selectedId = id
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        moviePoster.addGestureRecognizer(gesture)
    }
    
    @objc func tapImage() {
        guard let selectedId = selectedId else { return }
        delegate?.didTapMovie(id: selectedId)
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
