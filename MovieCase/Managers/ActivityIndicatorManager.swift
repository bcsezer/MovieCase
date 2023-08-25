//
//  ActivityIndicatorManager.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 25.08.2023.
//

import UIKit

struct ActivityManager {
    static func configureActivity(activityIndicator: UIActivityIndicatorView, view: UIView){
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = .black
        activityIndicator.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        activityIndicator.autoresizingMask = [
            .flexibleLeftMargin,
            .flexibleRightMargin,
            .flexibleTopMargin,
            .flexibleBottomMargin
        ]
        view.addSubview(activityIndicator)
    }
}
