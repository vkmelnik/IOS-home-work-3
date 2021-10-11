//
//  StackViewAssembly.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

final class StackViewAssembly {
    func build() -> UIViewController {
        let interactor = StackViewInteractor()
        let vc = StackViewController()
        vc.setupViewController(interactor: interactor)
        let presenter = StackViewPresenter()
        interactor.presenter = presenter
        presenter.viewController = vc
        
        return vc
    }
}