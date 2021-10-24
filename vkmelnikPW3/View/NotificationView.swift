//
//  NotificationView.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 19.10.2021.
//

import UIKit

// View for displaying notifications inside app.
// This view does not relate to usual notifications.
class NotificationView: UIView {
    private var titleLabel: UILabel?
    private var textLabel: UILabel?
    
    public var title: String {
        get {
            return titleLabel?.text ?? ""
        }
        
        set(newValue) {
            titleLabel?.text = newValue
        }
    }
    
    public var text: String {
        get {
            return textLabel?.text ?? ""
        }
        
        set(newValue) {
            textLabel?.text = newValue
        }
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        self.backgroundColor = #colorLiteral(red: 0.08575024456, green: 0.08575024456, blue: 0.08575024456, alpha: 0.8248187689)
        let gradient = getReflection2()
        //self.layer.masksToBounds = true
        self.layer.addSublayer(gradient)
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 20
        setupLabels()
    }
    
    override var bounds: CGRect {
        didSet {
            self.layer.sublayers![0].removeFromSuperlayer()
            self.layer.insertSublayer(getReflection2(), at: 0)
        }
    }
    
    func showAnimation() {
        let initialFrame = self.frame
        self.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            var newFrame = initialFrame
            newFrame.origin.y += 140
            self.frame = newFrame
        }, completion: { finished in UIView.animate(withDuration: 0.5, delay: 1.0, options: [], animations: {
            var lastFrame = self.frame
            lastFrame.origin.y -= 140
            self.frame = lastFrame
        }, completion: { finished in
            self.isHidden = true
        })
        })
    }
    
    func setupLabels() {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 18)
        self.addSubview(titleLabel)
        titleLabel.pinLeft(to: self, 20)
        titleLabel.pinTop(to: self, 18)
        
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.font = .preferredFont(forTextStyle: .body)
        self.addSubview(textLabel)
        textLabel.pinLeft(to: self, 20)
        textLabel.pinTop(to: titleLabel.bottomAnchor, 5)
        
        self.titleLabel = titleLabel
        self.textLabel = textLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
