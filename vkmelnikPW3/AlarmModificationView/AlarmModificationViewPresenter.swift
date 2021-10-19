//
//  AlarmModificationViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 19.10.2021.
//

import UIKit

protocol AlarmModificationViewPresentationLogic: AnyObject {
    func setupTime(time: Int)
}

final class AlarmModificationViewPresenter: NSObject {
    var viewController: AlarmModificationViewDisplayLogic?
}

extension AlarmModificationViewPresenter: AlarmModificationViewPresentationLogic {
    func setupTime(time: Int) {
        viewController?.setupTime(time: time)
    }
}
