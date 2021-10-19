//
//  StackViewRouter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol CollectionViewRoutingLogic {
    func showModView(index: Int)
}

class CollectionViewRouter {
    weak var navigationController: UINavigationController?
    var alarms: AlarmsContainer?
}

extension CollectionViewRouter: CollectionViewRoutingLogic {
    func showModView(index: Int) {
        navigationController?.pushViewController(AlarmModificationViewAssembly().build(alarms: alarms!, index: index), animated: true)
    }
}
