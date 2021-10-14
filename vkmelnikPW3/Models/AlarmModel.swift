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
    
    init() {

    }
    
    convenience init(time: Int, isActive: Bool) {
        self.init()
        self.isActive = isActive
        self.time = time
    }
}
