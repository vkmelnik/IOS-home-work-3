//
//  CollectionViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol CollectionViewBuisnessLogic {
    func getCollectionViewDataSource() -> UICollectionViewDataSource
    func getCollectionViewDelegate() -> UICollectionViewDelegate
    
    func switchChanged(index: Int, value: Bool)
}

final class CollectionViewInteractor {
    var presenter: CollectionViewPresentationLogic?
    var alarmsContainer: AlarmsContainer?
}

extension CollectionViewInteractor: CollectionViewBuisnessLogic {
    func getCollectionViewDataSource() -> UICollectionViewDataSource {
        return presenter as! UICollectionViewDataSource
    }
    
    func getCollectionViewDelegate() -> UICollectionViewDelegate {
        return presenter as! UICollectionViewDelegate
    }
    
    func switchChanged(index: Int, value: Bool) {
        alarmsContainer?.wasUpdated = true
        if (value) {
            alarmsContainer?.alarms[index].isActive = true
        } else {
            alarmsContainer?.alarms[index].isActive = false
        }
    }
}
