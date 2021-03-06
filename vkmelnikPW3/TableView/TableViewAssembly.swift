//
//  TableViewAssembly.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

final class TableViewAssembly {
    func build(alarms: AlarmsContainer, navigationController: UINavigationController) -> UIViewController {
        let interactor = TableViewInteractor()
        let vc = TableViewController()
        vc.setupViewController(interactor: interactor)
        let presenter = TableViewPresenter()
        interactor.presenter = presenter
        interactor.alarmsContainer = alarms
        presenter.alarmsContainer = alarms
        presenter.viewController = vc
        presenter.interactor = interactor
        
        let router = TableViewRouter()
        router.navigationController = navigationController
        router.alarms = alarms
        interactor.router = router
        return vc
    }
}
