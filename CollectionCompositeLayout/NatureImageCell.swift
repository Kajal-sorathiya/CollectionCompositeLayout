//
//  NatureImageCell.swift
//  CollectionCompositeLayout
//
//  Created by Ahir on 09/12/23.
//

import UIKit

class NatureImageCell: UICollectionViewCell {
    static let identifier = "NatureImageCell"
    
    private let imgview: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgview)
        
        let images: [UIImage] = [
        UIImage(named: "CoconutTreeNature"),
        UIImage(named: "GreenNature"),
        UIImage(named: "InsertScreenBG"),
        UIImage(named: "InsertScreenBGImg"),
        UIImage(named: "RoadGreenNature"),
        UIImage(named: "SpringNature"),
        UIImage(named: "WaterInNature"),
        UIImage(named: "WaterNature")
        ].compactMap({ $0 })
        
        imgview.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("You are doing something wrong.")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgview.frame = contentView.bounds
    }
    
}
