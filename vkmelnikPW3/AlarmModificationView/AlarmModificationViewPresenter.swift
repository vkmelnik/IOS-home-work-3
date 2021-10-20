//
//  AlarmModificationViewPresenter.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 19.10.2021.
//

import UIKit

protocol AlarmModificationViewPresentationLogic: AnyObject {
    func setupTime(time: Int)
    func setupSound(sound: Int)
    func setupTitle(title: String)
}

final class AlarmModificationViewPresenter: NSObject {
    
    let sounds: [String] = ["Sound 1", "Sound 2", "Sound 3"]
    
    var viewController: AlarmModificationViewDisplayLogic?
}

extension AlarmModificationViewPresenter: AlarmModificationViewPresentationLogic {
    func setupTime(time: Int) {
        viewController?.setupTime(time: time)
    }
    
    func setupSound(sound: Int) {
        viewController?.setupSound(sound: sound)
    }
    
    func setupTitle(title: String) {
        viewController?.setupTitle(title: title)
    }
}

extension AlarmModificationViewPresenter: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
