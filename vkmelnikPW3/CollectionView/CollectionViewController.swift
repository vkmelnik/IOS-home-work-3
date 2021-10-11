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
    
    func setupViewController(interactor: CollectionViewBuisnessLogic) {
        self.interactor = interactor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBrown
    }


}

extension CollectionViewController: CollectionViewDisplayLogic {
    
}
