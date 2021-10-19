//
//  AlarmModificationViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 19.10.2021.
//

import UIKit

protocol AlarmModificationViewBuisnessLogic {
    func modifyAlarm(newTime: Int)
    func removeAlarm()
    func setupTime()
}

final class AlarmModificationViewInteractor {
    var presenter: AlarmModificationViewPresentationLogic?
    var alarmsContainer: AlarmsContainer?
    var indexInContainer: Int = 0
}

extension AlarmModificationViewInteractor: AlarmModificationViewBuisnessLogic {
    
    func modifyAlarm(newTime: Int)  {
        if (indexInContainer < alarmsContainer!.alarms.count) {
            alarmsContainer?.modAlarm(index: indexInContainer, newTime: newTime)
        }
    }
    
    func removeAlarm() {
        if (indexInContainer < alarmsContainer!.alarms.count) {
            alarmsContainer?.removeAlarm(index: indexInContainer)
        }
    }
    
    func setupTime() {
        presenter?.setupTime(time: alarmsContainer!.alarms[indexInContainer].time)
    }
}