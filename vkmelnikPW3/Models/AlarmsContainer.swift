//
//  AlarmsContainer.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 14.10.2021.
//

import UIKit
import CoreData

class AlarmsContainer {
    public var alarms: [AlarmModel] = []
    public var wasUpdated: Bool = false
    public var context: NSManagedObjectContext?
    
    public func addAlarm(alarm: AlarmModel) {
        alarms.append(alarm)
        alarms.sort(by: { $0.time < $1.time })
        wasUpdated = true
        saveContext()
    }
    
    public func modAlarm(index: Int, newTime: Int, newTitle: String, newSound: Int) {
        alarms[index].time = Int16(newTime)
        alarms[index].title = newTitle
        alarms[index].soundNumber = Int16(newSound)
        alarms.sort(by: { $0.time < $1.time })
        wasUpdated = true
        saveContext()
    }
    
    public func removeAlarm(index: Int) {
        deleteFromContext(index: index)
        alarms.remove(at: index)
        wasUpdated = true
        saveContext()
    }
    
    public func loadContainer() {
        do {
            let fetchRequest: NSFetchRequest<AlarmModel> = AlarmModel.fetchRequest()
            let objects = try context!.fetch(fetchRequest)
            for object in objects {
                alarms.append(object)
            }
            setAlarms()
        } catch {
            context!.rollback()
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    public func saveContext() {
        if context!.hasChanges {
            do {
                try context!.save()
            } catch {
                context!.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteFromContext(index: Int) {
        context!.delete(alarms[index])
    }
}

extension AlarmsContainer {
    
    // Set notifications for all active alarms.
    func setAlarms() {
        for i in 0..<alarms.count {
            if (alarms[i].isActive) {
                let alarm = alarms[i];
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    appDelegate.notificationManager.scheduleNotification(alarm: alarm)
                }
            }
        }
    }
}
