//
//  AlarmModel+CoreDataProperties.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 20.10.2021.
//
//

import Foundation
import CoreData


extension AlarmModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlarmModel> {
        return NSFetchRequest<AlarmModel>(entityName: "AlarmModel")
    }

    static var newId: Int16 = 0
    @NSManaged public var title: String?
    @NSManaged public var time: Int16
    @NSManaged public var soundNumber: Int16
    @NSManaged public var isActive: Bool
    @NSManaged public var id: Int16

    static func createAlarm(context: NSManagedObjectContext, time: Int, isActive: Bool) -> AlarmModel {
        let alarm = AlarmModel(context: context)
        alarm.id = AlarmModel.newId
        AlarmModel.newId += 1
        alarm.time = Int16(time)
        alarm.isActive = isActive
        alarm.title = "Alarm"
        return alarm
    }
    
    public static func initNewId(newIdStartValue: Int16) {
        newId = newIdStartValue
    }
    
    func getFormatedTime() -> String {
        let hours = time / 60
        let minutes = time % 60
        return "\(hours / 10)\(hours % 10):\(minutes / 10)\(minutes % 10)"
    }
    
}

extension AlarmModel : Identifiable {

}
