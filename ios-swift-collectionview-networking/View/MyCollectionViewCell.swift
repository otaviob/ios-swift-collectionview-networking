//
//  MyCollectionViewCell.swift
//  ios-swift-collectionview-networking
//
//  Created by Otavio Brito on 9/5/2025.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .groupTableViewBackground
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
   
    }
    
    required init? (coder aDecoder: NSCoder) {
        fatalError("init has not implemented")
        
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        self.layer.cornerRadius = 10
    }
    
    
    
    
}
