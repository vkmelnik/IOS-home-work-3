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
        self.view.backgroundColor = #colorLiteral(red: 0.8220563487, green: 0.8234423022, blue: 0.8715592698, alpha: 1)
        setupRetroBackground2()
        setupAlarmCreation()
        // Do any additional setup after loading the view.
    }
    
    private func setupAlarmCreation() {
        setupTimePicker()
        setupDoneButton()
    }
    
    @objc func buttonPressed(sender:UIButton) {
        let date = timePicker!.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        
        let time = hour * 60 + minute
        interactor?.createAlarm(time: time)
    }
    
    private func setupDoneButton() {
        let doneButton = UIButton()
        doneButton.setTitle("Add alarm", for: .normal)
        view.addSubview(doneButton)
        doneButton.pinTop(to: timePicker!.bottomAnchor, 10)
        doneButton.pinLeft(to: view, 10)
        doneButton.pinRight(to: view, 10)
        doneButton.setHeight(to: 50)
        doneButton.layer.cornerRadius = 15
        doneButton.layoutIfNeeded()
        doneButton.makeRetroUI()
        doneButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
        timePicker.layoutIfNeeded()
        timePicker.makeRetroUI()
        self.timePicker = timePicker
    }
}

extension AlarmCreationViewController: AlarmCreationViewDisplayLogic {
    
}

