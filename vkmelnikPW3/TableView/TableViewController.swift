//
//  TableViewController.swift
//  vkmelnikPW3
//
//  Created by Vsevolod Melnik on 11.10.2021.
//

import UIKit

protocol TableViewDisplayLogic {
    
}

class TableViewController: UIViewController {
    
    private var interactor: TableViewBuisnessLogic?
    private var tableView: UITableView?
    
    func setupViewController(interactor: TableViewBuisnessLogic) {
        self.interactor = interactor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupRetroBackground()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView?.reloadData()
    }

    private func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 10)
        tableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 10)
        tableView.pinLeft(to: view, 10)
        tableView.pinRight(to: view, 10)
        tableView.layer.cornerRadius = 15
        tableView.backgroundColor = .clear
        self.tableView = tableView
        tableView.register(AlarmViewCell.self, forCellReuseIdentifier: "alarmViewCell")
        tableView.delegate = interactor?.getTableViewDelegate()
        tableView.dataSource = interactor?.getTableViewDataSource()
    }

}

extension TableViewController: TableViewDisplayLogic {
    
}
