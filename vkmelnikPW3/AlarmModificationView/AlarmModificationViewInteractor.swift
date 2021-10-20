//
//  AlarmModificationViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 19.10.2021.
//

import UIKit

protocol AlarmModificationViewBuisnessLogic {
    func modifyAlarm(newTime: Int, newTitle: String)
    func removeAlarm()
    func setupTime()
}

final class AlarmModificationViewInteractor {
    var presenter: AlarmModificationViewPresentationLogic?
    var alarmsContainer: AlarmsContainer?
    var indexInContainer: Int = 0
}

extension AlarmModificationViewInteractor: AlarmModificationViewBuisnessLogic {
    
    func modifyAlarm(newTime: Int, newTitle: String)  {
        if (indexInContainer < alarmsContainer!.alarms.count) {
            alarmsContainer?.modAlarm(index: indexInContainer, newTime: newTime, newTitle: newTitle)
            if (alarmsContainer!.alarms[indexInContainer].isActive) {
                let alarm = alarmsContainer!.alarms[indexInContainer];
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    appDelegate.notificationManager.unscheduleNotification(identifier: alarm.id)
                    appDelegate.notificationManager.scheduleNotification(alarmTitle: alarm.title, time: alarm.getFormatedTime(), identifier: alarm.id)
                }
            }
        }
    }
    
    func removeAlarm() {
        if (indexInContainer < alarmsContainer!.alarms.count) {
            if (alarmsContainer!.alarms[indexInContainer].isActive) {
                let alarm = alarmsContainer!.alarms[indexInContainer];
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    appDelegate.notificationManager.unscheduleNotification(identifier: alarm.id)
                }
            }
            alarmsContainer?.removeAlarm(index: indexInContainer)
        }
    }
    
    func setupTime() {
        presenter?.setupTime(time: alarmsContainer!.alarms[indexInContainer].time)
    }
}
