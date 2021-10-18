//
//  AlarmCreationViewAssembly.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

final class AlarmCreationViewAssembly {
    func build(alarms: AlarmsContainer) -> UIViewController {
        let interactor = AlarmCreationViewInteractor()
        let vc = AlarmCreationViewController()
        vc.setupViewController(interactor: interactor)
        let presenter = AlarmCreationViewPresenter()
        interactor.presenter = presenter
        interactor.alarmsContainer = alarms
        presenter.alarmsContainer = alarms
        presenter.viewController = vc
        presenter.interactor = interactor
        
        return vc
    }
}
