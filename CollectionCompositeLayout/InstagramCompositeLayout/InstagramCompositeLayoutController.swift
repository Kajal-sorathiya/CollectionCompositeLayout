//
//  InstagramCompositeLayoutController.swift
//  CollectionCompositeLayout
//
//  Created by Ahir on 10/12/23.
//

import UIKit

class InstagramCompositeLayoutController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
    }
    private func setupCollectionView() {
        let searchCollectionView = UICollectionView (frame: .zero,
                                                     collectionViewLayout: getComposionalLayout())
        searchCollectionView.frame = self.view.frame
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.register(UICollectionViewCell.self,
                                      forCellWithReuseIdentifier: "cell")
        searchCollectionView.backgroundColor = .white
        self.view.addSubview(searchCollectionView)
    }
    
    private func getComposionalLayout() -> UICollectionViewCompositionalLayout {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/3))
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        //--------------------Group 1---------------------//
        let group1Item1 = NSCollectionLayoutItem(layoutSize:
                                                    NSCollectionLayoutSize(
                                                        widthDimension: .fractionalWidth(1/2),
                                                        heightDimension: .fractionalHeight(1)))
        group1Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let nestedGrou1Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                         heightDimension: .fractionalHeight(1/2)))
        nestedGrou1Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        let nestedGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                                                                               heightDimension: .fractionalHeight(1)),
                                                            subitems: [nestedGrou1Item1])
        
        
        let group1 = NSCollectionLayoutGroup.horizontal(layoutSize:
                                                            NSCollectionLayoutSize(
                                                                widthDimension: .fractionalWidth(1),
                                                                heightDimension: .fractionalHeight(1/3)),
                                                        subitems: [group1Item1, nestedGroup1])
        
        //--------------------Group 2---------------------//
        
        let gruop2Item1 = NSCollectionLayoutItem(layoutSize:
                                                    NSCollectionLayoutSize(
                                                        widthDimension: .fractionalWidth(1/3),
                                                        heightDimension: .fractionalHeight(1)))
        gruop2Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize:
                                                            NSCollectionLayoutSize(
                                                                widthDimension: .fractionalWidth(1),
                                                                heightDimension: .fractionalHeight(1/3)),
                                                        subitems: [gruop2Item1])
        
        let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize:
                                                                NSCollectionLayoutSize(
                                                                    widthDimension: .fractionalWidth(1),
                                                                    heightDimension: .absolute(600)),
                                                              subitems: [item, group1, group2])
        
        let section = NSCollectionLayoutSection(group: containerGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension InstagramCompositeLayoutController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        70
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .random
        return cell
    }
}
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0.4...1),
                       green: .random(in: 0.4...1),
                       blue: .random(in: 0.4...1),
                       alpha: 1)
    }
}
