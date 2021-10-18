//
//  AlarmCreationViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

protocol AlarmCreationViewDisplayLogic {
    
}

class AlarmCreationViewController: UIViewController {
    
    private var interactor: AlarmCreationViewBuisnessLogic?
    private var timePicker: UIDatePicker?
    private var doneButton: UIButton?

    func setupViewController(interactor: AlarmCreationViewBuisnessLogic) {
        self.interactor = interactor
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupAlarmCreation()
        // Do any additional setup after loading the view.
    }
    
    private func setupAlarmCreation() {
        setupTimePicker()
        setupDoneButton()
    }
    
    private func setupDoneButton() {
        let doneButton = UIButton()
        doneButton.setTitle("Add alarm", for: .normal)
        doneButton.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.7058823529, blue: 0.2, alpha: 1)
        view.addSubview(doneButton)
        doneButton.pinTop(to: timePicker!.bottomAnchor, 10)
        doneButton.pinLeft(to: view, 10)
        doneButton.pinRight(to: view, 10)
        doneButton.setHeight(to: 50)
        doneButton.layer.cornerRadius = 15
        self.doneButton = doneButton
    }

    private func setupTimePicker() {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.locale = Locale(identifier: "ru_RU")
        view.addSubview(timePicker)
        timePicker.pinLeft(to: view, 10)
        timePicker.pinRight(to: view, 10)
        timePicker.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 10)
        self.timePicker = timePicker
    }
}

extension AlarmCreationViewController: AlarmCreationViewDisplayLogic {
    
}
