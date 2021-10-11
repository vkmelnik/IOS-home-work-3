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
    private var stackView: UIStackView?
    
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
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        stackView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        stackView.pin(to: view, .left, .right)
        stackView.backgroundColor = .white
        self.stackView = stackView
    }


}

extension StackViewController: StackViewDisplayLogic {
    
}
