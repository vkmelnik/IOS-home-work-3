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
    
    let sounds: [String] = ["Sound 1", "Sound 2", "Sound 3"]
    
    var viewController: AlarmCreationViewDisplayLogic?
    var interactor: AlarmCreationViewBuisnessLogic?
    var alarmsContainer: AlarmsContainer?

    
}

extension AlarmCreationViewPresenter: AlarmCreationViewPresentationLogic {
    
}

extension AlarmCreationViewPresenter: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sounds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sounds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewController?.setChosenSound(soundNumber: row)
    }
}
