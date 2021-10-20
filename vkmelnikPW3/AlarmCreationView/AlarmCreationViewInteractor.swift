//
//  AlarmCreationViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

protocol AlarmCreationViewBuisnessLogic {
    func showNotification(title: String, text: String)
    func createAlarm(time: Int, title: String, sound: Int)
    
    func getPickerDelegate() -> UIPickerViewDelegate
    func getPickerDataSource() -> UIPickerViewDataSource
}

final class AlarmCreationViewInteractor {
    var presenter: AlarmCreationViewPresentationLogic?
    var alarmsContainer: AlarmsContainer?
    var notificationManager: RetroNotificationManager?
}

extension AlarmCreationViewInteractor: AlarmCreationViewBuisnessLogic {
    func showNotification(title: String, text: String) {
        notificationManager?.showNotification(title: title, text: text)
    }
    
    func createAlarm(time: Int, title: String, sound: Int)  {
        let newAlarm = AlarmModel(time: time, isActive: false)
        newAlarm.title = title
        newAlarm.soundNumber = sound
        alarmsContainer?.addAlarm(alarm: newAlarm)
        notificationManager?.showNotification(title: "Success", text: "Alarm for \(newAlarm.getFormatedTime()) is created")
    }
    
    func getPickerDelegate() -> UIPickerViewDelegate {
        return presenter as! UIPickerViewDelegate
    }
    
    func getPickerDataSource() -> UIPickerViewDataSource {
        return presenter as! UIPickerViewDataSource
    }
}
