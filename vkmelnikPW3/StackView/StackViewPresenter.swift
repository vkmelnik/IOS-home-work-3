//
//  StackViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

protocol StackViewPresentationLogic: AnyObject {
    func setupStackView(alarms: AlarmsContainer)
}

final class StackViewPresenter {
    var viewController: StackViewDisplayLogic?
    

}

extension StackViewPresenter: StackViewPresentationLogic {
    
    func setupStackView(alarms: AlarmsContainer) {
        for i in 0..<alarms.alarms.count {
            viewController?.addAlarmToStack(alarm: alarms.alarms[i], index: i)
        }
    }
}
