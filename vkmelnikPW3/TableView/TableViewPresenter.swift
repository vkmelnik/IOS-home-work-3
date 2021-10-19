//
//  TableViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol TableViewPresentationLogic: AnyObject {
    
}

final class TableViewPresenter: NSObject {
    var viewController: TableViewDisplayLogic?
    var interactor: TableViewBuisnessLogic?
    var alarmsContainer: AlarmsContainer?

    @objc func switchChanged(mySwitch: UISwitch) {
        interactor?.switchChanged(index: mySwitch.tag, value: mySwitch.isOn)
    }
}

extension TableViewPresenter: TableViewPresentationLogic {
    
}

extension TableViewPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        alarmsContainer?.alarms.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.modifiyAlarm(index: indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension TableViewPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "alarmViewCell",
            for: indexPath
        ) as? AlarmViewCell
        cell?.setupAlarmView(alarmModel: alarmsContainer!.alarms[indexPath.row])
        cell?.alarmView!.toggle?.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        cell?.alarmView!.toggle?.tag = indexPath.row
        return cell ?? UITableViewCell()
    }
}
