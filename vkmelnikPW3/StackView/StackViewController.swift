//
//  StackViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol StackViewDisplayLogic {
    
}

class StackViewController: UIViewController {
    
    private var interactor: StackViewBuisnessLogic?
    
    func setupViewController(interactor: StackViewBuisnessLogic) {
        self.interactor = interactor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemTeal
    }


}

extension StackViewController: StackViewDisplayLogic {
    
}
