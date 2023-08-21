//
//  MovieListViewController.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieListDisplayLogic: AnyObject {
    func display(viewModel: MovieList.Search.ViewModel)
    func display(viewModel: MovieList.CheckFavorites.ViewModel)
    func display(viewModel: MovieList.TapMovie.ViewModel)
}

class MovieListViewController: UIViewController, MovieListDisplayLogic {
    var interactor: MovieListBusinessLogic?
    var router: (NSObjectProtocol & MovieListRoutingLogic)?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            self.searchBar.backgroundImage = UIImage()
            self.searchBar.delegate = self
        }
    }
    
    private var rows: [MovieList.Cell] = [.initalCell]
    
    private struct Constant {
        static let extraSpacesForCell: CGFloat = 24.0
        static let cellHeight: CGFloat = 116.0
        static let cellEdges: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        static let minimumLineSpacingForSection: CGFloat = 8.0
        static let minimumInteritemSpacingForSectionAt: CGFloat = 1.0
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        collectionView.delegate = self
        collectionView.dataSource = self
        interactor?.handle(request: MovieList.CheckFavorites.Request())
    }
    
    private func registerCells() {
        EmptyResultCell.registerWithNib(to: collectionView)
        MovieCollectionViewCell.registerWithNib(to: collectionView)
        WelcomeCell.registerWithNib(to: collectionView)
    }
    
    // MARK: Requests
    
    func display(viewModel: MovieList.Search.ViewModel) {
        self.rows = viewModel.cell
        collectionView.reloadData()
    }
    
    func display(viewModel: MovieList.CheckFavorites.ViewModel) {
        collectionView.reloadData()
        favoritesButton.setImage(viewModel.buttonIcon, for: .normal)
    }
    
    func display(viewModel: MovieList.TapMovie.ViewModel) {
        router?.routeToDetail(selectedId: viewModel.selectedId)
    }
    
    @IBAction func tapFavorites(_ sender: Any) {
        
    }
}

extension MovieListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        interactor?.handle(request: MovieList.Search.Request(searchText: text))
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = rows[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: data.identifier(), for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let row = rows[indexPath.row]
        
        switch row {
        case .emptyResult:
            break
        case .initalCell:
            break
        case .movieList(let image, let title, let id):
            guard let cell = cell as? MovieCollectionViewCell else { return }
            cell.willDisplay(poster: image, title: title, id: id)
            cell.delegate = self
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let row = rows[indexPath.row]
        
        switch row {
        case .emptyResult, .initalCell:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        case .movieList:
            return CGSize(
                width: (collectionView.frame.width - Constant.extraSpacesForCell) / 2,
                height: Constant.cellHeight
            )
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        Constant.cellEdges
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constant.minimumLineSpacingForSection
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constant.minimumInteritemSpacingForSectionAt
    }
}

extension MovieListViewController: MovieCellDelegate {
    func didTapMovie(id: String) {
        interactor?.handle(request: MovieList.TapMovie.Request(selectedId: id))
    }
}
