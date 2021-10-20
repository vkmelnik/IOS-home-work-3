//
//  TableViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol TableViewBuisnessLogic {
    func getTableViewDataSource() -> UITableViewDataSource
    func getTableViewDelegate() -> UITableViewDelegate
    
    func switchChanged(index: Int, value: Bool)
    func modifiyAlarm(index: Int)
}

final class TableViewInteractor {    
    var presenter: TableViewPresentationLogic?
    var router: TableViewRoutingLogic?
    var alarmsContainer: AlarmsContainer?
}

extension TableViewInteractor: TableViewBuisnessLogic {
    func switchChanged(index: Int, value: Bool) {
        alarmsContainer?.wasUpdated = true
        if (value) {
            alarmsContainer?.alarms[index].isActive = true
            let alarm = alarmsContainer!.alarms[index];
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.notificationManager.scheduleNotification(alarmTitle: alarm.title, time: alarm.getFormatedTime(), identifier: alarm.id)
            }
        } else {
            alarmsContainer?.alarms[index].isActive = false
            let alarm = alarmsContainer!.alarms[index];
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.notificationManager.unscheduleNotification(identifier: alarm.id)
            }
        }
    }
    
    func getTableViewDataSource() -> UITableViewDataSource {
        return presenter as! UITableViewDataSource
    }
    
    func getTableViewDelegate() -> UITableViewDelegate {
        return presenter as! UITableViewDelegate
    }
    
    func modifiyAlarm(index: Int) {
        if (index >= (alarmsContainer?.alarms.count)!) {
            return
        }
        router?.showModView(index: index)
    }
    
}
