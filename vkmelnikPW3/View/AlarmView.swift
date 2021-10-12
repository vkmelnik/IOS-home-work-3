//
//  AlarmView.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

class AlarmView: UIView {

    private var toggle: UISwitch?
    private var time: UILabel?
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 70))
        setupAlarmView()
    }
    
    func setupAlarmView() {
        let toggle = UISwitch()
        let time = UILabel()
        time.text = "00:00"
        self.addSubview(toggle)
        self.addSubview(time)
        toggle.pinRight(to: self, 10)
        toggle.pinTop(to: self, 10)
        time.pinLeft(to: self, 10)
        time.pinTop(to: self, 10)
        time.setHeight(to: 30)
        self.toggle = toggle
        self.time = time
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
