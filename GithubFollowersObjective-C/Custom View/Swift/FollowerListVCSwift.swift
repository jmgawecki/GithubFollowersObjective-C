//
//  FollowerListVCSwift.swift
//  GithubFollowersObjective-C
//
//  Created by Jakub Gawecki on 08/05/2021.
//

import UIKit

class FollowerListVCSwift: UIViewController {
    // MARK: - Enumeration
    
    enum Section {
        case main
    }
    
    // MARK: - Properties
    var followers:          [Follower]!
    var filteredFollowers:  [Follower] = []
    
    var page                = Int(1)
    var username:           String!
    
    var hasMoreFollowers        = true
    var isSearching             = false
    var isLoadingMoreFollowers  = false
    
    var collectionView:     UICollectionView!
    var dataSource:         UICollectionViewDiffableDataSource<Section,Follower>!
    var snapShot:           NSDiffableDataSourceSnapshot<Section, Follower>!
    
    let networkManager = NetworkManager.sharedManager()
    
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureCollectionView()
        configureDataSource()
        updateDataOnCollection()
    }
    
    
    // MARK: - Initializer
    
    @objc init(username: String, followers: [NSMutableArray]) {
        super.init(nibName: nil, bundle: nil)
        self.username   = username
        self.followers  = (followers as! [Follower])
        title = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - VC Configuration
    
    
    private func configureVC() {
        view.backgroundColor                                    = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    // MARK: - Collection View Configuration
    
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
    }
    
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<FollowerCell,Follower> { (cell, indexPath, follower) in
            cell.setOn(follower)
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> FollowerCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: follower)
        })
    }
    
    
    private func updateDataOnCollection() {
        snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers, toSection: .main)
        DispatchQueue.main.async {
            self.dataSource.apply(self.snapShot, animatingDifferences: true)
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension FollowerListVCSwift: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers, !isLoadingMoreFollowers else { return }
            page += 1
            // get followers
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray     = isSearching ? filteredFollowers : followers
        let follower        = activeArray[indexPath.item]
        
        let destVC          = UserInfoVC()
        destVC.username     = follower.login
        destVC.delegate     = self
        let navController   = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}
