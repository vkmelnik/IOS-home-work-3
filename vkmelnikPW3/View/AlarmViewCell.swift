//
//  AlarmViewCell.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 14.10.2021.
//

import UIKit

class AlarmViewCell: UITableViewCell {
    
    public var alarmView: AlarmView?
    
    func setupAlarmView(alarmModel: AlarmModel) {
        setHeight(to: 90)
        contentView.setHeight(to: 90)
        let view = AlarmView(alarm: alarmModel)
        contentView.addSubview(view)
        view.pin(to: contentView)
        self.alarmView = view
    }
    
    override func prepareForReuse() {
        for subview in subviews {
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
    }

}
