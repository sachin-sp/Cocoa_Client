//
//  FeedViewController.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 11/04/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, Storyboardable {
    
    // MARK: - Storyboardable
    
    static var storyboardName: String {
        return "Feed"
    }
    
    // MARK: - Properties

    var viewModel: FeedViewModel?
    
    // MARK: -
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            // Configure Collection View
            collectionView.delegate = self
            collectionView.dataSource = self
            
            // Create Collection View Layout
            collectionView.collectionViewLayout = createCollectionViewLayout()
            
            // Register Episode Collection View Cell
            let xib = UINib(nibName: EpisodeCollectionViewCell.nibName, bundle: .main)
            collectionView.register(xib, forCellWithReuseIdentifier: EpisodeCollectionViewCell.reuseIdentifier)
        }
    }
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Set Title
        title = "Feed"
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View Model
        setupViewModel()
    }
    
    // MARK: - Helper Methods
    
    private func setupViewModel() {
        // Install Handler
        viewModel?.episodesDidChange = { [weak self] in
            // Update Collection View
            self?.collectionView.reloadData()
        }
    }
    
    // MARK: -

    private func createCollectionViewLayout() -> UICollectionViewLayout {
        // Define Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200.0))
        
        // Create Item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Define Group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200.0))
        
        // Create Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [ item ])
        
        // Create Section
        let section = NSCollectionLayoutSection(group: group)

        // Configure Section
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        
        return UICollectionViewCompositionalLayout(section: section)
    }

}

extension FeedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfEpisodes ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Fetch Presentable
        guard let presentable = viewModel?.presentable(for: indexPath.item) else {
            fatalError("No Presentable Available")
        }
        
        // Dequeue Episode Collection View Cell
        let cell: EpisodeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        // Configure Cell
        cell.configure(with: presentable)
        
        return cell
    }
    
}

extension FeedViewController: UICollectionViewDelegate {}
