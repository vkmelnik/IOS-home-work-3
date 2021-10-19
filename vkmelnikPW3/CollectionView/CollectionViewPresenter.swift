//
//  CollectionViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol CollectionViewPresentationLogic: AnyObject {
    
}

final class CollectionViewPresenter: NSObject {
    var viewController: CollectionViewDisplayLogic?
    var interactor: CollectionViewBuisnessLogic?
    var alarmsContainer: AlarmsContainer?

    @objc func switchChanged(mySwitch: UISwitch) {
        interactor?.switchChanged(index: mySwitch.tag, value: mySwitch.isOn)
    }
}

extension CollectionViewPresenter: CollectionViewPresentationLogic {
    
}

extension CollectionViewPresenter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        alarmsContainer?.alarms.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.modifiyAlarm(index: indexPath.row)
    }
}

extension CollectionViewPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "alarmCollectionViewCell",
            for: indexPath
        ) as? AlarmCollectionViewCell
        cell?.setupAlarmView(alarmModel: alarmsContainer!.alarms[indexPath.row])
        cell?.alarmView!.toggle?.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        cell?.alarmView!.toggle?.tag = indexPath.row
        return cell ?? UICollectionViewCell()
    }
    
    
}
