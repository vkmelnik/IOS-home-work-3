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
}

final class TableViewInteractor {
    typealias Model = TableViewModel
    
    var presenter: TableViewPresentationLogic?
}

extension TableViewInteractor: TableViewBuisnessLogic {
    func getTableViewDataSource() -> UITableViewDataSource {
        return presenter as! UITableViewDataSource
    }
    
    func getTableViewDelegate() -> UITableViewDelegate {
        return presenter as! UITableViewDelegate
    }
    
    
}
