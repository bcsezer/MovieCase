//
//  MovieDetailViewController.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieDetailDisplayLogic: AnyObject {
    func display(viewModel: MovieDetail.GetDetail.ViewModel)
}

class MovieDetailViewController: UIViewController, MovieDetailDisplayLogic {
    var interactor: MovieDetailBusinessLogic?
    var router: (NSObjectProtocol & MovieDetailRoutingLogic)?
    
    // MARK: Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var poster: UIImageView!
    @IBOutlet private weak var released: UILabel!
    @IBOutlet private weak var runTime: UILabel!
    @IBOutlet private weak var genre: UILabel!
    @IBOutlet private weak var director: UILabel!
    @IBOutlet private weak var writer: UILabel!
    @IBOutlet private weak var actors: UILabel!
    @IBOutlet private weak var country: UILabel!
    @IBOutlet private weak var awards: UILabel!
    @IBOutlet private weak var metaScore: UILabel!
    @IBOutlet private weak var imdbRate: UILabel!
    @IBOutlet private weak var imdbVot: UILabel!

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.handle(request: MovieDetail.GetDetail.Request())
    }
    
    @IBAction func tapBack(_ sender: Any) {
        router?.routeToBack()
    }
    
    // MARK: Requests

    func display(viewModel: MovieDetail.GetDetail.ViewModel) {
        poster.isHidden = !viewModel.detail.hasImg
        titleLabel.text = viewModel.detail.title
        poster.setImage(imgUrl: viewModel.detail.image)
        released.text = viewModel.detail.releasedDate
        runTime.text = viewModel.detail.runtime
        genre.text = viewModel.detail.genre
        director.text = viewModel.detail.director
        writer.text = viewModel.detail.writer
        actors.text = viewModel.detail.actors
        country.text = viewModel.detail.country
        awards.text = viewModel.detail.awards
        metaScore.text = viewModel.detail.metaScore
        imdbRate.text = viewModel.detail.rating
        imdbVot.text = viewModel.detail.votes
    }
}
