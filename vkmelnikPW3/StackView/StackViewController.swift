//
//  StackViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol StackViewDisplayLogic {
    func addAlarmToStack(alarm: AlarmModel, index: Int)
}

class StackViewController: UIViewController {
    
    private var interactor: StackViewBuisnessLogic?
    private var stackView: UIStackView?
    
    func setupViewController(interactor: StackViewBuisnessLogic) {
        self.interactor = interactor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemTeal
        setupStackView()
    }
    
    func setupStackView() {
        let scrollView = UIScrollView()
        let stackView = UIStackView()
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: CGFloat(interactor?.alarmsCount() ?? 0) * 50.0)
        stackView.spacing = 0
        self.stackView = stackView
        interactor?.setupStackView()
        // Setup scroll view.
        scrollView.setWidth(to: view.frame.width)
        scrollView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        scrollView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: stackView.frame.height)
        scrollView.alwaysBounceVertical = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (interactor?.alarmsUpdated() ?? false) {
            clearStackView()
            stackView!.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: CGFloat(interactor?.alarmsCount() ?? 0) * 50.0)
            interactor?.setupStackView()
            interactor?.viewUpdated()
        }
    }
    
    func clearStackView() {
        for subview in stackView!.arrangedSubviews {
            stackView?.removeArrangedSubview(subview)
        }
    }
    
    func setupScrollView(scrollView: UIScrollView) {
        
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        interactor?.switchChanged(index: mySwitch.tag, value: mySwitch.isOn)
    }
}

extension StackViewController: StackViewDisplayLogic {
    func addAlarmToStack(alarm: AlarmModel, index: Int) {
        let alarmView = AlarmView(alarm: alarm)
        alarmView.toggle?.tag = index
        alarmView.toggle?.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        stackView!.addArrangedSubview(alarmView)
        alarmView.pinRight(to: stackView!)
        alarmView.pinLeft(to: stackView!)
    }
}
