//
//  AlarmModificationViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 19.10.2021.
//

import UIKit

protocol AlarmModificationViewDisplayLogic {
    func setupTime(time: Int)
}

class AlarmModificationViewController: UIViewController {
    
    private var interactor: AlarmModificationViewBuisnessLogic?
    private var timePicker: UIDatePicker?
    private var doneButton: UIButton?
    private var deleteButton: UIButton?
    private var titleField: UITextField?

    func setupViewController(interactor: AlarmModificationViewBuisnessLogic) {
        self.interactor = interactor
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8220563487, green: 0.8234423022, blue: 0.8715592698, alpha: 1)
        setupRetroBackground3()
        setupAlarmCreation()
        interactor?.setupTime()
        // Do any additional setup after loading the view.
    }
    
    private func setupAlarmCreation() {
        setupTitleField()
        setupTimePicker()
        setupDoneButton()
        setupDeleteButton()
    }
    
    @objc func addButtonPressed(sender: UIButton) {
        let date = timePicker!.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        
        let time = hour * 60 + minute
        interactor?.modifyAlarm(newTime: time, newTitle: titleField?.text ?? "Alarm")
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func deleteButtonPressed(sender: UIButton) {
        interactor?.removeAlarm()
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupDoneButton() {
        let doneButton = UIButton()
        doneButton.setTitle("Change alarm", for: .normal)
        view.addSubview(doneButton)
        doneButton.pinTop(to: timePicker!.bottomAnchor, 10)
        doneButton.pinLeft(to: view, 10)
        doneButton.pinRight(to: view, 10)
        doneButton.setHeight(to: 50)
        doneButton.layer.cornerRadius = 15
        doneButton.layoutIfNeeded()
        doneButton.backgroundColor = #colorLiteral(red: 0.4406444136, green: 0.5876471941, blue: 0.4853251793, alpha: 1)
        doneButton.makeRetroUI()
        doneButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        self.doneButton = doneButton
    }
    
    private func setupDeleteButton() {
        let deleteButton = UIButton()
        deleteButton.setTitle("Delete alarm", for: .normal)
        view.addSubview(deleteButton)
        deleteButton.pinTop(to: doneButton!.bottomAnchor, 10)
        deleteButton.pinLeft(to: view, 10)
        deleteButton.pinRight(to: view, 10)
        deleteButton.setHeight(to: 50)
        deleteButton.layer.cornerRadius = 15
        deleteButton.layoutIfNeeded()
        deleteButton.backgroundColor = #colorLiteral(red: 0.4364689925, green: 0.09204080981, blue: 0, alpha: 1)
        deleteButton.makeRetroUI()
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        self.deleteButton = deleteButton
    }

    private func setupTimePicker() {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.locale = Locale(identifier: "ru_RU")
        view.addSubview(timePicker)
        timePicker.pinLeft(to: view, 10)
        timePicker.pinRight(to: view, 10)
        timePicker.pinTop(to: titleField!.bottomAnchor, 10)
        timePicker.layoutIfNeeded()
        timePicker.makeRetroUI()
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

extension AlarmModificationViewController: AlarmModificationViewDisplayLogic {
    func setupTime(time: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        let hours = time / 60
        let minutes = time % 60
        let date = dateFormatter.date(from: "\(hours/10)\(hours%10):\(minutes/10)\(minutes%10)")
        timePicker?.date = date!
    }
}
