//
//  ViewControllerFactory.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import Foundation
import UIKit

class ViewControllerFactory {
    static let sharedInstance = ViewControllerFactory()
    
    private init() {}
    
    func makeMovieList() -> UIViewController {
        let viewController = MovieListViewController(nibName: "MovieListView", bundle: nil)
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        let router = MovieListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
    
    func makeSplashScreen() -> UIViewController {
        let viewController = SplashScreenViewController(nibName: "SplashScreenView", bundle: nil)
        let interactor = SplashScreenInteractor()
        let presenter = SplashScreenPresenter()
        let router = SplashScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }

    func makeMovieDetail() -> UIViewController {
        let viewController = MovieDetailViewController(nibName: "MovieDetailView", bundle: nil)
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter()
        let router = MovieDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
    
    func makeFavoriteMovies() -> UIViewController {
        let viewController = FavoriteMoviesViewController(nibName: "FavoriteMoviesView", bundle: nil)
        let interactor = FavoriteMoviesInteractor()
        let presenter = FavoriteMoviesPresenter()
        let router = FavoriteMoviesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
