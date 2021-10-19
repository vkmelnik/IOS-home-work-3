//
//  AlarmsContainer.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 14.10.2021.
//

import Foundation

class AlarmsContainer {
    public var alarms: [AlarmModel] = []
    public var wasUpdated: Bool = false
    
    public func addAlarm(alarm: AlarmModel) {
        alarms.append(alarm)
        alarms.sort(by: { $0.time < $1.time })
        wasUpdated = true
    }
    
    public func modAlarm(index: Int, newTime: Int) {
        alarms[index].time = newTime
        alarms.sort(by: { $0.time < $1.time })
        wasUpdated = true
    }
    
    public func removeAlarm(index: Int) {
        alarms.remove(at: index)
        wasUpdated = true
    }
}
