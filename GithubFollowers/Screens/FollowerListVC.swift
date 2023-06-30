//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by James Best on 27/06/2023.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad things happened", message: errorMessage!.rawValue, buttonTitle: "OK")
                return
            }
            
            print("Followers.count =  \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
