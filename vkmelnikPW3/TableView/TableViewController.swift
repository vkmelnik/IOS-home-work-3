//
//  TableViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol TableViewDisplayLogic {
    
}

class TableViewController: UIViewController {
    
    private var interactor: TableViewBuisnessLogic?
    
    func setupViewController(interactor: TableViewBuisnessLogic) {
        self.interactor = interactor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension TableViewController: TableViewDisplayLogic {
    
}
