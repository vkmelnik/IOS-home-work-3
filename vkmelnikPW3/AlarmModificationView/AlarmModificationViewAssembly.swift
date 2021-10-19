//
//  AlarmModificationViewAssembly.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 19.10.2021.
//

import UIKit

final class AlarmModificationViewAssembly {
    func build(alarms: AlarmsContainer, index: Int) -> UIViewController {
        let interactor = AlarmModificationViewInteractor()
        let vc = AlarmModificationViewController()
        vc.setupViewController(interactor: interactor)
        interactor.alarmsContainer = alarms
        interactor.indexInContainer = index
        
        let presenter = AlarmModificationViewPresenter()
        presenter.viewController = vc
        interactor.presenter = presenter
        
        return vc
    }
}
