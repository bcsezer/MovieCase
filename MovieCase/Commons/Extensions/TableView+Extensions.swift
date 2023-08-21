//
//  TableView+Extensions.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import UIKit

extension UITableViewCell {
    
    /**
     Returns class name as identifier.
     - returns: Identifier which can be used instead of `reuseIdentifier`.
     */
    static func identifier() -> String {
        String(describing: self)
    }
    
    /**
     Registers cell automatically to given tableview.
     - parameter tableView: `UITableView`
     */
    static func registerWithNib(to tableView: UITableView?) {
        tableView?.register(UINib(nibName: identifier(), bundle: nil), forCellReuseIdentifier: identifier())
    }
}
