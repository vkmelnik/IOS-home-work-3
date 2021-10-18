//
//  CollectionViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol CollectionViewDisplayLogic {
    
}

class CollectionViewController: UIViewController {
    
    private var interactor: CollectionViewBuisnessLogic?
    private var collection: UICollectionView?
    
    func setupViewController(interactor: CollectionViewBuisnessLogic) {
        self.interactor = interactor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 10,
        bottom: 10, right: 10)
        layoutFlow.scrollDirection = .horizontal
        layoutFlow.itemSize = CGSize(width: 240, height: 120)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        collection.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        collection.register(AlarmCollectionViewCell.self, forCellWithReuseIdentifier: "alarmCollectionViewCell")
        collection.delegate = interactor?.getCollectionViewDelegate()
        collection.dataSource = interactor?.getCollectionViewDataSource()
        self.collection = collection
    }

}

extension CollectionViewController: CollectionViewDisplayLogic {
    
}
