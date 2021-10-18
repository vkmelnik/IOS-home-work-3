//
//  AlarmView.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

class AlarmView: UIView {

    public var toggle: UISwitch?
    private var time: UILabel?
    public var alarmModel: AlarmModel?
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 70))
        setupAlarmView()
    }
    
    convenience init(alarm: AlarmModel) {
        self.init()
        self.alarmModel = alarm
        toggle?.isOn = alarmModel!.isActive
        let hours = alarmModel!.time / 60
        let minutes = alarmModel!.time % 60
        time?.text = "\(hours / 10)\(hours % 10):\(minutes / 10)\(minutes % 10)"
    }
    
    func setupAlarmView() {
        let toggle = UISwitch()
        let time = UILabel()
        time.text = "00:00"
        self.addSubview(toggle)
        self.addSubview(time)
        toggle.pinRight(to: self, 10)
        toggle.pinBottom(to: self, 10)
        time.pinLeft(to: self, 10)
        time.pinTop(to: self, 10)
        time.setHeight(to: 30)
        toggle.onTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        self.toggle = toggle
        self.time = time
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
