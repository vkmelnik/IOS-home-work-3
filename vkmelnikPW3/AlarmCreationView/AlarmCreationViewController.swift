//
//  AlarmCreationViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

protocol AlarmCreationViewDisplayLogic {
    func setChosenSound(soundNumber: Int)
}

class AlarmCreationViewController: UIViewController {
    
    private var interactor: AlarmCreationViewBuisnessLogic?
    private var timePicker: UIDatePicker?
    private var doneButton: UIButton?
    private var titleField: UITextField?
    // Picker for sound that alarm will do.
    private var soundPicker: UIPickerView?
    
    public var chosenSound: Int = 0

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
        setupTitleField()
        setupSoundPicker()
        setupTimePicker()
        setupDoneButton()
    }
    
    @objc func buttonPressed(sender:UIButton) {
        let date = timePicker!.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        
        let time = hour * 60 + minute
        interactor?.createAlarm(time: time, title: titleField?.text ?? "Alarm", sound: chosenSound)
    }
    
    private func setupSoundPicker() {
        // Creating picker.
        let soundPicker = UIPickerView()
        soundPicker.delegate = interactor?.getPickerDelegate()
        soundPicker.dataSource = interactor?.getPickerDataSource()
        view.addSubview(soundPicker)
        soundPicker.pinTop(to: titleField!.bottomAnchor, 10)
        soundPicker.pinLeft(to: view, 10)
        soundPicker.pinRight(to: view, 10)
        soundPicker.setHeight(to: 100)
        soundPicker.layoutIfNeeded()
        soundPicker.makeRetroPicker()
        self.soundPicker = soundPicker
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
        doneButton.backgroundColor = #colorLiteral(red: 0.3344596538, green: 0.3641954376, blue: 0.4409706901, alpha: 1)
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
        timePicker.pinTop(to: soundPicker!.bottomAnchor, 10)
        timePicker.layoutIfNeeded()
        timePicker.makeRetroPicker()
        self.timePicker = timePicker
    }
    
    func setupTitleField() {
        let titleField = UITextField()
        titleField.borderStyle = .roundedRect
        titleField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9)
        titleField.text = "Alarm"
        view.addSubview(titleField)
        titleField.pinLeft(to: view, 10)
        titleField.pinRight(to: view, 10)
        titleField.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 10)
        titleField.setHeight(to: 40)
        self.titleField = titleField
    }
}

extension AlarmCreationViewController: AlarmCreationViewDisplayLogic {
    
    func setChosenSound(soundNumber: Int) {
        chosenSound = soundNumber
    }
}
