//
//  TableViewRouter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol TableViewRoutingLogic {
    func showModView(index: Int)
}

class TableViewRouter {
    weak var navigationController: UINavigationController?
    var alarms: AlarmsContainer?
}

extension TableViewRouter: TableViewRoutingLogic {
    func showModView(index: Int) {
        navigationController?.pushViewController(AlarmModificationViewAssembly().build(alarms: alarms!, index: index), animated: true)
    }
}
