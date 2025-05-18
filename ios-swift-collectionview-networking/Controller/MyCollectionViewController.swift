//
//  ViewController.swift
//  ios-swift-collectionview-networking
//
//  Created by Otavio Brito on 8/5/2025.
//

import UIKit

private let reuseIdentifier = "MyCollectionCell"

class MyCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var collection = [MyCollectionModel]()
    
    let infoView: InfoView = {
        let view = InfoView()
        view.layer.cornerRadius = 5
        return view
    }()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchCollection()
    }
    
    // MARK: - Selectors
    
    // [Action] - Tap Search
    @objc func searchTapped() {
        print("Works")
    }
    
    // MARK: - API
    
    func fetchCollection() {
        Service.shared.fetchCollection { (collection) in
            DispatchQueue.main.sync {
                self.collection = collection
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Helper Functions
    
    private func setupView() {
        title = "My Collection"

        // [Style] - Navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .mainPink()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = false

        // [Button] - Search
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .search,
                target: self,
                action: #selector(searchTapped))
        
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        view.addSubview(infoView)
        infoView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 64, height: 500)
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -44).isActive = true
    }
}

extension MyCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.collection = collection[indexPath.item]
        return cell
    }
}

extension MyCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 36) / 3
            return CGSize(width: width, height: width)
            
        }
    }
    
    
