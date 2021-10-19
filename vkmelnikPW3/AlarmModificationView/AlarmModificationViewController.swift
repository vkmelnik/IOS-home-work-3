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
        interactor?.modifyAlarm(newTime: time)
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
        doneButton.backgroundColor = #colorLiteral(red: 0, green: 0.5490196078, blue: 1, alpha: 1)
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
        deleteButton.backgroundColor = #colorLiteral(red: 0.7249053752, green: 0.1528651036, blue: 0, alpha: 1)
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
        timePicker.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 10)
        timePicker.layoutIfNeeded()
        timePicker.makeRetroUI()
        self.timePicker = timePicker
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
