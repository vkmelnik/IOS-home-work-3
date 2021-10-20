//
//  AlarmModificationViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 19.10.2021.
//

import UIKit

protocol AlarmModificationViewBuisnessLogic {
    func modifyAlarm(newTime: Int, newTitle: String, newSound: Int)
    func removeAlarm()
    func setupAlarm()
    
    func getPickerDelegate() -> UIPickerViewDelegate
    func getPickerDataSource() -> UIPickerViewDataSource
}

final class AlarmModificationViewInteractor {
    var presenter: AlarmModificationViewPresentationLogic?
    var alarmsContainer: AlarmsContainer?
    var indexInContainer: Int = 0
}

extension AlarmModificationViewInteractor: AlarmModificationViewBuisnessLogic {
    
    func modifyAlarm(newTime: Int, newTitle: String, newSound: Int)  {
        if (indexInContainer < alarmsContainer!.alarms.count) {
            alarmsContainer?.modAlarm(index: indexInContainer, newTime: newTime, newTitle: newTitle, newSound: newSound)
            if (alarmsContainer!.alarms[indexInContainer].isActive) {
                let alarm = alarmsContainer!.alarms[indexInContainer];
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    appDelegate.notificationManager.unscheduleNotification(identifier: alarm.id)
                    appDelegate.notificationManager.scheduleNotification(alarm: alarm)
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
    
    func setupAlarm() {
        presenter?.setupTitle(title: alarmsContainer!.alarms[indexInContainer].title)
        presenter?.setupSound(sound: alarmsContainer!.alarms[indexInContainer].soundNumber)
        presenter?.setupTime(time: alarmsContainer!.alarms[indexInContainer].time)
    }
    
    func getPickerDelegate() -> UIPickerViewDelegate {
        return presenter as! UIPickerViewDelegate
    }
    
    func getPickerDataSource() -> UIPickerViewDataSource {
        return presenter as! UIPickerViewDataSource
    }
}
