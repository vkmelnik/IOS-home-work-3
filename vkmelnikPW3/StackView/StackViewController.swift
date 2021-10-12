//
//  StackViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol StackViewDisplayLogic {
    
}

class StackViewController: UIViewController {
    
    private var interactor: StackViewBuisnessLogic?
    private var stackView: UIStackView?
    private var alarmsCount: Int = 20
    
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
        stackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: CGFloat(alarmsCount) * 55.0)
        stackView.spacing = 5
        self.stackView = stackView
        for _ in 0..<alarmsCount {
            addAlarmToStack()
        }
        // Setup scroll view.
        scrollView.setWidth(to: view.frame.width)
        scrollView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        scrollView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: stackView.frame.height)
        scrollView.alwaysBounceVertical = true
    }
    
    func setupScrollView(scrollView: UIScrollView) {
        
    }

    func addAlarmToStack() {
        let alarmView = AlarmView()
        stackView!.addArrangedSubview(alarmView)
        alarmView.pinRight(to: stackView!)
        alarmView.pinLeft(to: stackView!)
    }
}

extension StackViewController: StackViewDisplayLogic {
    
}
