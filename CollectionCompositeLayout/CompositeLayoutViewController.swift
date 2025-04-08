//
//  ViewController.swift
//  CollectionCompositeLayout
//
//  Created by Ahir on 09/12/23.
//

import UIKit

class CompositeLayoutViewController: UIViewController {

    private let clview = UICollectionView(frame: .zero,
                                          collectionViewLayout: CompositeLayoutViewController.createLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(clview)
        clview.register(NatureImageCell.self, forCellWithReuseIdentifier: NatureImageCell.identifier)
        clview.frame = view.bounds
        clview.backgroundColor = .white
        clview.delegate = self
        clview.dataSource = self
    }

    static private func createLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(0.5)
            )
        )
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        ))
        tripletItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        // Group
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)),
            subitem: verticalStackItem,
            count: 2
        )
        
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.7)),
            subitems: [
                item,
                verticalStackGroup
            ]
        )
        
        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.3)),
            subitem: tripletItem,
            count: 3)
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)),
            subitems: [
                horizontalGroup,
                tripletHorizontalGroup
            ]
        )
        // Sections
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        // Return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
extension CompositeLayoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clview.dequeueReusableCell(withReuseIdentifier: NatureImageCell.identifier, for: indexPath)
        return cell
    }
    
    
}

