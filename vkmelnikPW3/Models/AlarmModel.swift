//
//  AlarmModel.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 14.10.2021.
//

import Foundation

class AlarmModel {
    public var isActive: Bool = false
    public var time: Int = 0
    public var title: String = "Alarm"
    
    init() {

    }
    
    convenience init(time: Int, isActive: Bool) {
        self.init()
        self.isActive = isActive
        self.time = time
    }
    
    func getFormatedTime() -> String {
        let hours = time / 60
        let minutes = time % 60
        return "\(hours / 10)\(hours % 10):\(minutes / 10)\(minutes % 10)"
    }
}
