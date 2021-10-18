//
//  AlarmCollectionViewCell.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

class AlarmCollectionViewCell: UICollectionViewCell {
    
    public var alarmView: AlarmView?
    
    func setupAlarmView(alarmModel: AlarmModel) {
        setHeight(to: 50)
        contentView.setHeight(to: 50)
        let view = AlarmView(alarm: alarmModel)
        contentView.addSubview(view)
        view.pin(to: contentView)
        self.alarmView = view
        view.layer.cornerRadius = 15
    }
    
    override func prepareForReuse() {
        for subview in subviews {
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
    }
}
