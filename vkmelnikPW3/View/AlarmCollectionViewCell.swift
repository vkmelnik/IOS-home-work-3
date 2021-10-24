//
//  AlarmCollectionViewCell.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 18.10.2021.
//

import UIKit

// Alarm view cell for UICollectionView.
class AlarmCollectionViewCell: UICollectionViewCell {
    
    public var alarmView: AlarmView?
    
    func setupAlarmView(alarmModel: AlarmModel) {
        setHeight(to: 120)
        contentView.setHeight(to: 120)
        let view = AlarmView(alarm: alarmModel)
        contentView.addSubview(view)
        view.pin(to: contentView)
        view.layer.cornerRadius = 15
        self.alarmView = view
        self.layer.cornerRadius = 15
    }
    
    override var bounds: CGRect {
        didSet {
            alarmView?.gradient?.cornerRadius = 15
        }
    }
    
    override func prepareForReuse() {
        for subview in subviews {
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
    }
}
