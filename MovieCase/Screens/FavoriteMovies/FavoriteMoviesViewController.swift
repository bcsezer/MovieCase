//
//  FavoriteMoviesViewController.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteMoviesDisplayLogic: AnyObject {
    func display(viewModel: FavoriteMovies.GetData.ViewModel)
    func display(viewModel: FavoriteMovies.TapRemove.ViewModel)
}

class FavoriteMoviesViewController: UIViewController, FavoriteMoviesDisplayLogic {
    var interactor: FavoriteMoviesBusinessLogic?
    var router: (NSObjectProtocol & FavoriteMoviesRoutingLogic)?

    @IBOutlet weak var tableView: UITableView!
    private var rows: [FavoriteMovies.Rows] = []
    // MARK: View lifecycle

    private struct Constant {
        static let heightForRow: CGFloat = 104.0
        static let emptyCellHeight: CGFloat = 200.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        FavoritesCell.registerWithNib(to: tableView)
        let request = FavoriteMovies.GetData.Request()
        interactor?.handle(request: request)
    }
    
    // MARK: Requests

    func display(viewModel: FavoriteMovies.GetData.ViewModel) {
        rows = viewModel.cells
        tableView.reloadData()
    }
    
    func display(viewModel: FavoriteMovies.TapRemove.ViewModel) {
        self.rows.remove(at: viewModel.indexPath.row)
        self.tableView.deleteRows(at: [viewModel.indexPath], with: .fade)
        tableView.reloadData()
    }
    
    @IBAction func tapBack(_ sender: Any) {
        router?.routeToBack()
    }
}

extension FavoriteMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier())
        
        switch row {
        case .favoritesCell(let poster, let id, let title):
            guard let cell = cell as? FavoritesCell else { return UITableViewCell() }
            cell.willDisplay(poster: poster, id: id, title: title)
            cell.index = indexPath.row
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = rows[indexPath.row]
        
        switch row {
        case .favoritesCell(_, let id, _):
            router?.routeToDetail(id: id)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = rows[indexPath.row]
        
        switch row {
        case .favoritesCell:
            return Constant.heightForRow
        }
    }
}

extension FavoriteMoviesViewController: FavoritesDelegate {
    func didPressRemove(index: Int, Id: String) {
        interactor?.handle(request: FavoriteMovies.TapRemove.Request(index: index, id: Id))
    }
}
