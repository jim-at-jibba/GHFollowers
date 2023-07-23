//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by James Best on 27/06/2023.
//

import UIKit

class FollowerListVC: UIViewController {
    
    // Enum are automatically hashable
    enum Section {
        case main
    }
    
    var username: String!
    var followers: [Follower] = []
    var page = 1
    var hasMoreFollowers = true
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers(username: username, page: page)
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        // navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self // this uses the extension below
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    
    
    func getFollowers(username: String, page: Int) {
        showLoadingView()
        // making this [weak self] removes the strong reference between self and the network manager that may cause
        // a memory leak
        // [weak self] <- is called a capture list
        // ARC (Automatic reference counting) counts strong references between objects
        // https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            // Adding this guard means we dont have to unwrap the self var with a ?
            guard let self = self else {return}
            // use this instead of todo comments
            //#warning("Call dismiss")
            self.dismissLoadingView()
            switch result {
            case .success(let followers):
                if followers.count < 20 {
                    self.hasMoreFollowers = false
                }
                print("Followers.count =  \(followers.count)")
                // concats the arrays
                self.followers.append(contentsOf: followers)
                
                if self.followers.isEmpty {
                    let message = "This user does not have any followers. Go follow them 😊."
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: message, in: self.view)
                        return
                    }
                }
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad things happened", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    // this controls how the diffable data works. The secion and follow
    // are hashable so the diffing is possible
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

// When conforming to new delegate put in extension
// Delegate is a watcher. Its waiting for an action then it will act.
extension FollowerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page += 1
            getFollowers(username: username, page: page)
        }
    }
}
