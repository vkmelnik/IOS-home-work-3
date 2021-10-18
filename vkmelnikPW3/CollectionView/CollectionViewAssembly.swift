//
//  CollectionViewAssembly.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

final class CollectionViewAssembly {
    func build(alarms: AlarmsContainer) -> UIViewController {
        let interactor = CollectionViewInteractor()
        let vc = CollectionViewController()
        vc.setupViewController(interactor: interactor)
        let presenter = CollectionViewPresenter()
        interactor.presenter = presenter
        interactor.alarmsContainer = alarms
        presenter.alarmsContainer = alarms
        presenter.viewController = vc
        presenter.interactor = interactor
        
        return vc
    }
}
