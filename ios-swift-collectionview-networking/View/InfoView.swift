//
//  File.swift
//  ios-swift-collectionview-networking
//
//  Created by Otavio Brito on 18/5/2025.
//

import UIKit

protocol InfoViewDelegate {
    func dismissInfoView(withCollection collection: MyCollectionModel?)
}

class InfoView: UIView {
    
    // MARK: - Properties
    
    var delegate: InfoViewDelegate?
    
    var collection: MyCollectionModel? {
        didSet {
            guard let collection = self.collection else { return }
            guard let type = collection.type else { return }
            guard let defense = collection.defense else { return }
            guard let attack = collection.attack else { return }
            guard let id = collection.id else { return }
            guard let height = collection.height else { return }
            guard let weight = collection.weight else { return }
            
            imageView.image = collection.image
            nameLabel.text = collection.name
            
            configureLabel(label: typeLabel, title: "Type", details: type)
            configureLabel(label: defenseLabel, title: "Defense", details: "\(defense)")
            configureLabel(label: heightLabel, title: "Height", details: "\(height)")
            configureLabel(label: weightLabel, title: "Weight", details: "\(weight)")
            configureLabel(label: pokedexIdLabel, title: "Pokedex Id", details: "\(id)")
            configureLabel(label: attackLabel, title: "Base Attack", details: "\(attack)")
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink()
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 5
        nameLabel.center(inView: view)
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "TEST001"
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST001"
        return label
    }()
    
    let defenseLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST001"
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST001"
        return label
    }()
    
    let pokedexIdLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST001"
        return label
    }()
    
    let attackLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST001"
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST001"  
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .mainPink()
        button.setTitle("View More Info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleViewMoreInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleViewMoreInfo() {
        guard let collection = self.collection else { return }
        delegate?.dismissInfoView(withCollection: collection)
    }
    
    // MARK: - Helper Functions
    
    func configureLabel(label: UILabel, title: String, details: String) {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title):  ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainPink()]))
        attributedText.append(NSAttributedString(string: "\(details)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        label.attributedText = attributedText
    }
    
    func configureViewComponents() {
        backgroundColor = .white
        
        self.layer.masksToBounds = true
        
        addSubview(nameContainerView)
        nameContainerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addSubview(imageView)
        imageView.anchor(top: nameContainerView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 60)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(typeLabel)
        typeLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(defenseLabel)
        defenseLabel.anchor(top: imageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .secondarySystemBackground
        addSubview(separatorView)
        separatorView.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: 4, width: 0, height: 1)
        
        addSubview(heightLabel)
        heightLabel.anchor(top: separatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(weightLabel)
        weightLabel.anchor(top: heightLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(pokedexIdLabel)
        pokedexIdLabel.anchor(top: separatorView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(attackLabel)
        attackLabel.anchor(top: pokedexIdLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(infoButton)
        infoButton.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, width: 0, height: 50)
        
    }
    
    
}
