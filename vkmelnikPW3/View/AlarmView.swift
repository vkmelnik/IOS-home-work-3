//
//  AlarmView.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

// View that displays alarm and allows to turn it on/off.
class AlarmView: UIView {

    public var toggle: UISwitch?
    private var title: UILabel?
    private var time: UILabel?
    public var gradient: CAGradientLayer?
    public var alarmModel: AlarmModel?
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        let gradient = setupGradientBackground()
        self.layer.masksToBounds = true
        self.layer.addSublayer(gradient)
        self.gradient = gradient
        setupAlarmView()
    }
    
    public var alarmTitle: String {
        get {
            return self.title?.text ?? ""
        }
        
        set(newTitle) {
            self.title?.text = newTitle
        }
    }
    
    override var bounds: CGRect {
        didSet {
            self.layer.sublayers![0].removeFromSuperlayer()
            self.gradient = setupGradientBackground()
            self.layer.insertSublayer(setupGradientBackground(), at: 0)
        }
    }
    
    convenience init(alarm: AlarmModel) {
        self.init()
        self.alarmModel = alarm
        toggle?.isOn = alarmModel!.isActive
        let hours = alarmModel!.time / 60
        let minutes = alarmModel!.time % 60
        time?.text = "\(hours / 10)\(hours % 10):\(minutes / 10)\(minutes % 10)"
        alarmTitle = alarm.title!
    }
    
    func setupAlarmView() {
        let toggle = UISwitch()
        toggle.makeRetroUI()
        let time = UILabel()
        time.text = "00:00"
        time.font = .boldSystemFont(ofSize: 35)
        self.addSubview(toggle)
        self.addSubview(time)
        toggle.pinRight(to: self, 10)
        toggle.pinBottom(to: self, 10)
        time.pinLeft(to: self, 15)
        time.pinTop(to: self, 15)
        time.setHeight(to: 30)
        self.toggle = toggle
        self.time = time
        
        setupTitle()
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setupTitle() {
        let title = UILabel()
        title.text = "Alarm"
        title.textColor = .darkGray
        self.addSubview(title)
        title.pinLeft(to: self, 15)
        title.pinTop(to: time!.bottomAnchor, 7)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
