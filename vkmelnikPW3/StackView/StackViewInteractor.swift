//
//  StackViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol StackViewBuisnessLogic {
    func alarmsCount() -> Int
    func alarmsUpdated() -> Bool
    func viewUpdated()
    func setupStackView()
    func switchChanged(index: Int, value: Bool)
    func modifiyAlarm(index: Int)
}

final class StackViewInteractor {
    var presenter: StackViewPresentationLogic?
    var router: StackViewRoutingLogic?
    var alarmsContainer: AlarmsContainer?
}

extension StackViewInteractor: StackViewBuisnessLogic {
    func switchChanged(index: Int, value: Bool) {
        if (value) {
            alarmsContainer?.alarms[index].isActive = true
        } else {
            alarmsContainer?.alarms[index].isActive = false
        }
    }
    
    func alarmsCount() -> Int {
        return alarmsContainer?.alarms.count ?? 0
    }
    
    func setupStackView() {
        presenter?.setupStackView(alarms: alarmsContainer!)
    }
    
    func alarmsUpdated() -> Bool {
        return alarmsContainer?.wasUpdated ?? false
    }
    
    func viewUpdated() {
        alarmsContainer?.wasUpdated = false
    }
    
    func modifiyAlarm(index: Int) {
        if (index >= (alarmsContainer?.alarms.count)!) {
            return
        }
        router?.showModView(index: index)
    }
}
