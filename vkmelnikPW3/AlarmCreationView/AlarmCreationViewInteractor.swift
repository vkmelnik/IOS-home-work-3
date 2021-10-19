//
//  AlarmCreationViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

protocol AlarmCreationViewBuisnessLogic {
    func showNotification(title: String, text: String)
    func createAlarm(time: Int)
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
    
    func createAlarm(time: Int)  {
        let newAlarm = AlarmModel(time: time, isActive: false)
        alarmsContainer?.addAlarm(alarm: newAlarm)
        notificationManager?.showNotification(title: "Success", text: "Alarm for \(newAlarm.getFormatedTime()) is created")
    }
}
