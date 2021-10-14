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
}

final class TableViewInteractor {    
    var presenter: TableViewPresentationLogic?
    var alarmsContainer: AlarmsContainer?
}

extension TableViewInteractor: TableViewBuisnessLogic {
    func switchChanged(index: Int, value: Bool) {
        alarmsContainer?.wasUpdated = true
        if (value) {
            alarmsContainer?.alarms[index].isActive = true
        } else {
            alarmsContainer?.alarms[index].isActive = false
        }
    }
    
    func getTableViewDataSource() -> UITableViewDataSource {
        return presenter as! UITableViewDataSource
    }
    
    func getTableViewDelegate() -> UITableViewDelegate {
        return presenter as! UITableViewDelegate
    }
    
    
}
