//
//  CollectionViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol CollectionViewBuisnessLogic {
    func getCollectionViewDataSource() -> UICollectionViewDataSource
    func getCollectionViewDelegate() -> UICollectionViewDelegate
    
    func switchChanged(index: Int, value: Bool)
    func modifiyAlarm(index: Int)
}

final class CollectionViewInteractor {
    var presenter: CollectionViewPresentationLogic?
    var router: CollectionViewRoutingLogic?
    var alarmsContainer: AlarmsContainer?
}

extension CollectionViewInteractor: CollectionViewBuisnessLogic {
    func getCollectionViewDataSource() -> UICollectionViewDataSource {
        return presenter as! UICollectionViewDataSource
    }
    
    func getCollectionViewDelegate() -> UICollectionViewDelegate {
        return presenter as! UICollectionViewDelegate
    }
    
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
    
    func modifiyAlarm(index: Int) {
        if (index >= (alarmsContainer?.alarms.count)!) {
            return
        }
        router?.showModView(index: index)
    }
}
