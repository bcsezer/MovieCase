//
//  AlertManager.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import UIKit

protocol AlertDelegate: AnyObject {
    func didPressOk()
}

class AlertManager {
    weak var delegate: AlertDelegate?
    
    func showAlert(view: UIViewController, withTitle title: String? = "", withMessage message: String, buttontitle: String? = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: buttontitle, style: .default, handler: { _ in
            self.delegate?.didPressOk()
        })
        alert.addAction(ok)
        
        DispatchQueue.main.async(execute: {
            view.present(alert, animated: true)
        })
    }
}
