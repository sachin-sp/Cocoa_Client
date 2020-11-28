//
//  LibraryViewController.swift
//  Cocoacasts
//
//  Created by Bart Jacobs on 11/04/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, Storyboardable {
    
    // MARK: - Storyboardable
    
    static var storyboardName: String {
        return "Library"
    }
    
    // MARK: - Properties

    var viewModel: LibraryViewModel?

    // MARK: -
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            // Configure Collection View
            collectionView.delegate = self
            collectionView.dataSource = self
            
            // Register Episode Collection View Cell
            let episodeXib = UINib(nibName: EpisodeCollectionViewCell.nibName, bundle: .main)
            let categoryXib = UINib(nibName: CategoryCollectionViewCell.nibName, bundle: .main)
            let collectionXib = UINib(nibName: CollectionCollectionViewCell.nibName, bundle: .main)
            collectionView.register(episodeXib, forCellWithReuseIdentifier: EpisodeCollectionViewCell.reuseIdentifier)
            collectionView.register(categoryXib, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
            collectionView.register(collectionXib, forCellWithReuseIdentifier: CollectionCollectionViewCell.reuseIdentifier)

        }
    }

    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Set Title
        title = "Library"
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View Model
        setupViewModel()
        
        // Reload Data
        viewModel?.reloadData()
    }
    
    // MARK: - Helper Methods
    
    private func setupViewModel() {
        // Install Handler
        viewModel?.librarySectionsDidChange = { [weak self] in
            // Update Collection View
            self?.collectionView.reloadData()
        }
    }

}

extension LibraryViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else {
            fatalError("No View Model Available")
        }
        
        switch viewModel.kind(for: indexPath.section) {
        case .recentEpisodes,
             .popularEpisodes:
            // Fetch Presentable
            let presentable: EpisodePresentable = viewModel.presentable(for: indexPath.item, in: indexPath.section)

            // Dequeue Episode Collection View Cell
            let cell: EpisodeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            
            // Configure Cell
            cell.configure(with: presentable)
            
            return cell
        case .collections:
            // Fetch Presentable
            let presentable: CollectionPresentable = viewModel.presentable(for: indexPath.item, in: indexPath.section)

            // Dequeue Collection Collection View Cell
            let cell: CollectionCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            
            // Configure Cell
            cell.configure(with: presentable)
            
            return cell
        case .categories:
            // Fetch Presentable
            let presentable: CategoryPresentable = viewModel.presentable(for: indexPath.item, in: indexPath.section)
            
            // Dequeue Category Collection View Cell
            let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            
            // Configure Cell
            cell.configure(with: presentable)
            
            return cell
        }
    }
    
}

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
}
