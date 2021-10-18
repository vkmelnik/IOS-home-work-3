//
//  AlarmCreationViewInteractor.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

protocol AlarmCreationViewBuisnessLogic {
    
}

final class AlarmCreationViewInteractor {
    var presenter: AlarmCreationViewPresentationLogic?
    var alarmsContainer: AlarmsContainer?
}

extension AlarmCreationViewInteractor: AlarmCreationViewBuisnessLogic {
    
}
