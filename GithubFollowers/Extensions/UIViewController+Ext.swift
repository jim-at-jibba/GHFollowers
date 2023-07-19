//
//  UIViewController+Ext.swift
//  GithubFollowers
//
//  Created by James Best on 28/06/2023.
//

import UIKit

extension UIViewController {
    // You are not allowed to show UI elements from the background thread
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        // This sets it to the main thread
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
