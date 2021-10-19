//
//  StackViewAssembly.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

final class StackViewAssembly {
    func build(alarms: AlarmsContainer, navigationController: UINavigationController) -> UIViewController {
        let interactor = StackViewInteractor()
        let vc = StackViewController()
        vc.setupViewController(interactor: interactor)
        let presenter = StackViewPresenter()
        interactor.presenter = presenter
        interactor.alarmsContainer = alarms
        presenter.viewController = vc
        
        let router = StackViewRouter()
        router.navigationController = navigationController
        router.alarms = alarms
        interactor.router = router
        return vc
    }
}
