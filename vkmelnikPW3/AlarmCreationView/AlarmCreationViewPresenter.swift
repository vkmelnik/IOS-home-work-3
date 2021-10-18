//
//  AlarmCreationViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

protocol AlarmCreationViewPresentationLogic: AnyObject {
    
}

final class AlarmCreationViewPresenter: NSObject {
    var viewController: AlarmCreationViewDisplayLogic?
    var interactor: AlarmCreationViewBuisnessLogic?
    var alarmsContainer: AlarmsContainer?

    
}

extension AlarmCreationViewPresenter: AlarmCreationViewPresentationLogic {
    
}
