//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by James Best on 10/07/2023.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let placeholderImage = UIImage(named: "avatar-placeholder")
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true // sets corner radius on the image as well
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
