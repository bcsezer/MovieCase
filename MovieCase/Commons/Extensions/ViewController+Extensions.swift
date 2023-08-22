//
//  ViewController+Extensions.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 19.08.2023.
//

import UIKit

extension UIViewController {
    
    func showAlert(withTitle title: String? = "", withMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Tamam", style: .default, handler: { action in })
        alert.addAction(ok)
        
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
